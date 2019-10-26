# 1 "src/field/field_player_avatar.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/field_player_avatar.c"
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
# 2 "src/field/field_player_avatar.c" 2
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
# 3 "src/field/field_player_avatar.c" 2
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
# 4 "src/field/field_player_avatar.c" 2
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
# 5 "src/field/field_player_avatar.c" 2
# 1 "include/field_effect.h" 1






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
# 6 "src/field/field_player_avatar.c" 2
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
# 7 "src/field/field_player_avatar.c" 2
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
# 8 "src/field/field_player_avatar.c" 2
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
# 9 "src/field/field_player_avatar.c" 2
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
# 10 "src/field/field_player_avatar.c" 2
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
# 11 "src/field/field_player_avatar.c" 2
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
# 12 "src/field/field_player_avatar.c" 2
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
# 13 "src/field/field_player_avatar.c" 2
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
# 14 "src/field/field_player_avatar.c" 2
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
# 15 "src/field/field_player_avatar.c" 2
# 1 "include/party_menu.h" 1



# 1 "include/menu.h" 1
# 5 "include/party_menu.h" 2



enum
{
    PARTY_MENU_TYPE_STANDARD,
    PARTY_MENU_TYPE_BATTLE,
    PARTY_MENU_TYPE_CONTEST,
    PARTY_MENU_TYPE_IN_GAME_TRADE,
    PARTY_MENU_TYPE_BATTLE_TOWER,
    PARTY_MENU_TYPE_LINK_MULTI_BATTLE,
    PARTY_MENU_TYPE_DAYCARE,
    PARTY_MENU_TYPE_MOVE_TUTOR,
};


enum
{
    PARTY_MENU_LAYOUT_STANDARD,
    PARTY_MENU_LAYOUT_DOUBLE_BATTLE,
    PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE,
    PARTY_MENU_LAYOUT_MULTI_BATTLE,
};

struct PartyPopupMenu
{
           u8 numChoices;
           u8 width;
           const u8 *items;
};



struct Unk201B000
{
    struct Pokemon unk0[6];
    u8 menuType;
    u8 promptTextId;
    u8 filler25A[2];
    TaskFunc menuHandler;
    u8 menuHandlerTaskId;
    u8 unk261;
    u8 unk262;
    u8 unk263;

    s16 statGrowths[6 * 2];
    u8 filler27C[2];
    s16 unk27E;
    s16 unk280;
    s16 unk282;
};

struct Struct201B000
{
    u8 filler0[0x259];
    u8 promptTextId;
    u8 filler25A[6];
    u8 menuHandlerTaskId;
    u8 unk261;
    u8 unk262;
    s16 setupState;
    s16 monIndex;
    s16 unk268;
    u8 filler26A[8];
    u16 unk272;
    u8 filler274[14];
    u16 unk282;
};

struct Unk2001000
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    s16 unk8;
    s16 unkA;
    TaskFunc unkC;
    u16 array[53561];
};

struct UnknownPokemonStruct2
{
             u16 species;
             u16 heldItem;
             u8 nickname[11];
             u8 level;
             u16 hp;
             u16 maxhp;
             u32 status;
             u32 personality;
             u8 gender;
             u8 language;
};

void CB2_PartyMenuMain(void);
void ChangeBattleTowerPartyMenuSelection(u8 taskId, s8 directionPressed);
void SetPartyMenuSettings(u8 menuType, u8 battleTypeFlags, TaskFunc menuHandlerFunc, u8 textId);
void OpenPartyMenu(u8 menuType, u8 battleFlags);
bool8 InitPartyMenu(void);
bool8 IsLinkDoubleBattle(void);
u8 DrawPartyMonBackground(u8);
void sub_806B908(void);
void sub_806BC3C(u8, u8);
void sub_806BCE8(void);
u8 sub_806BD58(u8, u8);
u8 sub_806BD58(u8, u8);
u16 HandleDefaultPartyMenuInput(u8 taskId);
u16 HandleBattleTowerPartyMenuInput(u8 taskId);
void task_pc_turn_off(const u8 *a, u8 b);
void ChangePartyMenuSelection(u8 taskId, s8 directionPressed);
void SelectBattleTowerOKButton(u8 taskId);
void sub_806C994(u8 taskId, u8 b);
u8 sub_806CA38(u8 taskID);
void HandlePartyMenuSwitchPokemonInput(u8 taskId);
void sub_806CCE4(void);
void sub_806CD44(u8 taskId);
void sub_806D3B4(u8 taskId, u16 species1, u16 species2);
void sub_806D4AC(u8 taskId, u16 species, u8 c);
void sub_806D50C(u8 taskId, u8 monIndex);
void PrintPartyMenuPromptText(u8 textId, u8 b);
void sub_806D5A4(void);
void SetMonIconAnim(u8 spriteId, struct Pokemon *pokemon);
void CreatePartyMenuMonIcon(u8 taskId, u8 monIndex, u8 c, struct Pokemon *pokemon);
void TryCreatePartyMenuMonIcon(u8 a, u8 monIndex, struct Pokemon *pokemon);
void LoadHeldItemIconGraphics(void);
void PartyMenuTryGiveMonHeldItem(u8 taskId, u16 newItem, TaskFunc c);
void SetMonIconSpriteId(u8 taskId, u8 monIndex, u8 spriteId);
void CreateHeldItemIcon_806DCD4(u8 taskId, u8 monIndex, u16 item);
void CreateHeldItemIcons_806DC34(u8 taskId);
void CreateHeldItemIcons(u8 *a, u8 *b, u8 c);
void SetHeldItemIconVisibility(u8 a, u8 monIndex);
void PartyMenuDoPrintMonNickname(u8 monIndex, int b, const u8 *nameBuffer);
void PrintPartyMenuMonNickname(u8 monIndex, u8 b, struct Pokemon *pokemon);
void PrintPartyMenuMonNicknames(void);
void CreateMonIcon_LinkMultiBattle(u8 taskId, u8 monIndex, u8 menuType, struct UnknownPokemonStruct2 *pokemon);
u8 *GetMonNickname(struct Pokemon *pokemon, u8 *stringBuffer);
void PartyMenuPutStatusTilemap(u8 monIndex, u8 b, u8 status);
void PartyMenuDoPrintLevel(u8 monIndex, u8 b, u8 level);
void PartyMenuPrintLevel(u8 monIndex, u8 b, struct Pokemon *pokemon);
void PartyMenuPrintMonLevelOrStatus(u8 monIndex, struct Pokemon *pokemon);
void PartyMenuPrintMonsLevelOrStatus(void);
void PartyMenuDoPrintGenderIcon(u16 species, u8 gender, u8 c, u8 monIndex, u8 *nickname);
void PartyMenuPrintGenderIcon(u8 monIndex, u8 b, struct Pokemon *pokemon);
void PartyMenuDoPrintHP(u8 monIndex, u8 b, u16 currentHP, u16 maxHP);
void PartyMenuTryPrintMonsHP(void);
void nullsub_13(void);
void PartyMenuDoDrawHPBar(u8 monIndex, u8 b, u16 currentHP, u16 maxHP);
void PartyMenuDrawHPBar(u8 monIndex, u8 b, struct Pokemon *pokemon);
void PartyMenuTryDrawHPBar(u8 monIndex, struct Pokemon *pokemon);
void PartyMenuDrawHPBars(void);
void SwapPokemon(struct Pokemon *a, struct Pokemon *b);
void SetPartyPopupMenuOffsets(u8 menuIndex, u8 *left, u8 *top, const struct PartyPopupMenu *menu);
void ShowPartyPopupMenu(u8 menuIndex, const struct PartyPopupMenu *menu, const struct MenuAction2 *menuActions, u8 cursorPos);
void ClosePartyPopupMenu(u8 index, const struct PartyPopupMenu *menu);
TaskFunc PartyMenuGetPopupMenuFunc(u8 menuIndex, const struct PartyPopupMenu *menus, const struct MenuAction2 *menuActions, u8 itemIndex);
u8 sub_806E834(const u8 *message, u8 arg1);
void sub_806E8D0(u8 taskId, u16 b, TaskFunc c);
void party_menu_link_mon_held_item_object(u8);
void Task_ConfirmGiveHeldItem(u8);
void DisplayGiveHeldItemMessage(u8, u16, u8);
void DisplayTakeHeldItemMessage(u8, u16, u8);
void Task_ConfirmTakeHeldMail(u8);
u16 ItemIdToBattleMoveId(u16);
bool8 pokemon_has_move(struct Pokemon *, u16);
void TeachMonTMMove(u8, u16, TaskFunc);
void Task_TeamMonTMMove(u8);
void Task_TeamMonTMMove2(u8);
void Task_TeamMonTMMove3(u8);
void Task_TeamMonTMMove4(u8);
void sub_806F358(u8);
void sub_806F390(u8);
void sub_806F44C(u8);
void TMMoveUpdateMoveSlot(u8);
void StopTryingToTeachMove_806F614(u8);
void StopTryingToTeachMove_806F67C(u8);
void StopTryingToTeachMove_806F6B4(u8);
void sub_806F8AC(u8 taskId);
void sub_806FA18(u8 taskId);
void sub_806FB0C(u8 taskId);
void sub_806FB44(u8);
void PartyMenuUpdateLevelOrStatus(struct Pokemon *, u8);
void GetMedicineItemEffectMessage(u16);
bool8 ExecuteTableBasedItemEffect__(u8, u16, u8);
void UseMedicine(u8, u16, TaskFunc);
bool8 IsBlueYellowRedFlute(u16);
void sub_8070048(u8, u16, TaskFunc);
void sub_8070088(u8);
void sub_80701DC(u8 taskId);
void DoPPRecoveryItemEffect(u8, u16, TaskFunc);
void DoRecoverPP(u8);
void DoPPUpItemEffect(u8, u16, TaskFunc);
void DoRareCandyItemEffect(u8, u16, TaskFunc);
void Task_RareCandy1(u8);
void Task_RareCandy2(u8);
void PrintStatGrowthsInLevelUpWindow(u8 taskId);
void PrintNewStatsInLevelUpWindow(u8 taskId);
void RedrawPokemonInfoInMenu(u8, struct Pokemon *);
void Task_RareCandy3(u8);
void TeachMonMoveInPartyMenu(u8);
void DoEvolutionStoneItemEffect(u8 taskId, u16 evolutionStoneItem, TaskFunc c);
u8 GetItemEffectType(u16 item);
void SetupDefaultPartyMenuSwitchPokemon(u8 taskId);
void sub_806CD5C(u8 taskId);
void DoTakeMail(u8 taskId, TaskFunc func);
void PartyMenuTryGiveMonHeldItem_806ECE8(u8 taskId, TaskFunc func);
void PartyMenuTryGiveMonMail(u8 taskId, TaskFunc func);
void sub_806D668(u8 monIndex);
void TaughtMove(u8 taskId);
void StopTryingToTeachMove_806F588(u8 taskId);
# 16 "src/field/field_player_avatar.c" 2
# 1 "include/rng.h" 1



extern u32 gRngValue;


u16 Random(void);





void SeedRng(u16 seed);
# 17 "src/field/field_player_avatar.c" 2
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
# 18 "src/field/field_player_avatar.c" 2
# 1 "include/rotating_gate.h" 1



void RotatingGatePuzzleCameraUpdate(s16, s16);
void RotatingGate_InitPuzzleAndGraphics();
u32 CheckForRotatingGatePuzzleCollision(u8, s16, s16);
# 19 "src/field/field_player_avatar.c" 2
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
# 20 "src/field/field_player_avatar.c" 2
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
# 21 "src/field/field_player_avatar.c" 2
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
# 22 "src/field/field_player_avatar.c" 2
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
# 23 "src/field/field_player_avatar.c" 2
# 1 "include/task.h" 1
# 24 "src/field/field_player_avatar.c" 2
# 1 "include/tv.h" 1



enum
{
    TVSHOW_FAN_CLUB_LETTER = 1,
    TVSHOW_RECENT_HAPPENINGS,
    TVSHOW_PKMN_FAN_CLUB_OPINIONS,
    TVSHOW_UNKN_SHOWTYPE_04,
    TVSHOW_NAME_RATER_SHOW,
    TVSHOW_BRAVO_TRAINER_POKEMON_PROFILE,
    TVSHOW_BRAVO_TRAINER_BATTLE_TOWER_PROFILE,
    TVSHOW_POKEMON_TODAY_CAUGHT = 21,
    TVSHOW_SMART_SHOPPER,
    TVSHOW_POKEMON_TODAY_FAILED,
    TVSHOW_FISHING_ADVICE,
    TVSHOW_WORLD_OF_MASTERS,
    TVSHOW_MASS_OUTBREAK = 41,
};

void ClearTVShowData(void);
u8 sub_80BDEAC(u8 *);
void sub_80BE028(void);
void sub_80BE074(void);
void sub_80BE138(TVShow *show);
void sub_80BE160(TVShow *show);
void sub_80BE160(TVShow *);
void sub_80BE188(void);
void sub_80BE320(void);
void StartMassOutbreak(void);
void sub_80BE5FC(void);
void sub_80BE65C(void);
void sub_80BE6A0(void);
void nullsub_21(void);
void sub_80BE778(void);
void sub_80BE8EC(u16);
void UpdateMassOutbreakTimeLeft(u16);
void sub_80BE97C(u8);
void sub_80BE9D4();
void sub_80BEA50(u16);
void sub_80BEA5C(u16);
void sub_80BEA88(void);
void sub_80BEA88(void);
void sub_80BEB20(void);
int sub_80BEBC8(struct UnknownSaveStruct2ABC *arg0);
extern void sub_80BEBF4(void);
void sub_80BEC10(u8);
bool8 GetPriceReduction(u8);
bool8 IsPriceDiscounted(u8);
bool8 sub_80BEE48(u8);
void sub_80BEE84(u16);
size_t sub_80BF0B8(int);
bool8 sub_80BF1B4(u8);
void sub_80BF20C(void);
void sub_80BF334(void);
void sub_80BF3A4(void);
void sub_80BF3DC(void);
void sub_80BF46C(void);
void sub_80BF478(void);
void sub_80BF478(void);
void sub_80BF484(void);
void sub_80BF4BC(void);
void sub_80BF55C(TVShow tvShow[], u8 showidx);
void sub_80BF55C(TVShow tvShow[], u8 showidx);
void sub_80BF588(TVShow tvShows[]);
u16 sub_80BF674(u16 species);
void sub_80BF6D8(void);
s8 sub_80BF720(TVShow *);
s8 sub_80BF74C(TVShow tvShow[]);
bool8 sub_80BF77C(u16);
bool8 sub_80BF77C(u16);
u32 GetPlayerTrainerId(void);
void sub_80BFD44(u8 *, u32, u8);
u8 sub_80C004C(TVShow *tv1, TVShow *tv2, u8 idx);
u8 sub_80C00B4(TVShow *tv1, TVShow *tv2, u8 idx);
u8 sub_80C0134(TVShow *tv1, TVShow *tv2, u8 idx);
s8 sub_80C019C(TVShow tvShows[]);
void sub_80C01D4(void);
void sub_80C03A8(u8 showidx);
void sub_80C03C8(u16 species, u8 showidx);
void sub_80C0408(void);
bool8 sub_80C06E8(struct UnknownSaveStruct2ABC *arg0, struct UnknownSaveStruct2ABC *arg1, s8 arg2);
void TVShowConvertInternationalString(u8 *, u8 *, u8);
void DoTVShowTheNameRaterShow(void);
void DoTVShowPokemonTodaySuccessfulCapture(void);
void DoTVShowPokemonTodayFailedCapture(void);
void DoTVShowPokemonFanClubLetter(void);
void DoTVShowRecentHappenings(void);
void DoTVShowPokemonFanClubOpinions(void);
void nullsub_22(void);
void DoTVShowPokemonNewsMassOutbreak(void);
void DoTVShowPokemonAngler(void);
void DoTVShowTheWorldOfMasters(void);
void TVShowDone(void);
void UpdateTVScreensOnMap(int, int);
void ResetGabbyAndTy(void);
void TakeTVShowInSearchOfTrainersOffTheAir(void);
extern u8 GabbyAndTyGetBattleNum(void);
void sub_80C04A0(void);
void sub_80C0514(void *, u32, u8);
void DoTVShowBravoTrainerPokemonProfile(void);
void DoTVShowBravoTrainerBattleTowerProfile(void);
void DoTVShowTodaysSmartShopper(void);
void sub_80BE3BC(void);
void UpdateTVShowsPerDay(u16);
void sub_80C045C();
void sub_80BF088(u8, s32);
void sub_80BFD20(void);
# 25 "src/field/field_player_avatar.c" 2
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
# 26 "src/field/field_player_avatar.c" 2

__attribute__((section("ewram_data"))) struct PlayerAvatar gPlayerAvatar = {0};


static bool8 sub_8058854(struct MapObject *, u8);
static void npc_clear_strange_bits(struct MapObject *a);
static void MovePlayerAvatarUsingKeypadInput(u8 a, u16 b, u16 c);
static void PlayerAllowForcedMovementIfMovingSameDirection(void);
static bool8 TryDoMetatileBehaviorForcedMovement(void);
static u8 GetForcedMovementByMetatileBehavior(void);
static void MovePlayerNotOnBike(u8 a, u16 b);
static u8 CheckMovementInputNotOnBike(u8 a);
static u8 CheckForPlayerAvatarCollision(u8 a);
static u8 sub_8058EF0(s16 a, s16 b, u8 c);
static bool8 ShouldJumpLedge(s16 a, s16 b, u8 c);
static u8 sub_8058F6C(s16 a, s16 b, u8 c);
static void check_acro_bike_metatile(int unused1, int unused2, u8 c, u8 *d);
static void DoPlayerAvatarTransition(void);
static bool8 player_is_anim_in_certain_ranges(void);
static bool8 sub_80592A4(void);
static bool8 PlayerIsAnimActive(void);
static bool8 PlayerCheckIfAnimFinishedOrInactive(void);
static void PlayerNotOnBikeCollide(u8 a);
static void PlayCollisionSoundIfNotFacingWarp(u8 a);
static void sub_8059D60(struct MapObject *a);
static void StartStrengthAnim(u8 a, u8 b);
static void DoPlayerMatJump(void);
static void sub_805A06C(void);

static bool8 (*const gUnknown_0830FB58[])(u8) =
{
    MetatileBehavior_IsTrickHouseSlipperyFloor,
    MetatileBehavior_IsIce_2,
    MetatileBehavior_IsWalkSouth,
    MetatileBehavior_IsWalkNorth,
    MetatileBehavior_IsWalkWest,
    MetatileBehavior_IsWalkEast,
    MetatileBehavior_IsSouthwardCurrent,
    MetatileBehavior_IsNorthwardCurrent,
    MetatileBehavior_IsWestwardCurrent,
    MetatileBehavior_IsEastwardCurrent,
    MetatileBehavior_IsSlideSouth,
    MetatileBehavior_IsSlideNorth,
    MetatileBehavior_IsSlideWest,
    MetatileBehavior_IsSlideEast,
    MetatileBehavior_IsWaterfall,
    MetatileBehavior_0xBB,
    MetatileBehavior_0xBC,
    MetatileBehavior_IsMuddySlope,
};
static bool8 (*const gUnknown_0830FBA0[])(void) =
{
    ForcedMovement_None,
    ForcedMovement_Slip,
    ForcedMovement_Slip,
    sub_8058AAC,
    sub_8058AC4,
    sub_8058ADC,
    sub_8058AF4,
    sub_8058B0C,
    sub_8058B24,
    sub_8058B3C,
    sub_8058B54,
    ForcedMovement_SlideSouth,
    ForcedMovement_SlideNorth,
    ForcedMovement_SlideWest,
    ForcedMovement_SlideEast,
    sub_8058B0C,
    ForcedMovement_MatJump,
    sub_8058C10,
    ForcedMovement_MuddySlope,
};
static void (*const gUnknown_0830FBEC[])(u8, u16) =
{
    PlayerNotOnBikeNotMoving,
    PlayerNotOnBikeTurningInPlace,
    sub_8058D0C,
};
static bool8 (*const gUnknown_0830FBF8[])(u8) =
{
    MetatileBehavior_IsBumpySlope,
    MetatileBehavior_IsIsolatedVerticalRail,
    MetatileBehavior_IsIsolatedHorizontalRail,
    MetatileBehavior_IsVerticalRail,
    MetatileBehavior_IsHorizontalRail,
};
static const u8 gUnknown_0830FC0C[] = {9, 10, 11, 12, 13};
static void (*const gUnknown_0830FC14[])(struct MapObject *) =
{
    PlayerAvatarTransition_Normal,
    PlayerAvatarTransition_MachBike,
    PlayerAvatarTransition_AcroBike,
    PlayerAvatarTransition_Surfing,
    PlayerAvatarTransition_Underwater,
    sub_80591F4,
    nullsub_49,
    nullsub_49,
};
static bool8 (*const gUnknown_0830FC34[])(u8) =
{
    MetatileBehavior_IsSouthArrowWarp,
    MetatileBehavior_IsNorthArrowWarp,
    MetatileBehavior_IsWestArrowWarp,
    MetatileBehavior_IsEastArrowWarp,
};
static const u8 sRivalAvatarGfxIds[][2] =
{
    {MAP_OBJ_GFX_RIVAL_BRENDAN_NORMAL, MAP_OBJ_GFX_RIVAL_MAY_NORMAL},
    {MAP_OBJ_GFX_RIVAL_BRENDAN_MACH_BIKE, MAP_OBJ_GFX_RIVAL_MAY_MACH_BIKE},
    {MAP_OBJ_GFX_RIVAL_BRENDAN_ACRO_BIKE, MAP_OBJ_GFX_RIVAL_MAY_ACRO_BIKE},
    {MAP_OBJ_GFX_RIVAL_BRENDAN_SURFING, MAP_OBJ_GFX_RIVAL_MAY_SURFING},
    {MAP_OBJ_GFX_BRENDAN_UNDERWATER, MAP_OBJ_GFX_MAY_UNDERWATER},
    {MAP_OBJ_GFX_RIVAL_BRENDAN_FIELD_MOVE, MAP_OBJ_GFX_RIVAL_MAY_FIELD_MOVE},
    {MAP_OBJ_GFX_BRENDAN_FISHING, MAP_OBJ_GFX_MAY_FISHING},
    {MAP_OBJ_GFX_BRENDAN_WATERING, MAP_OBJ_GFX_MAY_WATERING},
};
static const u8 sPlayerAvatarGfxIds[][2] =
{
    {MAP_OBJ_GFX_BRENDAN_NORMAL, MAP_OBJ_GFX_MAY_NORMAL},
    {MAP_OBJ_GFX_BRENDAN_MACH_BIKE, MAP_OBJ_GFX_MAY_MACH_BIKE},
    {MAP_OBJ_GFX_BRENDAN_ACRO_BIKE, MAP_OBJ_GFX_MAY_ACRO_BIKE},
    {MAP_OBJ_GFX_BRENDAN_SURFING, MAP_OBJ_GFX_MAY_SURFING},
    {MAP_OBJ_GFX_BRENDAN_UNDERWATER, MAP_OBJ_GFX_MAY_UNDERWATER},
    {MAP_OBJ_GFX_BRENDAN_FIELD_MOVE, MAP_OBJ_GFX_MAY_FIELD_MOVE},
    {MAP_OBJ_GFX_BRENDAN_FISHING, MAP_OBJ_GFX_MAY_FISHING},
    {MAP_OBJ_GFX_BRENDAN_WATERING, MAP_OBJ_GFX_MAY_WATERING},
};
static const u8 gUnknown_0830FC64[2][5][2] =
{

    {
        {MAP_OBJ_GFX_BRENDAN_NORMAL, 1},
        {MAP_OBJ_GFX_BRENDAN_MACH_BIKE, 2},
        {MAP_OBJ_GFX_BRENDAN_ACRO_BIKE, 4},
        {MAP_OBJ_GFX_BRENDAN_SURFING, 8},
        {MAP_OBJ_GFX_BRENDAN_UNDERWATER, 16},
    },

    {
        {MAP_OBJ_GFX_MAY_NORMAL, 1},
        {MAP_OBJ_GFX_MAY_MACH_BIKE, 2},
        {MAP_OBJ_GFX_MAY_ACRO_BIKE, 4},
        {MAP_OBJ_GFX_MAY_SURFING, 8},
        {MAP_OBJ_GFX_MAY_UNDERWATER, 16},
    }
};
static bool8 (*const gUnknown_0830FC78[])(u8) =
{
    MetatileBehavior_IsSouthArrowWarp,
    MetatileBehavior_IsNorthArrowWarp,
    MetatileBehavior_IsWestArrowWarp,
    MetatileBehavior_IsEastArrowWarp,
};
static u8 (*const gUnknown_0830FC88[])(struct Task *, struct MapObject *, struct MapObject *) =
{
    sub_8059E84,
    sub_8059EA4,
    sub_8059F40,
};
static u8 (*const sPlayerAvatarSecretBaseMatJump[])(struct Task *, struct MapObject *) =
{
    PlayerAvatar_DoSecretBaseMatJump,
};
static u8 (*const gUnknown_0830FC98[])(struct Task *, struct MapObject *) =
{
    sub_805A0D8,
    sub_805A100,
    sub_805A178,
    sub_805A1B8,
};

static u8 sub_80587D8(struct MapObject *, struct Sprite *);void sub_80587B4(struct Sprite *sprite){ meta_step(&gMapObjects[sprite->data[0]], sprite, sub_80587D8);}static u8 sub_80587D8(struct MapObject *mapObject, struct Sprite *sprite){ return 0;};

void player_step(u8 direction, u16 newKeys, u16 heldKeys)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    sub_8059D60(playerMapObj);
    if (gPlayerAvatar.preventStep == 0)
    {
        Bike_TryAcroBikeHistoryUpdate(newKeys, heldKeys);
        if (!sub_8058854(playerMapObj, direction))
        {
            npc_clear_strange_bits(playerMapObj);
            DoPlayerAvatarTransition();
            if (TryDoMetatileBehaviorForcedMovement() == 0)
            {
                MovePlayerAvatarUsingKeypadInput(direction, newKeys, heldKeys);
                PlayerAllowForcedMovementIfMovingSameDirection();
            }
        }
    }
}

static bool8 sub_8058854(struct MapObject *playerMapObj, u8 direction)
{
    if (FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(playerMapObj)
     && !FieldObjectClearAnimIfSpecialAnimFinished(playerMapObj))
    {
        u8 specialAnim = FieldObjectGetSpecialAnim(playerMapObj);

        if (specialAnim > 24 && specialAnim < 29 && direction != DIR_NONE && playerMapObj->placeholder18 != direction)
        {
            FieldObjectClearAnim(playerMapObj);
            return 0;
        }
        else
        {
            return 1;
        }
    }
    return 0;
}

static void npc_clear_strange_bits(struct MapObject *a)
{
    a->mapobj_bit_12 = 0;
    a->mapobj_bit_10 = 0;
    a->mapobj_bit_9 = 0;
    gPlayerAvatar.flags &= ~(1 << 7);
}

static void MovePlayerAvatarUsingKeypadInput(u8 direction, u16 newKeys, u16 heldKeys)
{
    if ((gPlayerAvatar.flags & (1 << 1))
     || (gPlayerAvatar.flags & (1 << 2)))
        MovePlayerOnBike(direction, newKeys, heldKeys);
    else
        MovePlayerNotOnBike(direction, heldKeys);
}

static void PlayerAllowForcedMovementIfMovingSameDirection(void)
{
    if (gPlayerAvatar.runningState == MOVING)
        gPlayerAvatar.flags &= ~(1 << 5);
}

static bool8 TryDoMetatileBehaviorForcedMovement(void)
{
    return gUnknown_0830FBA0[GetForcedMovementByMetatileBehavior()]();
}

static u8 GetForcedMovementByMetatileBehavior(void)
{
    u8 i;

    if (!(gPlayerAvatar.flags & (1 << 5)))
    {
        u8 r5 = gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1E;

        for (i = 0; i < 18; i++)
        {
            if (gUnknown_0830FB58[i](r5))
                return i + 1;
        }
    }
    return 0;
}

bool8 ForcedMovement_None(void)
{
    if (gPlayerAvatar.flags & (1 << 6))
    {
        struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

        playerMapObj->mapobj_bit_9 = 0;
        playerMapObj->mapobj_bit_11 = 1;
        FieldObjectSetDirection(playerMapObj, playerMapObj->mapobj_unk_18);
        gPlayerAvatar.flags &= ~(1 << 6);
    }
    return 0;
}

static u8 DoForcedMovement(u8 direction, void (*b)(u8))
{
    struct PlayerAvatar *playerAvatar = &gPlayerAvatar;
    u8 collisionType = CheckForPlayerAvatarCollision(direction);

    playerAvatar->flags |= (1 << 6);
    if (collisionType != 0)
    {
        ForcedMovement_None();
        if (collisionType <= 4)
        {
            return 0;
        }
        else
        {
            if (collisionType == COLLISION_LEDGE_JUMP)
                PlayerJumpLedge(direction);
            playerAvatar->flags |= (1 << 6);
            playerAvatar->runningState = MOVING;
            return 1;
        }
    }
    else
    {
        playerAvatar->runningState = MOVING;
        b(direction);
        return 1;
    }
}

static u8 DoForcedMovementInCurrentDirection(void (*a)(u8))
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    playerMapObj->mapobj_bit_10 = 1;
    return DoForcedMovement(playerMapObj->placeholder18, a);
}

bool8 ForcedMovement_Slip(void)
{
    return DoForcedMovementInCurrentDirection(PlayerGoSpeed2);
}

bool8 sub_8058AAC(void)
{
    return DoForcedMovement(1, PlayerGoSpeed1);
}

bool8 sub_8058AC4(void)
{
    return DoForcedMovement(2, PlayerGoSpeed1);
}

bool8 sub_8058ADC(void)
{
    return DoForcedMovement(3, PlayerGoSpeed1);
}

bool8 sub_8058AF4(void)
{
    return DoForcedMovement(4, PlayerGoSpeed1);
}

bool8 sub_8058B0C(void)
{
    return DoForcedMovement(1, npc_use_some_d2s);
}

bool8 sub_8058B24(void)
{
    return DoForcedMovement(2, npc_use_some_d2s);
}

bool8 sub_8058B3C(void)
{
    return DoForcedMovement(3, npc_use_some_d2s);
}

bool8 sub_8058B54(void)
{
    return DoForcedMovement(4, npc_use_some_d2s);
}

static u8 ForcedMovement_Slide(u8 direction, void (*b)(u8))
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    playerMapObj->mapobj_bit_10 = 1;
    playerMapObj->mapobj_bit_9 = 1;
    return DoForcedMovement(direction, b);
}

bool8 ForcedMovement_SlideSouth(void)
{
    return ForcedMovement_Slide(1, PlayerGoSpeed2);
}

bool8 ForcedMovement_SlideNorth(void)
{
    return ForcedMovement_Slide(2, PlayerGoSpeed2);
}

bool8 ForcedMovement_SlideWest(void)
{
    return ForcedMovement_Slide(3, PlayerGoSpeed2);
}

bool8 ForcedMovement_SlideEast(void)
{
    return ForcedMovement_Slide(4, PlayerGoSpeed2);
}

bool8 ForcedMovement_MatJump(void)
{
    DoPlayerMatJump();
    return 1;
}

bool8 sub_8058C10(void)
{
    sub_805A06C();
    return 1;
}

bool8 ForcedMovement_MuddySlope(void)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (playerMapObj->placeholder18 != 2 || GetPlayerSpeed() <= 3)
    {
        Bike_UpdateBikeCounterSpeed(0);
        playerMapObj->mapobj_bit_9 = 1;
        return DoForcedMovement(1, PlayerGoSpeed2);
    }
    else
    {
        return 0;
    }
}

static void MovePlayerNotOnBike(u8 direction, u16 heldKeys)
{
    gUnknown_0830FBEC[CheckMovementInputNotOnBike(direction)](direction, heldKeys);
}

static u8 CheckMovementInputNotOnBike(u8 direction)
{
    if (direction == DIR_NONE)
    {
        gPlayerAvatar.runningState = NOT_MOVING;
        return 0;
    }
    else if (direction != player_get_direction_upper_nybble() && gPlayerAvatar.runningState != MOVING)
    {
        gPlayerAvatar.runningState = TURN_DIRECTION;
        return 1;
    }
    else
    {
        gPlayerAvatar.runningState = MOVING;
        return 2;
    }
}

void PlayerNotOnBikeNotMoving(u8 direction, u16 heldKeys)
{
    PlayerFaceDirection(player_get_direction_lower_nybble());
}

void PlayerNotOnBikeTurningInPlace(u8 direction, u16 heldKeys)
{
    PlayerTurnInPlace(direction);
}

void sub_8058D0C(u8 direction, u16 heldKeys)
{
    u8 r1 = CheckForPlayerAvatarCollision(direction);

    switch (r1)
    {
    case 6:
        PlayerJumpLedge(direction);
        return;
    default:
        if (r1 > 8 || r1 < 5)
            PlayerNotOnBikeCollide(direction);
        return;
    case 0:
        if (gPlayerAvatar.flags & (1 << 3))
        {

            PlayerGoSpeed2(direction);
            return;
        }
        if (!(gPlayerAvatar.flags & (1 << 4)) && (heldKeys & 0x0002) && FlagGet(0x860)
         && IsRunningDisallowed(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1E) == 0)
        {
            sub_805940C(direction);
            gPlayerAvatar.flags |= (1 << 7);
        }
        else
        {
            PlayerGoSpeed1(direction);
        }
    }
}

static u8 CheckForPlayerAvatarCollision(u8 direction)
{
    s16 x, y;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    x = playerMapObj->coords2.x;
    y = playerMapObj->coords2.y;
    MoveCoords(direction, &x, &y);

    return CheckForFieldObjectCollision(playerMapObj, x, y, direction, MapGridGetMetatileBehaviorAt(x, y));
}

u8 CheckForFieldObjectCollision(struct MapObject *a, s16 x, s16 y, u8 direction, u8 e)
{
    u8 collision;

    collision = npc_block_way(a, x, y, direction);
    if (collision == 3 && sub_8058EF0(x, y, direction))
        return 5;
    if (ShouldJumpLedge(x, y, direction))
    {
        IncrementGameStat(0x2B);
        return COLLISION_LEDGE_JUMP;
    }
    if (collision == 4 && sub_8058F6C(x, y, direction))
        return 7;

    if (collision == 0)
    {
        if (CheckForRotatingGatePuzzleCollision(direction, x, y))
            return 8;
        check_acro_bike_metatile(x, y, e, &collision);
    }
    return collision;
}

static u8 sub_8058EF0(s16 a, s16 b, u8 c)
{
    if ((gPlayerAvatar.flags & (1 << 3))
     && MapGridGetZCoordAt(a, b) == 3
     && GetFieldObjectIdByXYZ(a, b, 3) == 16)
    {
        sub_805A20C(c);
        return 1;
    }
    else
    {
        return 0;
    }
}

static bool8 ShouldJumpLedge(s16 a, s16 b, u8 c)
{
    if (GetLedgeJumpDirection(a, b, c) != 0)
        return 1;
    else
        return 0;
}

static u8 sub_8058F6C(s16 a, s16 b, u8 c)
{
    if (FlagGet(0x829))
    {
        u8 mapObjectId = GetFieldObjectIdByXY(a, b);

        if (mapObjectId != 16)
        {
            if (gMapObjects[mapObjectId].graphicsId == 0x57)
            {
                a = gMapObjects[mapObjectId].coords2.x;
                b = gMapObjects[mapObjectId].coords2.y;
                MoveCoords(c, &a, &b);
                if (npc_block_way(&gMapObjects[mapObjectId], a, b, c) == 0
                 && MetatileBehavior_IsNonAnimDoor(MapGridGetMetatileBehaviorAt(a, b)) == 0)
                {
                    StartStrengthAnim(mapObjectId, c);
                    return 1;
                }
            }
        }
    }
    return 0;
}

static void check_acro_bike_metatile(int unused1, int unused2, u8 c, u8 *d)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (gUnknown_0830FBF8[i](c))
        {
            *d = gUnknown_0830FC0C[i];
            return;
        }
    }
}

void SetPlayerAvatarTransitionFlags(u16 a)
{
    gPlayerAvatar.unk1 |= a;
    DoPlayerAvatarTransition();
}

static void DoPlayerAvatarTransition(void)
{
    u8 i;
    u32 flags = gPlayerAvatar.unk1;

    if (flags != 0)
    {
        for (i = 0; i < 8; i++, flags >>= 1)
        {






            if (flags & 1)
            {
                register void (*const *funcs)(struct MapObject *) asm("r0") = gUnknown_0830FC14;
                funcs[i](&gMapObjects[gPlayerAvatar.mapObjectId]);
            }

        }
        gPlayerAvatar.unk1 = 0;
    }
}

void nullsub_49(struct MapObject *a)
{
}

void PlayerAvatarTransition_Normal(struct MapObject *a)
{
    sub_805B980(a, GetPlayerAvatarGraphicsIdByStateId(0));
    FieldObjectTurn(a, a->placeholder18);
    SetPlayerAvatarStateMask(1);
}

void PlayerAvatarTransition_MachBike(struct MapObject *a)
{
    sub_805B980(a, GetPlayerAvatarGraphicsIdByStateId(1));
    FieldObjectTurn(a, a->placeholder18);
    SetPlayerAvatarStateMask(2);
    BikeClearState(0, 0);
}

void PlayerAvatarTransition_AcroBike(struct MapObject *a)
{
    sub_805B980(a, GetPlayerAvatarGraphicsIdByStateId(2));
    FieldObjectTurn(a, a->placeholder18);
    SetPlayerAvatarStateMask(4);
    BikeClearState(0, 0);
    Bike_HandleBumpySlopeJump();
}

void PlayerAvatarTransition_Surfing(struct MapObject *a)
{
    u8 unk;

    sub_805B980(a, GetPlayerAvatarGraphicsIdByStateId(3));
    FieldObjectTurn(a, a->placeholder18);
    SetPlayerAvatarStateMask(8);
    gFieldEffectArguments[0] = a->coords2.x;
    gFieldEffectArguments[1] = a->coords2.y;
    gFieldEffectArguments[2] = gPlayerAvatar.mapObjectId;
    unk = FieldEffectStart(FLDEFF_SURF_BLOB);
    a->mapobj_unk_1A = unk;
    sub_8127ED0(unk, 1);
}

void PlayerAvatarTransition_Underwater(struct MapObject *a)
{
    sub_805B980(a, GetPlayerAvatarGraphicsIdByStateId(4));
    FieldObjectTurn(a, a->placeholder18);
    SetPlayerAvatarStateMask(16);
    a->mapobj_unk_1A = sub_8128124(a->spriteId);
}

void sub_80591F4(struct MapObject *a)
{
    gPlayerAvatar.flags |= (1 << 5);
}

void sub_8059204(void)
{
    gPlayerAvatar.tileTransitionState = T_NOT_MOVING;
    if (PlayerIsAnimActive())
    {
        if (!PlayerCheckIfAnimFinishedOrInactive())
        {
            if (!player_is_anim_in_certain_ranges())
                gPlayerAvatar.tileTransitionState = T_TILE_TRANSITION;
        }
        else
        {
            if (!sub_80592A4())
                gPlayerAvatar.tileTransitionState = T_TILE_CENTER;
        }
    }
}

static bool8 player_is_anim_in_certain_ranges(void)
{
    u8 unk = gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1C;

    if (unk < 4
     || (unk >= 16 && unk < 0x15)
     || (unk >= 25 && unk < 41)
     || (unk >= 98 && unk < 110)
     || (unk >= 122 && unk < 126))
        return 1;
    else
        return 0;
}

static bool8 sub_80592A4(void)
{
    if (player_is_anim_in_certain_ranges() && gPlayerAvatar.runningState != TURN_DIRECTION)
        return 1;
    else
        return 0;
}

static bool8 PlayerIsAnimActive(void)
{
    return FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(&gMapObjects[gPlayerAvatar.mapObjectId]);
}

static bool8 PlayerCheckIfAnimFinishedOrInactive(void)
{
    return FieldObjectCheckIfSpecialAnimFinishedOrInactive(&gMapObjects[gPlayerAvatar.mapObjectId]);
}

static void player_set_x22(u8 a)
{
    gMapObjects[gPlayerAvatar.mapObjectId].animId = a;
}

u8 player_get_x22(void)
{
    return gMapObjects[gPlayerAvatar.mapObjectId].animId;
}

static void sub_8059348(u8 a)
{
    FieldObjectForceSetSpecialAnim(&gMapObjects[gPlayerAvatar.mapObjectId], a);
}

void PlayerSetAnimId(u8 animId, u8 b)
{
    if (!PlayerIsAnimActive())
    {
        player_set_x22(b);
        FieldObjectSetSpecialAnim(&gMapObjects[gPlayerAvatar.mapObjectId], animId);
    }
}


void PlayerGoSpeed1(u8 a)
{
    PlayerSetAnimId(GetGoSpeed0AnimId(a), 2);
}


void PlayerGoSpeed2(u8 a)
{
    PlayerSetAnimId(sub_8060744(a), 2);
}

void npc_use_some_d2s(u8 a)
{
    PlayerSetAnimId(d2s_08064034(a), 2);
}


void PlayerGoSpeed4(u8 a)
{
    PlayerSetAnimId(sub_806079C(a), 2);
}

void sub_805940C(u8 a)
{
    PlayerSetAnimId(sub_80607F4(a), 2);
}

void PlayerOnBikeCollide(u8 a)
{
    PlayCollisionSoundIfNotFacingWarp(a);
    PlayerSetAnimId(GetStepInPlaceDelay16AnimId(a), 2);
}

static void PlayerNotOnBikeCollide(u8 a)
{
    PlayCollisionSoundIfNotFacingWarp(a);
    PlayerSetAnimId(GetStepInPlaceDelay32AnimId(a), 2);
}

void PlayerFaceDirection(u8 direction)
{
    PlayerSetAnimId(GetFaceDirectionAnimId(direction), 1);
}

void PlayerTurnInPlace(u8 direction)
{
    PlayerSetAnimId(GetStepInPlaceDelay8AnimId(direction), 1);
}

void PlayerJumpLedge(u8 direction)
{
    PlaySE(SE_DANSA);
    PlayerSetAnimId(GetJumpLedgeAnimId(direction), 8);
}

void sub_80594C0(void)
{
    if (gPlayerAvatar.tileTransitionState == T_TILE_CENTER || gPlayerAvatar.tileTransitionState == T_NOT_MOVING)
    {
        if (player_should_look_direction_be_enforced_upon_movement())
            sub_8059348(GetFaceDirectionAnimId(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_18));
    }
}


void PlayerIdleWheelie(u8 a)
{
    PlayerSetAnimId(sub_80609D8(a), 1);
}


void PlayerStartWheelie(u8 a)
{
    PlayerSetAnimId(sub_8060A04(a), 1);
}


void PlayerEndWheelie(u8 a)
{
    PlayerSetAnimId(sub_8060A30(a), 1);
}


void PlayerStandingHoppingWheelie(u8 a)
{
    PlaySE(SE_JITE_PYOKO);
    PlayerSetAnimId(sub_8060A5C(a), 1);
}


void PlayerMovingHoppingWheelie(u8 a)
{
    PlaySE(SE_JITE_PYOKO);
    PlayerSetAnimId(sub_8060A88(a), 2);
}


void PlayerLedgeHoppingWheelie(u8 a)
{
    PlaySE(SE_JITE_PYOKO);
    PlayerSetAnimId(sub_8060AB4(a), 8);
}


void PlayerAcroTurnJump(u8 direction)
{
    PlaySE(SE_JITE_PYOKO);
    PlayerSetAnimId(sub_8060878(direction), 1);
}

void sub_80595DC(u8 direction)
{
    PlaySE(SE_WALL_HIT);
    PlayerSetAnimId(sub_8060AE0(direction), 2);
}

void sub_8059600(u8 a)
{
    PlayerSetAnimId(sub_8060B0C(a), 2);
}

void sub_8059618(u8 a)
{
    PlayerSetAnimId(sub_8060B38(a), 2);
}

void sub_8059630(u8 a)
{
    PlayerSetAnimId(sub_8060B64(a), 2);
}

static void PlayCollisionSoundIfNotFacingWarp(u8 a)
{
    s16 x, y;
    u8 unk = gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1E;

    if (!gUnknown_0830FC34[a - 1](unk))
    {
        if (a == 2)
        {
            PlayerGetDestCoords(&x, &y);
            MoveCoords(2, &x, &y);
            if (MetatileBehavior_IsWarpDoor(MapGridGetMetatileBehaviorAt(x, y)))
                return;
        }
        PlaySE(SE_WALL_HIT);
    }
}

void GetXYCoordsOneStepInFrontOfPlayer(s16 *x, s16 *y)
{
    *x = gMapObjects[gPlayerAvatar.mapObjectId].coords2.x;
    *y = gMapObjects[gPlayerAvatar.mapObjectId].coords2.y;
    MoveCoords(player_get_direction_lower_nybble(), x, y);
}

void PlayerGetDestCoords(s16 *x, s16 *y)
{
    *x = gMapObjects[gPlayerAvatar.mapObjectId].coords2.x;
    *y = gMapObjects[gPlayerAvatar.mapObjectId].coords2.y;
}

u8 player_get_direction_lower_nybble(void)
{
    return gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_18;
}

u8 player_get_direction_upper_nybble(void)
{
    return gMapObjects[gPlayerAvatar.mapObjectId].placeholder18;
}

u8 PlayerGetZCoord(void)
{
    return gMapObjects[gPlayerAvatar.mapObjectId].elevation;
}

void unref_sub_8059790(s16 a, s16 b)
{
    sub_805C058(&gMapObjects[gPlayerAvatar.mapObjectId], a, b);
}

u8 TestPlayerAvatarFlags(u8 a)
{
    return gPlayerAvatar.flags & a;
}

u8 sub_80597D0(void)
{
    return gPlayerAvatar.flags;
}

u8 GetPlayerAvatarObjectId(void)
{
    return gPlayerAvatar.spriteId;
}

void sub_80597E8(void)
{
    ForcedMovement_None();
}

void sub_80597F4(void)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    npc_clear_strange_bits(playerMapObj);
    FieldObjectSetDirection(playerMapObj, playerMapObj->mapobj_unk_18);
    if (TestPlayerAvatarFlags((1 << 1) | (1 << 2)))
    {
        Bike_HandleBumpySlopeJump();
        Bike_UpdateBikeCounterSpeed(0);
    }
}

u8 GetRivalAvatarGraphicsIdByStateIdAndGender(u8 state, u8 gender)
{
    return sRivalAvatarGfxIds[state][gender];
}

static u8 GetPlayerAvatarGraphicsIdByStateIdAndGender(u8 state, u8 gender)
{
    return sPlayerAvatarGfxIds[state][gender];
}

u8 GetPlayerAvatarGraphicsIdByStateId(u8 state)
{
    return GetPlayerAvatarGraphicsIdByStateIdAndGender(state, gPlayerAvatar.gender);
}

u8 unref_GetRivalAvatarGenderByGraphcsId(u8 gfxId)
{
    switch (gfxId)
    {
    case MAP_OBJ_GFX_RIVAL_MAY_NORMAL:
    case MAP_OBJ_GFX_RIVAL_MAY_MACH_BIKE:
    case MAP_OBJ_GFX_RIVAL_MAY_ACRO_BIKE:
    case MAP_OBJ_GFX_RIVAL_MAY_SURFING:
    case MAP_OBJ_GFX_RIVAL_MAY_FIELD_MOVE:
    case MAP_OBJ_GFX_MAY_UNDERWATER:
    case MAP_OBJ_GFX_MAY_FISHING:
    case MAP_OBJ_GFX_MAY_WATERING:
        return FEMALE;
    default:
        return MALE;
    }
}

u8 GetPlayerAvatarGenderByGraphicsId(u8 gfxId)
{
    switch (gfxId)
    {
    case MAP_OBJ_GFX_MAY_NORMAL:
    case MAP_OBJ_GFX_MAY_MACH_BIKE:
    case MAP_OBJ_GFX_MAY_ACRO_BIKE:
    case MAP_OBJ_GFX_MAY_SURFING:
    case MAP_OBJ_GFX_MAY_FIELD_MOVE:
    case MAP_OBJ_GFX_MAY_UNDERWATER:
    case MAP_OBJ_GFX_MAY_FISHING:
    case MAP_OBJ_GFX_MAY_WATERING:
        return FEMALE;
    default:
        return MALE;
    }
}

bool8 PartyHasMonWithSurf(void)
{
    u8 i;

    if (!TestPlayerAvatarFlags((1 << 3)))
    {
        for (i = 0; i < 6; i++)
        {
            if (GetMonData(&gPlayerParty[i], 11) == 0)
                break;
            if (pokemon_has_move(&gPlayerParty[i], 0x39))
                return 1;
        }
    }
    return 0;
}

bool8 IsPlayerSurfingNorth(void)
{
    if (player_get_direction_upper_nybble() == DIR_NORTH && TestPlayerAvatarFlags((1 << 3)))
        return 1;
    else
        return 0;
}

bool8 IsPlayerFacingSurfableFishableWater(void)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    s16 x = playerMapObj->coords2.x;
    s16 y = playerMapObj->coords2.y;

    MoveCoords(playerMapObj->mapobj_unk_18, &x, &y);
    if (npc_block_way(playerMapObj, x, y, playerMapObj->mapobj_unk_18) == 3 && PlayerGetZCoord() == 3
     && MetatileBehavior_IsSurfableFishableWater(MapGridGetMetatileBehaviorAt(x, y)))
        return 1;
    else
        return 0;
}

void ClearPlayerAvatarInfo(void)
{
    memset(&gPlayerAvatar, 0, sizeof(struct PlayerAvatar));
}

void SetPlayerAvatarStateMask(u8 a)
{
    gPlayerAvatar.flags &= 0xE0;
    gPlayerAvatar.flags |= a;
}

static u8 GetPlayerAvatarStateTransitionByGraphicsId(u8 a, u8 gender)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (gUnknown_0830FC64[gender][i][0] == a)
            return gUnknown_0830FC64[gender][i][1];
    }
    return 1;
}

u8 GetPlayerAvatarGraphicsIdByCurrentState(void)
{
    u8 i;
    u8 r5 = gPlayerAvatar.flags;

    for (i = 0; i < 5; i++)
    {
        if (gUnknown_0830FC64[gPlayerAvatar.gender][i][1] & r5)
            return gUnknown_0830FC64[gPlayerAvatar.gender][i][0];
    }
    return 0;
}

void SetPlayerAvatarExtraStateTransition(u8 a, u8 b)
{
    u8 unk = GetPlayerAvatarStateTransitionByGraphicsId(a, gPlayerAvatar.gender);

    gPlayerAvatar.unk1 |= unk | b;
    DoPlayerAvatarTransition();
}

void InitPlayerAvatar(s16 x, s16 y, u8 direction, u8 gender)
{
    struct MapObjectTemplate playerMapObjTemplate;
    u8 mapObjectId;
    struct MapObject *mapObject;

    playerMapObjTemplate.localId = 0xFF;
    playerMapObjTemplate.graphicsId = GetPlayerAvatarGraphicsIdByStateIdAndGender(0, gender);
    playerMapObjTemplate.x = x - 7;
    playerMapObjTemplate.y = y - 7;
    playerMapObjTemplate.elevation = 0;
    playerMapObjTemplate.movementType = 11;
    playerMapObjTemplate.unkA_0 = 0;
    playerMapObjTemplate.unkA_4 = 0;
    playerMapObjTemplate.unkC = 0;
    playerMapObjTemplate.unkE = 0;
    playerMapObjTemplate.script = ((void *)0);
    playerMapObjTemplate.flagId = 0;
    mapObjectId = SpawnSpecialFieldObject(&playerMapObjTemplate);
    mapObject = &gMapObjects[mapObjectId];
    mapObject->mapobj_bit_16 = 1;
    mapObject->mapobj_unk_1B = sub_8126B54();
    FieldObjectTurn(mapObject, direction);
    ClearPlayerAvatarInfo();
    gPlayerAvatar.runningState = NOT_MOVING;
    gPlayerAvatar.tileTransitionState = T_NOT_MOVING;
    gPlayerAvatar.mapObjectId = mapObjectId;
    gPlayerAvatar.spriteId = mapObject->spriteId;
    gPlayerAvatar.gender = gender;
    SetPlayerAvatarStateMask(0x21);
}

void sub_8059B88(u8 a)
{
    gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_13 = a;
    if (TestPlayerAvatarFlags((1 << 3)))
        gSprites[gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1A].invisible = a;
}

void sub_8059BF4(void)
{
    sub_805B980(&gMapObjects[gPlayerAvatar.mapObjectId], GetPlayerAvatarGraphicsIdByStateId(5));
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], 0);
}

void sub_8059C3C(u8 a)
{
    sub_805B980(&gMapObjects[gPlayerAvatar.mapObjectId], GetPlayerAvatarGraphicsIdByStateId(6));
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FDE8(a));
}

void sub_8059C94(u8 a)
{
    sub_805B980(&gMapObjects[gPlayerAvatar.mapObjectId], GetPlayerAvatarGraphicsIdByStateId(2));
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FD98(a));
    SeekSpriteAnim(&gSprites[gPlayerAvatar.spriteId], 1);
}

void sub_8059D08(u8 a)
{
    sub_805B980(&gMapObjects[gPlayerAvatar.mapObjectId], GetPlayerAvatarGraphicsIdByStateId(7));
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], FieldObjectDirectionToImageAnimId(a));
}

static void sub_8059D60(struct MapObject *a)
{
    s16 x;
    s16 y;
    u8 r6;
    u8 r8 = a->mapobj_unk_1E;

    for (x = 0, r6 = 1; x < 4; x++, r6++)
    {
        if (gUnknown_0830FC78[x](r8) && r6 == a->placeholder18)
        {
            x = a->coords2.x;
            y = a->coords2.y;
            MoveCoords(r6, &x, &y);
            sub_8126BC4(a->mapobj_unk_1B, r6, x, y);
            return;
        }
    }
    objid_set_invisible(a->mapobj_unk_1B);
}



static void sub_8059E2C(u8 taskId);

static void StartStrengthAnim(u8 a, u8 b)
{
    u8 taskId = CreateTask(sub_8059E2C, 0xFF);

    gTasks[taskId].data[1] = a;
    gTasks[taskId].data[2] = b;
    sub_8059E2C(taskId);
}

static void sub_8059E2C(u8 taskId)
{
    while (gUnknown_0830FC88[gTasks[taskId].data[0]](&gTasks[taskId],
                                                     &gMapObjects[gPlayerAvatar.mapObjectId],
                                                     &gMapObjects[gTasks[taskId].data[1]]))
        ;
}

u8 sub_8059E84(struct Task *task, struct MapObject *b, struct MapObject *c)
{
    ScriptContext2_Enable();
    gPlayerAvatar.preventStep = 1;
    task->data[0]++;
    return 0;
}

u8 sub_8059EA4(struct Task *task, struct MapObject *b, struct MapObject *c)
{
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(b)
     && !FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(c))
    {
        FieldObjectClearAnimIfSpecialAnimFinished(b);
        FieldObjectClearAnimIfSpecialAnimFinished(c);
        FieldObjectSetSpecialAnim(b, GetStepInPlaceDelay16AnimId((u8)task->data[2]));
        FieldObjectSetSpecialAnim(c, GetSimpleGoAnimId((u8)task->data[2]));
        gFieldEffectArguments[0] = c->coords2.x;
        gFieldEffectArguments[1] = c->coords2.y;
        gFieldEffectArguments[2] = c->elevation;
        gFieldEffectArguments[3] = gSprites[c->spriteId].oam.priority;
        FieldEffectStart(FLDEFF_DUST);
        PlaySE(SE_W070);
        task->data[0]++;
    }
    return 0;
}

u8 sub_8059F40(struct Task *task, struct MapObject *b, struct MapObject *c)
{
    if (FieldObjectCheckIfSpecialAnimFinishedOrInactive(b)
     && FieldObjectCheckIfSpecialAnimFinishedOrInactive(c))
    {
        FieldObjectClearAnimIfSpecialAnimFinished(b);
        FieldObjectClearAnimIfSpecialAnimFinished(c);
        gPlayerAvatar.preventStep = 0;
        ScriptContext2_Disable();
        DestroyTask(FindTaskIdByFunc(sub_8059E2C));
    }
    return 0;
}



static void DoPlayerAvatarSecretBaseMatJump(u8 taskId);

static void DoPlayerMatJump(void)
{
    DoPlayerAvatarSecretBaseMatJump(CreateTask(DoPlayerAvatarSecretBaseMatJump, 0xFF));
}

static void DoPlayerAvatarSecretBaseMatJump(u8 taskId)
{
    while (sPlayerAvatarSecretBaseMatJump[gTasks[taskId].data[0]](&gTasks[taskId], &gMapObjects[gPlayerAvatar.mapObjectId]))
        ;
}


u8 PlayerAvatar_DoSecretBaseMatJump(struct Task *task, struct MapObject *mapObject)
{
    gPlayerAvatar.preventStep = 1;
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        PlaySE(SE_DANSA);
        FieldObjectSetSpecialAnim(mapObject, sub_806084C(mapObject->mapobj_unk_18));
        task->data[1]++;
        if (task->data[1] > 1)
        {
            gPlayerAvatar.preventStep = 0;
            gPlayerAvatar.unk1 |= 0x20;
            DestroyTask(FindTaskIdByFunc(DoPlayerAvatarSecretBaseMatJump));
        }
    }
    return 0;
}



static void sub_805A08C(u8 taskId);

static void sub_805A06C(void)
{
    u8 taskId = CreateTask(sub_805A08C, 0xFF);

    sub_805A08C(taskId);
}

static void sub_805A08C(u8 taskId)
{
    while (gUnknown_0830FC98[gTasks[taskId].data[0]](&gTasks[taskId], &gMapObjects[gPlayerAvatar.mapObjectId]))
        ;
}

u8 sub_805A0D8(struct Task *task, struct MapObject *mapObject)
{
    task->data[0]++;
    task->data[1] = mapObject->placeholder18;
    gPlayerAvatar.preventStep = 1;
    ScriptContext2_Enable();
    PlaySE(SE_TK_WARPIN);
    return 1;
}

u8 sub_805A100(struct Task *task, struct MapObject *mapObject)
{
    u8 directions[] = {DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};

    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        u8 direction;

        FieldObjectSetSpecialAnim(mapObject, GetFaceDirectionAnimId(direction = directions[mapObject->placeholder18 - 1]));
        if (direction == (u8)task->data[1])
            task->data[2]++;
        task->data[0]++;
        if (task->data[2] > 3 && direction == GetOppositeDirection(task->data[1]))
            task->data[0]++;
    }
    return 0;
}

u8 sub_805A178(struct Task *task, struct MapObject *mapObject)
{
    const u8 arr[] = {16, 16, 17, 18, 19};

    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        FieldObjectSetSpecialAnim(mapObject, arr[task->data[2]]);
        task->data[0] = 1;
    }
    return 0;
}

u8 sub_805A1B8(struct Task *task, struct MapObject *mapObject)
{
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        FieldObjectSetSpecialAnim(mapObject, GetSimpleGoAnimId(GetOppositeDirection(task->data[1])));
        ScriptContext2_Disable();
        gPlayerAvatar.preventStep = 0;
        DestroyTask(FindTaskIdByFunc(sub_805A08C));
    }
    return 0;
}



static void taskFF_0805D1D4(u8 taskId);
static void sub_805A2D0(u8 taskId);

void sub_805A20C(u8 a)
{
    u8 taskId;

    ScriptContext2_Enable();
    Overworld_ClearSavedMusic();
    Overworld_ChangeMusicToDefault();
    gPlayerAvatar.flags &= ~(1 << 3);
    gPlayerAvatar.flags |= (1 << 0);
    gPlayerAvatar.preventStep = 1;
    taskId = CreateTask(taskFF_0805D1D4, 0xFF);
    gTasks[taskId].data[0] = a;
    taskFF_0805D1D4(taskId);
}

static void taskFF_0805D1D4(u8 taskId)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(playerMapObj))
    {
        if (!FieldObjectClearAnimIfSpecialAnimFinished(playerMapObj))
            return;
    }
    sub_8127ED0(playerMapObj->mapobj_unk_1A, 2);
    FieldObjectSetSpecialAnim(playerMapObj, sub_80608D0((u8)gTasks[taskId].data[0]));
    gTasks[taskId].func = sub_805A2D0;
}

static void sub_805A2D0(u8 taskId)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (FieldObjectClearAnimIfSpecialAnimFinished(playerMapObj))
    {
        sub_805B980(playerMapObj, GetPlayerAvatarGraphicsIdByStateId(0));
        FieldObjectSetSpecialAnim(playerMapObj, GetFaceDirectionAnimId(playerMapObj->mapobj_unk_18));
        gPlayerAvatar.preventStep = 0;
        ScriptContext2_Disable();
        DestroySprite(&gSprites[playerMapObj->mapobj_unk_1A]);
        DestroyTask(taskId);
    }
}



static u8 (*const sFishingStateFuncs[])(struct Task *) =
{
    Fishing1,
    Fishing2,
    Fishing3,
    Fishing4,
    Fishing5,
    Fishing6,
    Fishing7,
    Fishing8,
    Fishing9,
    Fishing10,
    Fishing11,
    Fishing12,
    Fishing13,
    Fishing14,
    Fishing15,
    Fishing16,
};

static void Task_Fishing(u8 taskId);
static void sub_805A954(void);
# 1457 "src/field/field_player_avatar.c"
void StartFishing(u8 rod)
{
    u8 taskId = CreateTask(Task_Fishing, 0xFF);

    gTasks[taskId].data[15] = rod;
    Task_Fishing(taskId);
}

static void Task_Fishing(u8 taskId)
{
    while (sFishingStateFuncs[gTasks[taskId].data[0]](&gTasks[taskId]))
        ;
}

u8 Fishing1(struct Task *task)
{
    ScriptContext2_Enable();
    gPlayerAvatar.preventStep = 1;
    task->data[0]++;
    return 0;
}

u8 Fishing2(struct Task *task)
{
    struct MapObject *playerMapObj;
    const s16 arr1[] = {1, 1, 1};
    const s16 arr2[] = {1, 3, 6};

    task->data[12] = 0;
    task->data[13] = arr1[task->data[15]] + (Random() % arr2[task->data[15]]);
    task->data[14] = gMapObjects[gPlayerAvatar.mapObjectId].graphicsId;
    playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    FieldObjectClearAnimIfSpecialAnimActive(playerMapObj);
    playerMapObj->mapobj_bit_11 = 1;
    sub_8059C3C(playerMapObj->mapobj_unk_18);
    task->data[0]++;
    return 0;
}

u8 Fishing3(struct Task *task)
{
    sub_805A954();


    task->data[1]++;
    if (task->data[1] >= 60)
        task->data[0]++;
    return 0;
}

u8 Fishing4(struct Task *task)
{
    u32 randVal;

    MenuDisplayMessageBox();
    task->data[0]++;
    task->data[1] = 0;
    task->data[2] = 0;
    randVal = Random();
    randVal %= 10;
    task->data[3] = randVal + 1;
    if (task->data[12] == 0)
        task->data[3] = randVal + 4;
    if (task->data[3] >= 10)
        task->data[3] = 10;
    return 1;
}


u8 Fishing5(struct Task *task)
{
    const u8 dot[] = _("·");

    sub_805A954();
    task->data[1]++;
    if (gMain.newKeys & 0x0001)
    {
        task->data[0] = 11;
        if (task->data[12] != 0)
            task->data[0] = 12;
        return 1;
    }
    else
    {
        if (task->data[1] >= 20)
        {
            task->data[1] = 0;
            if (task->data[2] >= task->data[3])
            {
                task->data[0]++;
                if (task->data[12] != 0)
                    task->data[0]++;
                task->data[12]++;
            }
            else
            {
                MenuPrint(dot, task->data[2] + 4, 15);
                task->data[2]++;
            }
        }
        return 0;
    }
}


u8 Fishing6(struct Task *task)
{
    sub_805A954();
    task->data[0]++;
    if (!DoesCurrentMapHaveFishingMons() || (Random() & 1))
        task->data[0] = 11;
    else
        StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FE08(player_get_direction_lower_nybble()));
    return 1;
}


u8 Fishing7(struct Task *task)
{
    sub_805A954();
    MenuPrint(gOtherText_OhABite, 4, 17);
    task->data[0]++;
    task->data[1] = 0;
    return 0;
}


u8 Fishing8(struct Task *task)
{
    const s16 reelTimeouts[3] = {36, 33, 30};

    sub_805A954();
    task->data[1]++;
    if (task->data[1] >= reelTimeouts[task->data[15]])
        task->data[0] = 12;
    else if (gMain.newKeys & 0x0001)
        task->data[0]++;
    return 0;
}


u8 Fishing9(struct Task *task)
{
    const s16 arr[][2] =
    {
        {0, 0},
        {40, 10},
        {70, 30}
    };

    sub_805A954();
    task->data[0]++;
    if (task->data[12] < task->data[13])
    {
        task->data[0] = 3;
    }
    else if (task->data[12] < 2)
    {

        s16 probability = Random() % 100;

        if (arr[task->data[15]][task->data[12]] > probability)
            task->data[0] = 3;
    }
    return 0;
}

u8 Fishing10(struct Task *task)
{
    sub_805A954();
    MenuPrintMessageDefaultCoords(gOtherText_PokeOnHook);
    MenuDisplayMessageBox();
    task->data[0]++;
    task->data[1] = 0;
    return 0;
}

u8 Fishing11(struct Task *task)
{
    if (task->data[1] == 0)
        sub_805A954();

    if (task->data[1] == 0)
    {
        if (MenuUpdateWindowText())
        {
            struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

            sub_805B980(playerMapObj, task->data[14]);
            FieldObjectTurn(playerMapObj, playerMapObj->placeholder18);
            if (gPlayerAvatar.flags & (1 << 3))
                sub_8127F28(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1A, 0, 0);
            gSprites[gPlayerAvatar.spriteId].pos2.x = 0;
            gSprites[gPlayerAvatar.spriteId].pos2.y = 0;
            MenuZeroFillScreen();
            task->data[1]++;
            return 0;
        }
    }

    if (task->data[1] != 0)
    {
        gPlayerAvatar.preventStep = 0;
        ScriptContext2_Disable();
        FishingWildEncounter(task->data[15]);
        sub_80BE97C(1);
        DestroyTask(FindTaskIdByFunc(Task_Fishing));
    }
    return 0;
}


u8 Fishing12(struct Task *task)
{
    sub_805A954();
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FDF8(player_get_direction_lower_nybble()));
    MenuPrintMessageDefaultCoords(gOtherText_NotEvenANibble);
    task->data[0] = 13;
    return 1;
}


u8 Fishing13(struct Task *task)
{
    sub_805A954();
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FDF8(player_get_direction_lower_nybble()));
    MenuPrintMessageDefaultCoords(gOtherText_ItGotAway);
    task->data[0]++;
    return 1;
}


u8 Fishing14(struct Task *task)
{
    sub_805A954();
    MenuDisplayMessageBox();
    task->data[0]++;
    return 0;
}

u8 Fishing15(struct Task *task)
{
    sub_805A954();
    if (gSprites[gPlayerAvatar.spriteId].animEnded)
    {
        struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

        sub_805B980(playerMapObj, task->data[14]);
        FieldObjectTurn(playerMapObj, playerMapObj->placeholder18);
        if (gPlayerAvatar.flags & (1 << 3))
            sub_8127F28(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1A, 0, 0);
        gSprites[gPlayerAvatar.spriteId].pos2.x = 0;
        gSprites[gPlayerAvatar.spriteId].pos2.y = 0;
        task->data[0]++;
    }
    return 0;
}

u8 Fishing16(struct Task *task)
{
    if (MenuUpdateWindowText())
    {
        gPlayerAvatar.preventStep = 0;
        ScriptContext2_Disable();
        UnfreezeMapObjects();
        MenuZeroFillScreen();
        sub_80BE97C(0);
        DestroyTask(FindTaskIdByFunc(Task_Fishing));
    }
    return 0;
}





static void sub_805A954(void)
{
    struct Sprite *playerSprite = &gSprites[gPlayerAvatar.spriteId];
    u8 animCmdIndex;
    u8 animType;

    AnimateSprite(playerSprite);
    playerSprite->pos2.x = 0;
    playerSprite->pos2.y = 0;
    animCmdIndex = playerSprite->animCmdIndex;
    if (playerSprite->anims[playerSprite->animNum][animCmdIndex].type == -1)
    {
        animCmdIndex--;
    }
    else
    {
        playerSprite->animDelayCounter++;
        if (playerSprite->anims[playerSprite->animNum][animCmdIndex].type == -1)
            animCmdIndex--;
    }
    animType = playerSprite->anims[playerSprite->animNum][animCmdIndex].type;
    if (animType == 1 || animType == 2 || animType == 3)
    {
        playerSprite->pos2.x = 8;
        if (player_get_direction_lower_nybble() == 3)
            playerSprite->pos2.x = -8;
    }
    if (animType == 5)
        playerSprite->pos2.y = -8;
    if (animType == 10 || animType == 11)
        playerSprite->pos2.y = 8;
    if (gPlayerAvatar.flags & (1 << 3))
        sub_8127F28(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1A, 1, playerSprite->pos2.y);
}
