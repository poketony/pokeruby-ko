# 1 "src/field/party_menu.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/field/party_menu.c"
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
# 2 "src/field/party_menu.c" 2
# 1 "include/party_menu.h" 1



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
# 3 "src/field/party_menu.c" 2
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
# 4 "src/field/party_menu.c" 2
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
# 5 "src/field/party_menu.c" 2
# 1 "include/battle_party_menu.h" 1



void HandleBattlePartyMenu(u8);
bool8 SetUpBattlePartyMenu(void);
# 6 "src/field/party_menu.c" 2
# 1 "include/choose_party.h" 1



void sub_8121E10(void);
void sub_8121E34(void);
bool8 SetupBattleTowerPartyMenu(void);
void HandleBattleTowerPartyMenu(u8 taskId);
bool8 SetupLinkMultiBattlePartyMenu(void);
void HandleLinkMultiBattlePartyMenu(u8 taskId);
void HandleDaycarePartyMenu(u8 taskId);
void sub_8123138(u8 taskId);
# 7 "src/field/party_menu.c" 2
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
# 8 "src/field/party_menu.c" 2
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
# 9 "src/field/party_menu.c" 2
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
# 10 "src/field/party_menu.c" 2
# 1 "include/evolution_scene.h" 1



void EvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, bool8 canStopEvo, u8 partyID);
void BeginEvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, bool8 canStopEvo, u8 partyID);
void TradeEvolutionScene(struct Pokemon* mon, u16 speciesToEvolve, u8 preEvoSpriteID, u8 partyID);

extern void (*gCB2_AfterEvolution)(void);
# 11 "src/field/party_menu.c" 2
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
# 12 "src/field/party_menu.c" 2
# 1 "include/item_use.h" 1



extern u16 gScriptItemId;

void ItemUseOutOfBattle_Mail(u8);
void ItemUseOutOfBattle_Bike(u8);
void ItemUseOnFieldCB_Bike(u8);
void ItemUseOutOfBattle_Rod(u8);
void ItemUseOnFieldCB_Rod(u8);
void ItemUseOutOfBattle_Itemfinder(u8);
void ItemUseOnFieldCB_Itemfinder(u8);
void RunItemfinderResults(u8);
void ExitItemfinder(u8);
bool8 ItemfinderCheckForHiddenItems(struct MapEvents *, u8);
void sub_80C9720(u8);
void sub_80C9838(u8, s16, s16);
u8 GetPlayerDirectionTowardsHiddenItem(s16, s16);
void SetPlayerDirectionTowardsItem(u8);
void DisplayItemRespondingMessageAndExitItemfinder(u8);
void RotatePlayerAndExitItemfinder(u8);
void ItemUseOutOfBattle_PokeblockCase(u8);
void ItemUseOutOfBattle_CoinCase(u8);
void ItemUseOutOfBattle_SSTicket(u8);
void sub_80C9D00(u8);
void ItemUseOutOfBattle_WailmerPail(u8);
void sub_80C9D74(u8);
void ItemUseOutOfBattle_Medicine(u8);
void ItemUseOutOfBattle_SacredAsh(u8);
void ItemUseOutOfBattle_PPRecovery(u8);
void ItemUseOutOfBattle_PPUp(u8);
void ItemUseOutOfBattle_RareCandy(u8);
void ItemUseOutOfBattle_TMHM(u8);
void sub_80C9EE4(u8);
void sub_80C9F10(u8);
void sub_80C9F80(u8);
void sub_80C9FC0(u8);
void ItemUseOutOfBattle_Repel(u8);
void ItemUseOutOfBattle_BlackWhiteFlute(u8);
void task08_080A1C44(u8);
u8 CanUseEscapeRopeOnCurrMap(void);
void ItemUseOutOfBattle_EscapeRope(u8);
void ItemUseOutOfBattle_EvolutionStone(u8);
void ItemUseInBattle_PokeBall(u8);
void ItemUseInBattle_StatIncrease(u8);
void ItemUseInBattle_Medicine(u8);
void ItemUseInBattle_PPRecovery(u8);
void ItemUseInBattle_Escape(u8);
void ItemUseOutOfBattle_EnigmaBerry(u8);
void ItemUseInBattle_EnigmaBerry(u8);
void ItemUseOutOfBattle_CannotUse(u8);
u8 CheckIfItemIsTMHMOrEvolutionStone(u16 itemId);
# 13 "src/field/party_menu.c" 2
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
# 14 "src/field/party_menu.c" 2
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
# 15 "src/field/party_menu.c" 2
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
# 16 "src/field/party_menu.c" 2
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
# 17 "src/field/party_menu.c" 2
# 1 "include/menu.h" 1
# 18 "src/field/party_menu.c" 2
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
# 19 "src/field/party_menu.c" 2
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
# 20 "src/field/party_menu.c" 2
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
# 21 "src/field/party_menu.c" 2
# 1 "include/pokemon.h" 1
# 22 "src/field/party_menu.c" 2
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
# 23 "src/field/party_menu.c" 2
# 1 "include/pokemon_item_effect.h" 1



bool8 ExecuteTableBasedItemEffect_(struct Pokemon *mon, u16, u8, u16);
# 24 "src/field/party_menu.c" 2
# 1 "include/pokemon_menu.h" 1







enum
{
    POKEMENU_SUMMARY,
    POKEMENU_SWITCH,
    POKEMENU_ITEM,
    POKEMENU_CANCEL,
    POKEMENU_GIVE_ITEM,
    POKEMENU_TAKE_ITEM,
    POKEMENU_TAKE_MAIL,
    POKEMENU_MAIL,
    POKEMENU_READ_MAIL,
    POKEMENU_CANCEL_SUBMENU,
    POKEMENU_CUT,
 POKEMENU_FLASH,
 POKEMENU_ROCK_SMASH,
 POKEMENU_STRENGTH,
 POKEMENU_SURF,
 POKEMENU_FLY,
 POKEMENU_DIVE,
 POKEMENU_WATERFALL,
 POKEMENU_TELEPORT,
 POKEMENU_DIG,
 POKEMENU_SECRET_POWER,
 POKEMENU_MILK_DRINK,
 POKEMENU_SOFT_BOILED,
 POKEMENU_SWEET_SCENT,
};

extern u8 gLastFieldPokeMenuOpened;
extern void (*gUnknown_03005CE4)(void);

void HandleDefaultPartyMenu(u8 taskID);
void sub_808B5B4(u32 taskID);
void sub_8089A70(void);
void sub_8089C50(u8 arg0, u8 arg1, u8 arg2, u8 noOfOptions, const struct MenuAction2 *menuActions, const u8 *order);
void DoPokemonMenu_Switch(u8 taskID);
void FieldCallback_Teleport(void);
void sub_808AD58(void);
void sub_808B020(void);
void sub_808B0C0(u8 taskID);
void sub_808B508(u8);
void sub_808B564(void);
# 25 "src/field/party_menu.c" 2
# 1 "include/pokemon_summary_screen.h" 1



extern const u8 *const gNatureNames[];

void ShowPokemonSummaryScreen(struct Pokemon *, u8, u8, void (*)(void), int);
void sub_809D9F0(struct Pokemon *party, u8, u8, void *, u32);
void sub_809D9F0(struct Pokemon *, u8, u8, void *, u32);
u8 sub_809FA30(void);
u8 pokemon_ailments_get_primary(u32);
u8 GetMonStatusAndPokerus();
u8 *sub_80A1E9C(u8 *dest, const u8 *src, u8);
u8 *PokemonSummaryScreen_CopyPokemonLevel(u8 *dest, u8 level);
u8 PokemonSummaryScreen_CheckOT(struct Pokemon *pokemon);
bool8 CheckPartyPokerus(struct Pokemon *, u8);
# 26 "src/field/party_menu.c" 2
# 1 "include/rom_8077ABC.h" 1






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
# 27 "src/field/party_menu.c" 2
# 1 "include/rom_8094928.h" 1



void sub_8094978(u8, u8);
u8 sub_8094C20(u8);
void sub_8094C98(u8, u8);
u8 pokemon_order_func(u8);
void sub_8094E4C(void);
# 28 "src/field/party_menu.c" 2
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
# 29 "src/field/party_menu.c" 2
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
# 30 "src/field/party_menu.c" 2
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
# 31 "src/field/party_menu.c" 2
# 1 "include/sprite.h" 1
# 32 "src/field/party_menu.c" 2
# 1 "include/string_util.h" 1
# 33 "src/field/party_menu.c" 2
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
# 34 "src/field/party_menu.c" 2
# 1 "include/task.h" 1
# 35 "src/field/party_menu.c" 2
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
# 36 "src/field/party_menu.c" 2
# 1 "include/util.h" 1





extern const u8 gMiscBlank_Gfx[];
extern const u32 gBitTable[];

u8 CreateInvisibleSpriteWithCallback(void (*)(struct Sprite *));
void StoreWordInTwoHalfwords(u16 *, u32);
void LoadWordFromTwoHalfwords(u16 *, u32 *);
u16 CalcCRC16(u8 *data, int length);
void DoBgAffineSet(struct BgAffineDstData *dest, u32 texX, u32 texY, s16 scrX, s16 scrY, s16 sx, s16 sy, u16 alpha);
# 37 "src/field/party_menu.c" 2
# 1 "include/script_pokemon_80F9.h" 1



struct UnknownStruct2018000
{
    u8 filler0[0x8];
    u8 unk8;
};

void OpenPartyMenuFromScriptContext(u8 taskId);
void sub_80F9C00(void);
void sub_80F9E1C(void);
void sub_80F99CC(void);
void HandleSelectPartyMenu(u8 taskId);
bool8 SetupContestPartyMenu(void);
void HandleMoveTutorPartyMenu(u8 taskId);
bool8 SetupMoveTutorPartyMenu(void);
# 38 "src/field/party_menu.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 39 "src/field/party_menu.c" 2

struct Coords8
{
    u8 x;
    u8 y;
};

struct PartyMenuWindowCoords
{
    u8 left;
    u8 top;
    u8 right;
    u8 bottom;
};

struct PartyMonTextSettingsStruct
{
    u8 xOffset;
    u8 yOffset;
    const u16 *oamSettings;
};

struct PartyMenuHandlersStruct
{
           TaskFunc menuHandler;
           bool8 (*menuSetup)(void);
           u8 initialPromptTextId;
};

static void nullsub_12(u8 monIndex, struct Pokemon *pokemon);
static void TryPrintPartyMenuMonNickname(u8 monIndex, struct Pokemon *pokemon);
static void PartyMenuTryPrintHP(u8 monIndex, struct Pokemon *pokemon);
static void sub_806D05C(u8 taskId);
static void sub_806D15C(u8 taskId);
static void sub_806D198(u8 taskId);
static void sub_806E884(u8 taskId);
static void sub_8070D90(u8 taskId);
static void sub_806D5B8(u8 taskId);
static void sub_806D014(u8 taskId);
static void sub_806D118(u8 taskId);
static void CB2_InitPartyMenu(void);
static void ReDrawPartyMonBackgrounds(void);
static void sub_806BA94(s16 a, u16 b, u8 c, u8 d);
static void sub_806B9A4(s16 a, u16 b, u8 c);
static void sub_806CA18(u8 taskId, u8 b);
static void ChangeDoubleBattlePartyMenuSelection(u8 spriteId, u8 menuIndex, s8 directionPressed);
static void ChangeDefaultPartyMenuSelection(u8 spriteId, u8 menuIndex, s8 directionPressed);
static void ChangeLinkDoubleBattlePartyMenuSelection(u8 spriteId, u8 menuIndex, s8 directionPressed);
static void UpdateMonIconFrame_806DA0C(struct Sprite *sprite);
static void UpdateMonIconFrame_806DA38(struct Sprite *sprite);
static void UpdateMonIconFrame_806DA44(u8 taskId, u8 monIndex, u8 c);
static u8 sub_806CA00(u8 taskId);
static void SpriteCB_sub_806D37C(struct Sprite *sprite);
static u8 GetMonIconSpriteId(u8 taskId, u8 monIndex);
static void SpriteCB_UpdateHeldItemIconPosition(struct Sprite *sprite);
static void ItemUseMoveMenu_HandleMoveSelection(u8 taskId);
static void ItemUseMoveMenu_HandleCancel(u8 taskId);
static bool8 SetupDefaultPartyMenu(void);
static void sub_806B4A8(void);
static void VBlankCB_PartyMenu(void);
static bool8 LoadPartyMenuGraphics(u8 a);
static void sub_806BF24(const u8 *a, u8 monIndex, u8 c, u8 d);
static void sub_806BB9C(u8 a);
static void sub_806BBEC(u8 a);

const u16 TMHMMoves[] = {
    MOVE_FOCUS_PUNCH,
    MOVE_DRAGON_CLAW,
    MOVE_WATER_PULSE,
    MOVE_CALM_MIND,
    MOVE_ROAR,
    MOVE_TOXIC,
    MOVE_HAIL,
    MOVE_BULK_UP,
    MOVE_BULLET_SEED,
    MOVE_HIDDEN_POWER,
    MOVE_SUNNY_DAY,
    MOVE_TAUNT,
    MOVE_ICE_BEAM,
    MOVE_BLIZZARD,
    MOVE_HYPER_BEAM,
    MOVE_LIGHT_SCREEN,
    MOVE_PROTECT,
    MOVE_RAIN_DANCE,
    MOVE_GIGA_DRAIN,
    MOVE_SAFEGUARD,
    MOVE_FRUSTRATION,
    MOVE_SOLAR_BEAM,
    MOVE_IRON_TAIL,
    MOVE_THUNDERBOLT,
    MOVE_THUNDER,
    MOVE_EARTHQUAKE,
    MOVE_RETURN,
    MOVE_DIG,
    MOVE_PSYCHIC,
    MOVE_SHADOW_BALL,
    MOVE_BRICK_BREAK,
    MOVE_DOUBLE_TEAM,
    MOVE_REFLECT,
    MOVE_SHOCK_WAVE,
    MOVE_FLAMETHROWER,
    MOVE_SLUDGE_BOMB,
    MOVE_SANDSTORM,
    MOVE_FIRE_BLAST,
    MOVE_ROCK_TOMB,
    MOVE_AERIAL_ACE,
    MOVE_TORMENT,
    MOVE_FACADE,
    MOVE_SECRET_POWER,
    MOVE_REST,
    MOVE_ATTRACT,
    MOVE_THIEF,
    MOVE_STEEL_WING,
    MOVE_SKILL_SWAP,
    MOVE_SNATCH,
    MOVE_OVERHEAT,
    MOVE_CUT,
    MOVE_FLY,
    MOVE_SURF,
    MOVE_STRENGTH,
    MOVE_FLASH,
    MOVE_ROCK_SMASH,
    MOVE_WATERFALL,
    MOVE_DIVE,
};



asm(".4byte gTileBuffer\n");

static const u8 MenuGfx_HoldIcons[] = INCBIN_U8("graphics/interface/hold_icons.4bpp");
static const u16 MenuPal_HoldIcons[] = INCBIN_U16("graphics/interface/hold_icons.gbapal");

static const struct SpriteSheet HeldItemsSpriteSheet = {
    MenuGfx_HoldIcons,
    sizeof MenuGfx_HoldIcons,
    0xd750
};

static const struct SpritePalette HeldItemsPalette = {
    MenuPal_HoldIcons,
    0xd750
};

static const struct OamData gOamData_83765EC =
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
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd gSpriteAnim_83765F4[] = {
    {.frame = {0, 1}},
    {.type = -1}
};

static const union AnimCmd gSpriteAnim_83765FC[] = {
    {.frame = {1, 1}},
    {.type = -1}
};

static const union AnimCmd *const gSpriteAnimTable_8376604[] = {
    gSpriteAnim_83765F4,
    gSpriteAnim_83765FC,
};

static const struct SpriteTemplate gSpriteTemplate_837660C = {
    55120,
    55120,
    &gOamData_83765EC,
    gSpriteAnimTable_8376604,
    ((void *)0),
    gDummySpriteAffineAnimTable,
    SpriteCB_UpdateHeldItemIconPosition
};


static const u8 *const PartyMenuPromptTexts[] = {
    OtherText_ChoosePoke,
    OtherText_MovePokeTo,
    OtherText_TeachWhat,
    OtherText_UseWhat,
    OtherText_GiveWhat,
    OtherText_DoWhat,
    OtherText_NothingToCut,
    OtherText_CantSurf,
    OtherText_AlreadySurfing,
    OtherText_CantUseThatHere,
    OtherText_RestoreWhatMove,
    OtherText_BoostPP,
    gOtherText_CancelWithTerminator,
    OtherText_DoWhatWithItem,
    OtherText_NoPokeForBattle,
    OtherText_ChoosePoke2,
    OtherText_NotEnoughHP,
    OtherText_ThreePokeNeeded,
    OtherText_PokeCantBeSame,
    OtherText_NoIdenticalHoldItems,
    OtherText_TeachWhichPoke,
};

static const struct Coords8 gUnknown_08376678[8][6] = {
    {{16, 40}, {104, 18}, {104, 42}, {104, 66}, {104, 90}, {104, 114}},
    {{16, 24}, { 16, 80}, {104, 18}, {104, 50}, {104, 82}, {104, 114}},
    {{16, 24}, { 16, 80}, {104, 26}, {104, 50}, {104, 82}, {104, 106}},
    {{16, 24}, {104, 26}, {104, 50}, { 16, 80}, {104, 82}, {104, 106}},
    {{ 5, 4}, { 16, 1}, { 16, 4}, { 16, 7}, { 16, 10}, { 16, 13}},
    {{ 5, 2}, { 5, 9}, { 16, 1}, { 16, 5}, { 16, 9}, { 16, 13}},
    {{ 5, 2}, { 5, 9}, { 16, 2}, { 16, 5}, { 16, 9}, { 16, 12}},
    {{ 5, 2}, { 16, 2}, { 16, 5}, { 5, 9}, { 16, 9}, { 16, 12}},
};

static const struct Coords8 gUnknown_08376738[12][6] = {
    {{6, 5}, {17, 2}, {17, 5}, {17, 8}, {17, 11}, {17, 14}},
    {{6, 3}, { 6, 10}, {17, 2}, {17, 6}, {17, 10}, {17, 14}},
    {{6, 3}, { 6, 10}, {17, 3}, {17, 6}, {17, 10}, {17, 13}},
    {{6, 3}, {17, 3}, {17, 6}, { 6, 10}, {17, 10}, {17, 13}},
    {{3, 7}, {22, 2}, {22, 5}, {22, 8}, {22, 11}, {22, 14}},
    {{3, 5}, { 3, 12}, {22, 2}, {22, 6}, {22, 10}, {22, 14}},
    {{3, 5}, { 3, 12}, {22, 3}, {22, 6}, {22, 10}, {22, 13}},
    {{3, 5}, {22, 3}, {22, 6}, { 3, 12}, {22, 10}, {22, 13}},
    {{7, 7}, {26, 2}, {26, 5}, {26, 8}, {26, 11}, {26, 14}},
    {{7, 5}, { 7, 12}, {26, 2}, {26, 6}, {26, 10}, {26, 14}},
    {{7, 5}, { 7, 12}, {26, 3}, {26, 6}, {26, 10}, {26, 13}},
    {{7, 5}, {26, 3}, {26, 6}, { 7, 12}, {26, 10}, {26, 13}},
};

static u16 *const gUnknown_08376858[4][6] = {
    {(u16*)(0x6000000 + 0xF1C8), (u16*)(0x6000000 + 0xF0AE), (u16*)(0x6000000 + 0xF16E), (u16*)(0x6000000 + 0xF22E), (u16*)(0x6000000 + 0xF2EE), (u16*)(0x6000000 + 0xF3AE)},
    {(u16*)(0x6000000 + 0xF148), (u16*)(0x6000000 + 0xF308), (u16*)(0x6000000 + 0xF0AE), (u16*)(0x6000000 + 0xF1AE), (u16*)(0x6000000 + 0xF2AE), (u16*)(0x6000000 + 0xF3AE)},
    {(u16*)(0x6000000 + 0xF148), (u16*)(0x6000000 + 0xF308), (u16*)(0x6000000 + 0xF0EE), (u16*)(0x6000000 + 0xF1AE), (u16*)(0x6000000 + 0xF2AE), (u16*)(0x6000000 + 0xF36E)},
    {(u16*)(0x6000000 + 0xF148), (u16*)(0x6000000 + 0xF0EE), (u16*)(0x6000000 + 0xF1AE), (u16*)(0x6000000 + 0xF308), (u16*)(0x6000000 + 0xF2AE), (u16*)(0x6000000 + 0xF36E)},
};

static const struct Coords8 gUnknown_083768B8[3][8] = {
    {{8, 44}, {92, 22}, {92, 46}, {92, 70}, {92, 94}, {92, 118}, {196, 136}, {196, 152}},
    {{8, 28}, { 8, 84}, {92, 22}, {92, 54}, {92, 86}, {92, 118}, {196, 136}, {196, 152}},
    {{8, 28}, { 8, 84}, {92, 30}, {92, 54}, {92, 86}, {92, 110}, {196, 136}, {196, 152}},
};

static u16 *const gUnknown_08376918[2][6] = {
    {(u16*)(0x6000000 + 0xF1C6), (u16*)(0x6000000 + 0xF06C), (u16*)(0x6000000 + 0xF12C), (u16*)(0x6000000 + 0xF1EC), (u16*)(0x6000000 + 0xF2AC), (u16*)(0x6000000 + 0xF36C)},
    {(u16*)(0x6000000 + 0xF148), (u16*)(0x6000000 + 0xF308), (u16*)(0x6000000 + 0xF0AE), (u16*)(0x6000000 + 0xF1AE), (u16*)(0x6000000 + 0xF2AE), (u16*)(0x6000000 + 0xF3AE)},
};

static const struct PartyMenuWindowCoords gUnknown_08376948[2][6] = {
    {{2, 4, 10, 9}, {16, 1, 29, 3}, {16, 4, 29, 6}, {16, 7, 29, 9}, {16, 10, 29, 12}, {16, 13, 29, 15}},
    {{2, 2, 10, 7}, { 2, 9, 10, 14}, {16, 1, 29, 3}, {16, 5, 29, 7}, {16, 9, 29, 11}, {16, 13, 29, 15}},
};

static const struct PartyMenuWindowCoords gUnknown_08376978[2][6] = {
    {{2, 7, 10, 9}, {21, 1, 29, 3}, {21, 4, 29, 6}, {21, 7, 29, 9}, {21, 10, 29, 12}, {21, 13, 29, 15}},
    {{2, 2, 10, 7}, { 2, 9, 10, 14}, {16, 1, 29, 3}, {16, 5, 29, 7}, {16, 9, 29, 11}, {16, 13, 29, 15}},
};


static const u8 gUnknown_083769A8[] = {
    0, 3, 11, 1, 11, 4, 11, 7, 11, 10, 11, 13,
    0, 1, 0, 8, 11, 1, 11, 5, 11, 9, 11, 13,
};




static const u8 gUnknown_083769C0[] = {
    0, 1, 0, 8, 11, 2, 11, 5, 11, 9, 11, 12,
    0, 1, 0, 8, 11, 2, 11, 5, 11, 9, 11, 12,
};

static const u8 gUnknown_083769D8[] = {
    0x24,0x25,0x25,0x25,0x25,0x25,0x25,0x25,0x25,0x27,
    0x34,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x37,
    0x34,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x37,
    0x34,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x35,0x37,
    0x44,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x47,
    0x44,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x45,0x47,
    0x54,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x55,0x57,
};

static const u8 gUnknown_08376A25[] = {
    0x50,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x51,0x53,
    0x60,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x61,0x63,
    0x70,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x71,0x73,
};

static const u8 gUnknown_08376A5E[] = {
    0x20,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x21,0x23,
    0x30,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x31,0x33,
    0x40,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x41,0x43,
};

static const u8 gUnusedData_08376A97[] = {
    0x0C,0x0D,0x0E,0x0F,0x00,0x01,0x02,0x03,0x04,0x05,0x0F,
    0x10,0x11,0x12,0x13,0x14,0x15,0x0F,0x06,0x05,0x01,0x07,
    0x08,0x09,0x0F,0x16,0x15,0x11,0x17,0x18,0x19,0x0F,0x09,
    0x0A,0x0B,0x05,0x0C,0x0F,0x0F,0x19,0x1A,0x1B,0x15,0x1C,
    0x0F,0x0F,0x0D,0x0B,0x05,0x0C,0x0F,0x0F,0x0F,0x1D,0x1B,
    0x15,0x1C,0x0F,0x0F,0x0F,0x06,0x05,0x0B,0x05,0x0C,0x0F,
    0x0F,0x16,0x15,0x1B,0x15,0x1C,0x0F,0x0F,0x0F,0x0F,0x20,
    0x0C,0x09,0x0F,0x0F,0x0F,0x1F,0x30,0x1C,0x19,0x0F,0x0F,
    0x0F,0x25,0x0F,0x22,0x24,0x0F,0x0F,0x0F,0x35,0x41,0x32,
    0x34,0x0F,0x0F,0x0F,0x26,0x0F,0x23,0x0E,0x0F,0x0F,0x0F,
    0x36,0x43,0x33,0x1E,0x0F,0x0F,0x27,0x28,0x29,0x03,0x2A,
    0x0F,0x0F,0x37,0x38,0x39,0x13,0x3A,0x0F,0x0F,0x27,0x28,
    0x29,0x03,0x04,0x05,0x0F,0x37,0x38,0x39,0x13,0x14,0x15,
    0x0F,0x2B,0x2C,0x02,0x28,0x29,0x2D,0x21,0x3B,0x3C,0x12,
    0x38,0x39,0x3D,0x31,0x2B,0x2C,0x02,0x28,0x29,0x08,0x09,
    0x3B,0x3C,0x12,0x38,0x39,0x18,0x19,0x2E,0x2F,0x2B,0x2C,
    0x02,0x27,0x2D,0x3E,0x3F,0x3B,0x3C,0x12,0x45,0x3D,
};

static const TaskFunc gUnknown_08376B54[] = {
    ItemUseMoveMenu_HandleMoveSelection,
    ItemUseMoveMenu_HandleCancel,
};






static const u16 PartyMonOAMSettings_LeftColumn[] = {
    ((1) << 14) | (0), ((1) << 14) | (32), ((15) << 12) | ((1) << 10) | (0),
    ((1) << 14) | (0), ((1) << 14) | (64), ((15) << 12) | ((1) << 10) | (4),
    ((1) << 14) | (8), ((1) << 14) | (32), ((15) << 12) | ((1) << 10) | (8),
    ((1) << 14) | (8), ((1) << 14) | (64), ((15) << 12) | ((1) << 10) | (12),
    ((1) << 14) | (16), ((1) << 14) | (32), ((15) << 12) | ((1) << 10) | (16),
    ((1) << 14) | (32), ((1) << 14) | (16), ((15) << 12) | ((1) << 10) | (24),
    ((1) << 14) | (32), ((1) << 14) | (48), ((15) << 12) | ((1) << 10) | (28),
    0xFFFF,
};

static const u16 PartyMonOAMSettings_RightColumn[] = {
    ((1) << 14) | (0), ((1) << 14) | (32), ((15) << 12) | ((1) << 10) | (0),
    ((1) << 14) | (0), ((1) << 14) | (64), ((15) << 12) | ((1) << 10) | (4),
    ((1) << 14) | (8), ((1) << 14) | (32), ((15) << 12) | ((1) << 10) | (8),
    ((1) << 14) | (8), ((1) << 14) | (64), ((15) << 12) | ((1) << 10) | (12),
    ((1) << 14) | (16), ((1) << 14) | (32), ((15) << 12) | ((1) << 10) | (16),
    ((1) << 14) | (16), ((1) << 14) | (80), ((15) << 12) | ((1) << 10) | (24),
    ((1) << 14) | (16), ((1) << 14) | (112), ((15) << 12) | ((1) << 10) | (28),
    0xFFFF,
};


static struct PartyMonTextSettingsStruct const PartyMonTextSettings[4][6] = {
    {
        { 1, 4, PartyMonOAMSettings_LeftColumn},
        {12, 1, PartyMonOAMSettings_RightColumn},
        {12, 4, PartyMonOAMSettings_RightColumn},
        {12, 7, PartyMonOAMSettings_RightColumn},
        {12, 10, PartyMonOAMSettings_RightColumn},
        {12, 13, PartyMonOAMSettings_RightColumn},
    },
    {
        { 1, 2, PartyMonOAMSettings_LeftColumn},
        { 1, 9, PartyMonOAMSettings_LeftColumn},
        {12, 1, PartyMonOAMSettings_RightColumn},
        {12, 5, PartyMonOAMSettings_RightColumn},
        {12, 9, PartyMonOAMSettings_RightColumn},
        {12, 13, PartyMonOAMSettings_RightColumn},
    },
    {
        { 1, 2, PartyMonOAMSettings_LeftColumn},
        { 1, 9, PartyMonOAMSettings_LeftColumn},
        {12, 2, PartyMonOAMSettings_RightColumn},
        {12, 5, PartyMonOAMSettings_RightColumn},
        {12, 9, PartyMonOAMSettings_RightColumn},
        {12, 12, PartyMonOAMSettings_RightColumn},
    },
    {
        { 1, 2, PartyMonOAMSettings_LeftColumn},
        {12, 2, PartyMonOAMSettings_RightColumn},
        {12, 5, PartyMonOAMSettings_RightColumn},
        { 1, 9, PartyMonOAMSettings_LeftColumn},
        {12, 9, PartyMonOAMSettings_RightColumn},
        {12, 12, PartyMonOAMSettings_RightColumn},
    },
};

static const struct PartyMenuHandlersStruct PartyMenuHandlers[] = {
    {HandleDefaultPartyMenu, SetupDefaultPartyMenu, 0},
    {HandleBattlePartyMenu, SetUpBattlePartyMenu, 0},
    {HandleSelectPartyMenu, SetupContestPartyMenu, 0},
    {HandleSelectPartyMenu, SetupDefaultPartyMenu, 0},
    {HandleBattleTowerPartyMenu, SetupBattleTowerPartyMenu, 0},
    {HandleLinkMultiBattlePartyMenu, SetupLinkMultiBattlePartyMenu, 0xFF},
    {HandleDaycarePartyMenu, SetupDefaultPartyMenu, 0x0F},
    {HandleMoveTutorPartyMenu, SetupMoveTutorPartyMenu, 0},
};

static const u16 gUnknown_08376CD4[] = {
    0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F,
    0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F,
};

static const u16 gUnknown_08376CEC[] = {
    0x2A, 0x0B, 0x0C, 0x0D, 0x0E, 0x2F,
    0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F,
};

static const u8 *const StatNames[] = {
    gOtherText_HP,
    gOtherText_Attack,
    gOtherText_Defense,
    gOtherText_SpAtk,
    gOtherText_SpDef,
    gOtherText_Speed,
};

static const u8 StatDataTypes[] = {
    58,
    59,
    60,
    62,
    63,
    61,
};

struct Unk201C000
{
             struct Pokemon *pokemon;
             u8 unk4;
             u8 unk5;
             u16 unk6;
             u16 unk8;
             u8 pad_0A[2];
             s32 unkC;
             TaskFunc unk10;
             TaskFunc unk14;
};

struct Unk201FE00
{
    u8 unkE00;
    u8 unkE01;
    u8 unkE02;
};

extern u16 gBattleTypeFlags;
extern u8 gTileBuffer[];
extern u8 gUnknown_0202E8F4;
extern u8 gUnknown_0202E8F6;
extern u16 gUnknown_0202E8F8;
extern u8 gPartyMenuType;
extern u8 gLastFieldPokeMenuOpened;
extern u8 gPlayerPartyCount;
extern s32 gBattleMoveDamage;
extern u16 gMoveToLearn;

extern u16 gUnknown_08E9A300[];
extern struct Coords8 const gUnknown_08376738[12][6];
extern const u8 gUnknown_083769C0[];
extern u8 gUnknown_02039460[];
extern struct Window gUnknown_03004210;

extern const u8 gPartyMenuMisc_Gfx[];
extern const u8 gPartyMenuMisc_Tilemap[];
extern const u8 gPartyMenuMisc_Pal[];
extern const u8 gFontDefaultPalette[];
extern const u8 gPartyMenuHpBar_Gfx[];
extern const u8 gPartyMenuOrderText_Gfx[];
extern const u8 gStatusGfx_Icons[];
extern const u8 gStatusPal_Icons[];
# 542 "src/field/party_menu.c"
__attribute__((naked))
void CB2_PartyMenuMain(void)
{
    asm(".syntax unified\n    push {r4-r6,lr}\n    sub sp, 0x4\n    bl AnimateSprites\n    bl BuildOamBuffer\n    ldr r0, _0806AF2C @ =gPartyMenuType\n    ldrb r1, [r0]\n    lsls r0, r1, 1\n    adds r0, r1\n    lsls r0, 4\n    ldr r1, _0806AF30 @ =PartyMonTextSettings\n    adds r5, r0, r1\n    movs r6, 0\n_0806AEF8:\n    ldrb r0, [r5]\n    lsls r0, 3\n    ldrb r1, [r5, 0x1]\n    lsls r1, 3\n    ldr r2, [r5, 0x4]\n    lsls r3, r6, 5\n    movs r4, 0x80\n    lsls r4, 2\n    orrs r3, r4\n    str r3, [sp]\n    movs r3, 0\n    bl DrawPartyMenuMonText\n    adds r5, 0x8\n    adds r6, 0x1\n    cmp r6, 0x5\n    ble _0806AEF8\n    bl RunTasks\n    bl UpdatePaletteFade\n    add sp, 0x4\n    pop {r4-r6}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0806AF2C: .4byte gPartyMenuType\n_0806AF30: .4byte PartyMonTextSettings\n    .syntax divided\n");
# 585 "src/field/party_menu.c"
}


void VBlankCB_PartyMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    ReDrawPartyMonBackgrounds();
}

void SetPartyMenuSettings(u8 menuType, u8 battleTypeFlags, TaskFunc menuHandlerFunc, u8 textId)
{
    if (battleTypeFlags != 0xFF)
    {
        gBattleTypeFlags = battleTypeFlags;
    }

    (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).menuType = menuType;
    (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).menuHandler = menuHandlerFunc;
    (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).promptTextId = textId;
}

void DoOpenPartyMenu(u8 menuType, u8 battleFlags, TaskFunc menuHandlerFunc, u8 textId)
{
    SetPartyMenuSettings(menuType, battleFlags, menuHandlerFunc, textId);
    SetMainCallback2(CB2_InitPartyMenu);
}

void OpenPartyMenu(u8 menuType, u8 battleFlags)
{
    DoOpenPartyMenu(menuType, battleFlags, PartyMenuHandlers[menuType].menuHandler, PartyMenuHandlers[menuType].initialPromptTextId);
}


bool8 SetupDefaultPartyMenu(void)
{
    switch ((*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState)
    {
    case 0:
        if ((*(struct Struct201B000 *)(gSharedMem + 0x1B000)).monIndex < gPlayerPartyCount) {
            TryCreatePartyMenuMonIcon((*(struct Struct201B000 *)(gSharedMem + 0x1B000)).menuHandlerTaskId, (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).monIndex, &gPlayerParty[(*(struct Struct201B000 *)(gSharedMem + 0x1B000)).monIndex]);
            (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).monIndex++;
        } else {
            (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).monIndex = 0;
            (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState++;
        }

        break;
    case 1:
        LoadHeldItemIconGraphics();
        (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState++;
        break;
    case 2:
        CreateHeldItemIcons_806DC34((*(struct Struct201B000 *)(gSharedMem + 0x1B000)).menuHandlerTaskId);
        (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState++;
        break;
    case 3:
        if (sub_806BD58((*(struct Struct201B000 *)(gSharedMem + 0x1B000)).menuHandlerTaskId, (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).monIndex) != 1)
        {
            (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).monIndex++;
        }
        else
        {
            (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).monIndex = 0;
            (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState++;
        }

        break;
    case 4:
        PartyMenuPrintMonsLevelOrStatus();
        (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState++;
        break;
    case 5:
        PrintPartyMenuMonNicknames();
        (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState++;
        break;
    case 6:
        PartyMenuTryPrintMonsHP();
        (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState++;
        break;
    case 7:
        nullsub_13();
        (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState++;
        break;
    case 8:
        PartyMenuDrawHPBars();
        (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState++;
        break;
    case 9:
        if (DrawPartyMonBackground((*(struct Struct201B000 *)(gSharedMem + 0x1B000)).monIndex) == 1)
        {
            (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).monIndex = 0;
            (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState = 0;
            return 1;
        }
        else
        {
            (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).monIndex++;
            break;
        }
    }

    return 0;
}

bool8 InitPartyMenu(void)
{
    u8 *addr;
    u32 size;

    switch (gMain.state)
    {
    case 0:
        SetVBlankCallback(((void *)0));
        addr = (u8 *)0x6000000;
        size = 0x18000;
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

        { vu32 *_dest = (vu32 *)(0x7000000); u32 _size = 0x400; { vu32 tmp = (vu32)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0100 | 0x0000) << 16 | ((_size)/(32/8))); dmaRegs[2]; }; }; };
        { vu16 *_dest = (vu16 *)(0x5000000); u32 _size = 0x400; { vu16 tmp = (vu16)(0); { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(&tmp); dmaRegs[1] = (vu32)(_dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0100 | 0x0000) << 16 | ((_size)/(16/8))); dmaRegs[2]; }; }; };

        gPaletteFade.bufferTransferDisabled = 1;
        gMain.state++;
        break;
    case 1:
        remove_some_task();
        gMain.state++;
        break;
    case 2:
        sub_806B4A8();
        (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState = 0;
        (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).monIndex = 0;
        (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).unk268 = 0;
        gMain.state++;
        break;
    case 3:
        ResetSpriteData();
        gMain.state++;
        break;
    case 4:
        if ((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).menuType != PARTY_MENU_TYPE_BATTLE && (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).menuType != PARTY_MENU_TYPE_LINK_MULTI_BATTLE)
        {
            ResetTasks();
        }

        gMain.state++;
        break;
    case 5:
        FreeAllSpritePalettes();
        gMain.state++;
        break;
    case 6:
        (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).menuHandlerTaskId = CreateTask((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).menuHandler, 0);
        gMain.state++;
        break;
    case 7:
        SetUpWindowConfig(&gWindowConfig_81E6C90);
        gMain.state++;
        break;
    case 8:
        InitWindowFromConfig(&gUnknown_03004210, &gWindowConfig_81E6C90);
        MultistepInitWindowTileData(&gUnknown_03004210, 1);
        gMain.state++;
        break;
    case 9:
        if (MultistepLoadFont())
        {
            (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState = 1;
            gMain.state++;
        }
        break;
    case 10:
        if (LoadPartyMenuGraphics((*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState) == 1)
        {
            (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState = 0;
            gMain.state++;
        }
        else
        {
            (*(struct Struct201B000 *)(gSharedMem + 0x1B000)).setupState++;
        }
        break;
    case 11:
        sub_809D51C();
        gMain.state++;
        break;
    case 12:
        if (PartyMenuHandlers[(*(struct Unk201B000 *)(gSharedMem + 0x1B000)).menuType].menuSetup() == 1)
        {
            gMain.state++;
        }
        break;
    case 13:
        MultistepInitMenuWindowBegin(&gWindowConfig_81E6CC8);
        gMain.state++;
        break;
    case 14:
        if (MultistepInitMenuWindowContinue())
        {
            gMain.state++;
        }
        break;
    case 15:
        PrintPartyMenuPromptText((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).promptTextId, 0);
        gMain.state++;
        break;
    case 16:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
        gPaletteFade.bufferTransferDisabled = 0;
        gMain.state++;
        break;
    case 17:
        SetVBlankCallback(VBlankCB_PartyMenu);
        return 1;
    }

    return 0;
}

void CB2_InitPartyMenu(void)
{
    while (InitPartyMenu() != 1)
    {
        if (sub_80F9344() == 1)
        {
            return;
        }
    }

    if ((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).menuType != PARTY_MENU_TYPE_LINK_MULTI_BATTLE)
    {
        ChangePartyMenuSelection((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).menuHandlerTaskId, 0);
    }

    SetMainCallback2(CB2_PartyMenuMain);
}

void sub_806B4A8(void)
{
    SetHBlankCallback(((void *)0));
    (*(vu16 *)(0x4000000 + 0x0)) = 8000;
    (*(vu16 *)(0x4000000 + 0x8)) = 0x1E05;
    (*(vu16 *)(0x4000000 + 0xa)) = 0x703;
    (*(vu16 *)(0x4000000 + 0xc)) = 0xF08;
    (*(vu16 *)(0x4000000 + 0xe)) = 0x602;
    (*(vu16 *)(0x4000000 + 0x50)) = 0;
    (*(vu16 *)(0x4000000 + 0x10)) = 0;
    (*(vu16 *)(0x4000000 + 0x12)) = 0;
    (*(vu16 *)(0x4000000 + 0x14)) = 0;
    (*(vu16 *)(0x4000000 + 0x16)) = 0;
    (*(vu16 *)(0x4000000 + 0x18)) = 0;
    (*(vu16 *)(0x4000000 + 0x1a)) = 0;
    (*(vu16 *)(0x4000000 + 0x1c)) = 0;
    (*(vu16 *)(0x4000000 + 0x1e)) = 0;
    (*(vu16 *)(0x4000000 + 0x1e)) = -1;
}

bool8 IsLinkDoubleBattle()
{
    if ((gBattleTypeFlags & (0x0040 | 0x0008 | 0x0002 | 0x0001)) == (0x0040 | 0x0008 | 0x0002 | 0x0001))
        return 1;
    else
        return 0;
}


void ReDrawPartyMonBackgrounds(void)
{
    if ((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261)
    {
        const void *src = gBGTilemapBuffers[2];
        void *dest = (void *)(0x6000000 + 0x3000);
        { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(src); dmaRegs[1] = (vu32)(dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0000 | 0x0000 | 0x0000) << 16 | ((0x800)/(16/8))); dmaRegs[2]; };

        if ((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 == 2)
        {
            (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 0;
        }
    }
}

bool8 DrawPartyMonBackground(u8 monIndex)
{
    const u8 *arr;

    if (!IsDoubleBattle())
        gPartyMenuType = PARTY_MENU_LAYOUT_STANDARD;
    else if (IsLinkDoubleBattle() == 1)
        gPartyMenuType = PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE;
    else
        gPartyMenuType = PARTY_MENU_LAYOUT_DOUBLE_BATTLE;

    arr = &gUnknown_083769A8[gPartyMenuType * 12];

    switch (monIndex)
    {
    case 0:
        memset(&gBGTilemapBuffers[2], 0, 0x800);
        break;
    case 1:
        sub_806B9A4(arr[0], arr[1], 3);
        sub_806BF24(&arr[0], 0, 3, 0);
        break;
    case 2:
        if (!IsDoubleBattle()) {
            if (gPlayerPartyCount > 1) {
                sub_806BA94(arr[2], arr[3], 0, 3);
                sub_806BF24(&arr[2], 1, 3, 0);
            } else {
                sub_806BA94(arr[2], arr[3], 1, 3);
            }
        } else if (IsLinkDoubleBattle() == 1) {
            sub_806B9A4(arr[2], arr[3], 4);
            sub_806BF24(&arr[2], 1, 4, 0);
        } else {
            sub_806B9A4(arr[2], arr[3], 3);
            sub_806BF24(&arr[2], 1, 3, 0);
        }

        break;
    case 3:
        if (!IsDoubleBattle()) {
            if (gPlayerPartyCount > 2) {
                sub_806BA94(arr[4], arr[5], 0, 3);
                sub_806BF24(&arr[4], 2, 3, 0);
            } else {
                sub_806BA94(arr[4], arr[5], 1, 3);
            }
        } else if (IsLinkDoubleBattle() == 1) {
            if (GetMonData(&gPlayerParty[2], 11)) {
                sub_806BA94(arr[4], arr[5], 0, 3);
                sub_806BF24(&arr[4], 2, 3, 0);
            } else {
                sub_806BA94(arr[4], arr[5], 1, 3);
            }
        } else if (gPlayerPartyCount > 2) {
            sub_806BA94(arr[4], arr[5], 0, 3);
            sub_806BF24(&arr[4], 2, 3, 0);
        } else {
            sub_806BA94(arr[4], arr[5], 1, 3);
        }

        break;
    case 4:
        if (!IsDoubleBattle()) {
            if (gPlayerPartyCount > 3) {
                sub_806BA94(arr[6], arr[7], 0, 3);
                sub_806BF24(&arr[6], 3, 3, 0);
            } else {
                sub_806BA94(arr[6], arr[7], 1, 3);
            }
        } else if (IsLinkDoubleBattle() == 1) {
            if (GetMonData(&gPlayerParty[3], 11)) {
                sub_806BA94(arr[6], arr[7], 0, 3);
                sub_806BF24(&arr[6], 3, 3, 0);
            } else {
                sub_806BA94(arr[6], arr[7], 1, 3);
            }
        } else if (gPlayerPartyCount > 3) {
            sub_806BA94(arr[6], arr[7], 0, 3);
            sub_806BF24(&arr[6], 3, 3, 0);
        } else {
            sub_806BA94(arr[6], arr[7], 1, 3);
        }

        break;
    case 5:
        if (!IsDoubleBattle()) {
            if (gPlayerPartyCount > 4) {
                sub_806BA94(arr[8], arr[9], 0, 3);
                sub_806BF24(&arr[8], 4, 3, 0);
            } else {
                sub_806BA94(arr[8], arr[9], 1, 3);
            }
        } else if (IsLinkDoubleBattle() == 1) {
            if (GetMonData(&gPlayerParty[4], 11)) {
                sub_806BA94(arr[8], arr[9], 0, 4);
                sub_806BF24(&arr[8], 4, 4, 0);
            } else {
                sub_806BA94(arr[8], arr[9], 1, 4);
            }
        } else if (gPlayerPartyCount > 4) {
            sub_806BA94(arr[8], arr[9], 0, 3);
            sub_806BF24(&arr[8], 4, 3, 0);
        } else {
            sub_806BA94(arr[8], arr[9], 1, 3);
        }

        break;
    case 6:
        if (!IsDoubleBattle()) {
            if (gPlayerPartyCount > 5) {
                sub_806BA94(arr[10], arr[11], 0, 3);
                sub_806BF24(&arr[10], 5, 3, 0);
            } else {
                sub_806BA94(arr[10], arr[11], 1, 3);
            }
        } else if (IsLinkDoubleBattle() == 1) {
            if (GetMonData(&gPlayerParty[5], 11)) {
                sub_806BA94(arr[10], arr[11], 0, 4);
                sub_806BF24(&arr[10], 5, 4, 0);
            } else {
                sub_806BA94(arr[10], arr[11], 1, 4);
            }
        } else if (gPlayerPartyCount > 5) {
            sub_806BA94(arr[10], arr[11], 0, 3);
            sub_806BF24(&arr[10], 5, 3, 0);
        } else {
            sub_806BA94(arr[10], arr[11], 1, 3);
        }

        break;
    case 7:
        if ((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).menuType == PARTY_MENU_TYPE_BATTLE_TOWER) {
            sub_806BB9C(1);
        }

        sub_806BBEC(1);
        break;
    case 8:
        (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 2;
        return 1;
    }

    return 0;
}
# 1043 "src/field/party_menu.c"
__attribute__((naked))
void sub_806B908(void)
{
    asm(".syntax unified\n    push {r4,r5,lr}\n    ldr r0, _0806B948 @ =gBGTilemapBuffers + 0x1000\n    movs r2, 0x80\n    lsls r2, 4\n    movs r1, 0\n    bl memset\n    ldr r1, _0806B94C @ =gPartyMenuType\n    movs r0, 0x3\n    strb r0, [r1]\n    ldr r0, _0806B950 @ =gUnknown_083769A8\n    adds r4, r0, 0\n    adds r4, 0x24\n    ldr r5, _0806B954 @ =gPlayerParty + 1 * 0x64\n    ldrb r0, [r4]\n    ldrb r1, [r4, 0x1]\n    movs r2, 0x3\n    bl sub_806B9A4\n    adds r0, r5, 0\n    movs r1, 0xB\n    bl GetMonData\n    cmp r0, 0\n    beq _0806B958\n    ldrb r0, [r4, 0x4]\n    ldrb r1, [r4, 0x5]\n    movs r2, 0\n    movs r3, 0x3\n    bl sub_806BA94\n    b _0806B964\n    .align 2, 0\n_0806B948: .4byte gBGTilemapBuffers + 0x1000\n_0806B94C: .4byte gPartyMenuType\n_0806B950: .4byte gUnknown_083769A8\n_0806B954: .4byte gPlayerParty + 1 * 0x64\n_0806B958:\n    ldrb r0, [r4, 0x4]\n    ldrb r1, [r4, 0x5]\n    movs r2, 0x1\n    movs r3, 0x3\n    bl sub_806BA94\n_0806B964:\n    adds r0, r5, 0\n    adds r0, 0x64\n    movs r1, 0xB\n    bl GetMonData\n    cmp r0, 0\n    beq _0806B980\n    ldrb r0, [r4, 0x6]\n    ldrb r1, [r4, 0x7]\n    movs r2, 0\n    movs r3, 0x3\n    bl sub_806BA94\n    b _0806B98C\n_0806B980:\n    ldrb r0, [r4, 0x6]\n    ldrb r1, [r4, 0x7]\n    movs r2, 0x1\n    movs r3, 0x3\n    bl sub_806BA94\n_0806B98C:\n    ldr r0, _0806B99C @ =gSharedMem + 0x1B000\n    ldr r1, _0806B9A0 @ =0x00000261\n    adds r0, r1\n    movs r1, 0x2\n    strb r1, [r0]\n    pop {r4,r5}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0806B99C: .4byte gSharedMem + 0x1B000\n_0806B9A0: .4byte 0x00000261\n    .syntax divided\n");
# 1118 "src/field/party_menu.c"
}


void sub_806B9A4(s16 a, u16 b, u8 c)
{
    u8 i;
    u16 var1 = b * 32;

    for (i = 0; i <= 6; i++)
    {
        u8 j = 0;

        if (a <= 0x1F)
        {
            for (; j < 10 && a + j <= 0x1F; j++)
            {
                if (a + j >= 0)
                {
                    gBGTilemapBuffers[2][var1 + (i * 32) + (a + j) + 1] = (c << 12) | gUnknown_083769D8[i * 10 + j];
                }
            }
        }
    }
}

void sub_806BA34(s16 a, u16 b)
{
    u8 i;
    u16 var1 = b * 32;

    for (i = 0; i <= 6; i++)
    {
        u8 j = 0;

        if (a <= 0x1F)
        {
            for (; j < 10 && a + j <= 0x1F; j++)
            {
                if (a + j >= 0)
                {
                    gBGTilemapBuffers[2][var1 + (i * 32) + (a + j) + 1] = 0;
                }
            }
        }
    }
}

void sub_806BA94(s16 a, u16 b, u8 c, u8 d)
{
    u8 i;
    const u8 *arr;
    u16 var1;

    arr = gUnknown_08376A5E;
    if (c == 0)
    {
        arr = gUnknown_08376A25;
    }

    var1 = b * 32;


    for (i = 0; i < 3; i++)
    {
        u8 j = 0;

        if (a <= 0x1F)
        {
            while (j < 0x12 && a + j <= 0x1F)
            {
                if (a + j >= 0)
                {
                    gBGTilemapBuffers[2][var1 + (i * 32) + (a + j) + 1] = (d << 12) | arr[i * 18 + j];
                }

                j++;
            }
        }
    }
}

void sub_806BB3C(s16 a, u16 b)
{
    u8 i;
    u16 var1 = (b * 32);

    for (i = 0; i < 3; i++)
    {
        u8 j = 0;

        if (a <= 0x1F)
        {
            for (; j < 0x12 && a + j <= 0x1F; j++)
            {
                if (a + j >= 0)
                {
                    gBGTilemapBuffers[2][var1 + (i * 32) + (a + j) + 1] = 0;
                }
            }
        }
    }
}

void sub_806BB9C(u8 a)
{
    u8 i;
    u16 *vramPtr;
    const u16 arr[12];

    memcpy(&arr, gUnknown_08376CD4, sizeof gUnknown_08376CD4);

    vramPtr = (u16 *)(0x6000000 + 0x3C30);
    for (i = 0; i < 6; i++)
    {
        vramPtr[i] = arr[i] + (a << 12);
        vramPtr[i + 0x20] = arr[i + 6] + (a << 12);
    }
}

void sub_806BBEC(u8 a)
{
    u8 i;
    u16 *vramPtr;
    const u16 arr[12];

    memcpy(&arr, gUnknown_08376CEC, sizeof gUnknown_08376CEC);

    vramPtr = (u16 *)(0x6000000 + 0x3CB0);
    for (i = 0; i < 6; i++)
    {
        vramPtr[i] = arr[i] + (a << 12);
        vramPtr[i + 0x20] = arr[i + 6] + (a << 12);
    }
}

void sub_806BC3C(u8 monIndex, u8 b)
{
    u16 *vramPtr = gUnknown_08376918[IsDoubleBattle()][monIndex];
    u8 i;
    u16 var1;

    for (i = 0, var1 = (b / 7) * 32; i <= 6; i++)
    {
        u32 offset = i + var1;
        vramPtr[i] = gUnknown_08E9A300[offset] + 0x10C;
        vramPtr[i + 0x20] = gUnknown_08E9A300[offset + 0x20] + 0x10C;
    }
}

void unref_sub_806BCB8(u8 a)
{
    u8 i;

    for (i = 0; i < gPlayerPartyCount; i++)
    {
        sub_806BC3C(i, a);
    }
}


void sub_806BCE8()
{
    u8 i;

    for (i = 0; i < gPlayerPartyCount; i++)
    {
        if (!GetMonData(&gPlayerParty[i], 45))
        {
            u8 gender = GetMonGender(&gPlayerParty[i]);
            switch (gender)
            {
            case 0x00:
                sub_806BC3C(i, 0x54);
                break;
            case 0xFE:
                sub_806BC3C(i, 0x62);
                break;
            default:
                sub_806BC3C(i, 0x46);
                break;
            }
        }
        else
        {
            sub_806BC3C(i, 0x46);
        }
    }
}

u8 sub_806BD58(u8 taskId, u8 b)
{
    u8 spriteId = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    sub_806CA18(taskId, spriteId);
    return 1;
}
# 1366 "src/field/party_menu.c"
__attribute__((naked))
u16 HandleDefaultPartyMenuInput(u8 taskId)
{
    asm(".syntax unified\n    push {r4,r5,lr}\n    lsls r0, 24\n    lsrs r5, r0, 24\n    movs r4, 0\n    ldr r0, _0806BD9C @ =gMain\n    ldrh r0, [r0, 0x30]\n    cmp r0, 0x20\n    beq _0806BDB2\n    cmp r0, 0x20\n    bgt _0806BDA0\n    cmp r0, 0x10\n    beq _0806BDB6\n    b _0806BDB8\n    .align 2, 0\n_0806BD9C: .4byte gMain\n_0806BDA0:\n    cmp r0, 0x40\n    beq _0806BDAA\n    cmp r0, 0x80\n    beq _0806BDAE\n    b _0806BDB8\n_0806BDAA:\n    movs r4, 0xFF\n    b _0806BDB8\n_0806BDAE:\n    movs r4, 0x1\n    b _0806BDB8\n_0806BDB2:\n    movs r4, 0xFE\n    b _0806BDB8\n_0806BDB6:\n    movs r4, 0x2\n_0806BDB8:\n    lsls r0, r4, 24\n    cmp r0, 0\n    bne _0806BDDC\n    bl sub_80F92BC\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x1\n    beq _0806BDD0\n    cmp r0, 0x2\n    beq _0806BDD4\n    b _0806BDD6\n_0806BDD0:\n    movs r4, 0xFF\n    b _0806BDD6\n_0806BDD4:\n    movs r4, 0x1\n_0806BDD6:\n    lsls r0, r4, 24\n    cmp r0, 0\n    beq _0806BDF0\n_0806BDDC:\n    asrs r1, r0, 24\n    adds r0, r5, 0\n    bl ChangePartyMenuSelection\n    ldr r0, _0806BDEC @ =gMain\n    ldrh r0, [r0, 0x30]\n    b _0806BE2C\n    .align 2, 0\n_0806BDEC: .4byte gMain\n_0806BDF0:\n    ldr r0, _0806BE1C @ =gMain\n    ldrh r1, [r0, 0x2E]\n    movs r0, 0x1\n    ands r0, r1\n    cmp r0, 0\n    beq _0806BE24\n    ldr r4, _0806BE20 @ =gSprites\n    adds r0, r5, 0\n    bl sub_806CA00\n    lsls r0, 24\n    lsrs r0, 24\n    lsls r1, r0, 4\n    adds r1, r0\n    lsls r1, 2\n    adds r1, r4\n    movs r2, 0x2E\n    ldrsh r0, [r1, r2]\n    cmp r0, 0x7\n    bne _0806BE24\n    movs r0, 0x2\n    b _0806BE2C\n    .align 2, 0\n_0806BE1C: .4byte gMain\n_0806BE20: .4byte gSprites\n_0806BE24:\n    ldr r0, _0806BE34 @ =gMain\n    ldrh r1, [r0, 0x2E]\n    movs r0, 0x3\n    ands r0, r1\n_0806BE2C:\n    pop {r4,r5}\n    pop {r1}\n    bx r1\n    .align 2, 0\n_0806BE34: .4byte gMain\n    .syntax divided\n");
# 1469 "src/field/party_menu.c"
}


u16 HandleBattleTowerPartyMenuInput(u8 taskId)
{
    u8 menuDirectionPressed = 0x0;

    switch (gMain.newAndRepeatedKeys)
    {
    case 0x0040:
        menuDirectionPressed = 0xFF;
        break;
    case 0x0080:
        menuDirectionPressed = 0x1;
        break;
    case 0x0020:
        menuDirectionPressed = 0xFE;
        break;
    case 0x0010:
        menuDirectionPressed = 0x2;
        break;
    }

    if (menuDirectionPressed == 0)
    {
        u8 var1 = sub_80F92BC();
        switch (var1)
        {
        case 1:
            menuDirectionPressed = 0xFF;
            break;
        case 2:
            menuDirectionPressed = 0x1;
            break;
        }
    }

    if (gMain.newKeys & 0x0008)
    {
        SelectBattleTowerOKButton(taskId);
        return 0x0008;
    }
    else
    {
        s8 signedMenuDirection = menuDirectionPressed;
        if (signedMenuDirection)
        {
            ChangeBattleTowerPartyMenuSelection(taskId, signedMenuDirection);
            return gMain.newAndRepeatedKeys;
        }
        else
        {
            if (gMain.newKeys & 0x0001)
            {
                if (gSprites[sub_806CA00(taskId)].data[0] == 7)
                {
                    return 0x0002;
                }
            }
        }
    }

    return gMain.newKeys & (0x0001 | 0x0002);
}

void task_pc_turn_off(const u8 *a, u8 b)
{
    if (a[0])
        sub_806BA94(a[0], a[1], 0, b);
    else
        sub_806B9A4(a[0], a[1], b);
}

void sub_806BF24(const u8 *a, u8 monIndex, u8 c, u8 d)
{
    if (GetMonData(&gPlayerParty[monIndex], 11) && GetMonData(&gPlayerParty[monIndex], 57) == 0)
        c = 6 - 1;

    if (d == 1)
        c += 4;

    task_pc_turn_off(a, c);
}

void ChangePartyMenuSelection(u8 taskId, s8 directionPressed)
{
    bool8 isLinkDoubleBattle;
    u8 spriteId = sub_806CA00(taskId);
    u8 menuIndex = gSprites[spriteId].data[0];

    UpdateMonIconFrame_806DA44(taskId, menuIndex, 0);

    isLinkDoubleBattle = IsLinkDoubleBattle();
    if (isLinkDoubleBattle == 1)
    {
        if (menuIndex == 0 || menuIndex == 2 || menuIndex == 3)
            sub_806BF24(&gUnknown_083769C0[menuIndex * 2], menuIndex, 3, 0);
        if (menuIndex == 1 || menuIndex == 4 || menuIndex == 5)
            sub_806BF24(&gUnknown_083769C0[menuIndex * 2], menuIndex, 4, 0);
        if (menuIndex == 7)
            sub_806BBEC(1);

        ChangeLinkDoubleBattlePartyMenuSelection(spriteId, menuIndex, directionPressed);

        if (gSprites[spriteId].data[0] == 0 || gSprites[spriteId].data[0] == 2 || gSprites[spriteId].data[0] == 3)
            sub_806BF24(&gUnknown_083769C0[gSprites[spriteId].data[0] * 2], gSprites[spriteId].data[0], 3, 1);
        if (gSprites[spriteId].data[0] == 1 || gSprites[spriteId].data[0] == 4 || gSprites[spriteId].data[0] == 5)
                sub_806BF24(&gUnknown_083769C0[gSprites[spriteId].data[0] * 2], gSprites[spriteId].data[0], 4, 1);
        if (gSprites[spriteId].data[0] == 7)
            sub_806BBEC(2);

        (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 2;

        gSprites[spriteId].pos1.x = gUnknown_083768B8[PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE][gSprites[spriteId].data[0]].x;
        gSprites[spriteId].pos1.y = gUnknown_083768B8[PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE][gSprites[spriteId].data[0]].y;
    }
    else
    {
        u8 isDoubleBattle = IsDoubleBattle();

        if (menuIndex < 6)
        {
            sub_806BF24(&gUnknown_083769A8[isDoubleBattle * 12 + menuIndex * 2], menuIndex, 3, 0);
        }
        else
        {
            sub_806BBEC(1);
        }

        if (!isDoubleBattle)
        {
            ChangeDefaultPartyMenuSelection(spriteId, menuIndex, directionPressed);
        }
        else
        {
            ChangeDoubleBattlePartyMenuSelection(spriteId, menuIndex, directionPressed);
        }

        if (gSprites[spriteId].data[0] < 6)
        {
            sub_806BF24(&gUnknown_083769A8[isDoubleBattle * 12 + gSprites[spriteId].data[0] * 2], gSprites[spriteId].data[0], 3, 1);
        }
        else
        {
            sub_806BBEC(2);
        }

        (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 2;

        gSprites[spriteId].pos1.x = gUnknown_083768B8[isDoubleBattle][gSprites[spriteId].data[0]].x;
        gSprites[spriteId].pos1.y = gUnknown_083768B8[isDoubleBattle][gSprites[spriteId].data[0]].y;
    }

    UpdateMonIconFrame_806DA44(taskId, gSprites[spriteId].data[0], 1);

    if (menuIndex != gSprites[spriteId].data[0])
    {
        PlaySE(5);
    }
}

void ChangeDefaultPartyMenuSelection(u8 spriteId, u8 menuIndex, s8 directionPressed)
{
    u8 nextIndex;
    s8 menuMovement = directionPressed + 2;

    switch (menuMovement)
    {
    case 2:
        gSprites[spriteId].data[1] = 0;
        break;
    case 1:
        if (menuIndex == 0) {
            gSprites[spriteId].data[0] = 7;
        } else if (menuIndex == 7) {
            gSprites[spriteId].data[0] = gPlayerPartyCount - 1;
        } else {
            s8 diff = directionPressed;
            gSprites[spriteId].data[0] += diff;
        }

        gSprites[spriteId].data[1] = 0;
        break;
    case 3:
        if (menuIndex == gPlayerPartyCount - 1) {
            gSprites[spriteId].data[0] = 7;
        } else if (menuIndex == 7) {
            gSprites[spriteId].data[0] = 0;
        } else {
            s8 diff = directionPressed;
            gSprites[spriteId].data[0] += diff;
        }

        gSprites[spriteId].data[1] = 0;
        break;
    case 4:
        if (gPlayerPartyCount > 1 && menuIndex == 0)
        {
            if (gSprites[spriteId].data[1] == 0)
                gSprites[spriteId].data[1] = 1;

            gSprites[spriteId].data[0] = gSprites[spriteId].data[1];
        }
        break;
    case 0:

        nextIndex = menuIndex - 1;
        if (nextIndex <= 4) {
            gSprites[spriteId].data[0] = 0;
            gSprites[spriteId].data[1] = menuIndex;
        }
        break;
    }
}

void ChangeDoubleBattlePartyMenuSelection(u8 spriteId, u8 menuIndex, s8 directionPressed)
{
    u8 var1;
    s8 menuMovement = directionPressed + 2;

    switch(menuMovement)
    {
    case 2:
        gSprites[spriteId].data[1] = 0;
        break;
    case 3:
        if (menuIndex == 7) {
            gSprites[spriteId].data[0] = 0;
        } else if (menuIndex == gPlayerPartyCount - 1) {
            gSprites[spriteId].data[0] = 7;
        } else {
            s8 diff = directionPressed;
            gSprites[spriteId].data[0] += diff;
        }

        gSprites[spriteId].data[1] = 0;
        break;
    case 1:
        if (menuIndex == 0) {
            gSprites[spriteId].data[0] = 7;
        } else if (menuIndex == 7) {
            gSprites[spriteId].data[0] = gPlayerPartyCount - 1;
        } else {
            s8 diff = directionPressed;
            gSprites[spriteId].data[0] += diff;
        }

        gSprites[spriteId].data[1] = 0;
        break;
    case 4:
        if (menuIndex == 0) {
            if (gPlayerPartyCount > 2) {
                u16 var1 = gSprites[spriteId].data[1] - 2;
                if (var1 > 1)
                    gSprites[spriteId].data[0] = 2;
                else
                    gSprites[spriteId].data[0] = gSprites[spriteId].data[1];
            }
        }
        else if (menuIndex == 1) {
            if (gPlayerPartyCount > 4) {
                u16 var1 = gSprites[spriteId].data[1] - 4;
                if (var1 <= 1)
                    gSprites[spriteId].data[0] = gSprites[spriteId].data[1];
                else
                    gSprites[spriteId].data[0] = 4;
            }
        }
        break;
    case 0:
        var1 = menuIndex - 2;
        if (var1 <= 1) {
            gSprites[spriteId].data[0] = 0;
            gSprites[spriteId].data[1] = menuIndex;
        } else {
            u8 var2 = menuIndex - 4;
            if (var2 <= 1) {
                gSprites[spriteId].data[0] = 1;
                gSprites[spriteId].data[1] = menuIndex;
            }
        }
        break;
    }
}
# 1843 "src/field/party_menu.c"
__attribute__((naked))
void ChangeLinkDoubleBattlePartyMenuSelection(u8 spriteId, u8 menuIndex, s8 directionPressed)
{
    asm(".syntax unified\n    push {r4-r6,lr}\n    lsls r0, 24\n    lsrs r5, r0, 24\n    lsls r1, 24\n    lsrs r4, r1, 24\n    lsls r2, 24\n    movs r0, 0x80\n    lsls r0, 18\n    adds r2, r0\n    asrs r0, r2, 24\n    cmp r0, 0x4\n    bls _0806C4AA\n    b _0806C64E\n_0806C4AA:\n    lsls r0, 2\n    ldr r1, _0806C4B4 @ =_0806C4B8\n    adds r0, r1\n    ldr r0, [r0]\n    mov pc, r0\n    .align 2, 0\n_0806C4B4: .4byte _0806C4B8\n    .align 2, 0\n_0806C4B8:\n    .4byte _0806C618\n    .4byte _0806C524\n    .4byte _0806C4CC\n    .4byte _0806C4E0\n    .4byte _0806C57C\n_0806C4CC:\n    ldr r0, _0806C4DC @ =gSprites\n    lsls r1, r5, 4\n    adds r1, r5\n    lsls r1, 2\n    adds r1, r0\n    movs r0, 0\n    strh r0, [r1, 0x30]\n    b _0806C64E\n    .align 2, 0\n_0806C4DC: .4byte gSprites\n_0806C4E0:\n    cmp r4, 0x7\n    bne _0806C4FC\n    ldr r2, _0806C4F8 @ =gSprites\n    lsls r3, r5, 4\n    adds r0, r3, r5\n    lsls r0, 2\n    adds r0, r2\n    movs r1, 0\n    strh r1, [r0, 0x2E]\n    adds r1, r2, 0\n    adds r6, r3, 0\n    b _0806C566\n    .align 2, 0\n_0806C4F8: .4byte gSprites\n_0806C4FC:\n    lsls r6, r5, 4\n    b _0806C518\n_0806C500:\n    adds r0, r4, 0x1\n    lsls r0, 24\n    lsrs r4, r0, 24\n    movs r0, 0x64\n    muls r0, r4\n    ldr r1, _0806C520 @ =gPlayerParty\n    adds r0, r1\n    movs r1, 0xB\n    bl GetMonData\n    cmp r0, 0\n    bne _0806C528\n_0806C518:\n    cmp r4, 0x5\n    bne _0806C500\n    b _0806C558\n    .align 2, 0\n_0806C520: .4byte gPlayerParty\n_0806C524:\n    lsls r6, r5, 4\n    b _0806C554\n_0806C528:\n    ldr r1, _0806C534 @ =gSprites\n    adds r0, r6, r5\n    lsls r0, 2\n    adds r0, r1\n    strh r4, [r0, 0x2E]\n    b _0806C566\n    .align 2, 0\n_0806C534: .4byte gSprites\n_0806C538:\n    subs r0, r4, 0x1\n    lsls r0, 24\n    lsrs r4, r0, 24\n    cmp r4, 0x6\n    beq _0806C554\n    movs r0, 0x64\n    muls r0, r4\n    ldr r1, _0806C574 @ =gPlayerParty\n    adds r0, r1\n    movs r1, 0xB\n    bl GetMonData\n    cmp r0, 0\n    bne _0806C528\n_0806C554:\n    cmp r4, 0\n    bne _0806C538\n_0806C558:\n    ldr r0, _0806C578 @ =gSprites\n    adds r1, r6, r5\n    lsls r1, 2\n    adds r1, r0\n    movs r2, 0x7\n    strh r2, [r1, 0x2E]\n    adds r1, r0, 0\n_0806C566:\n    adds r0, r6, r5\n    lsls r0, 2\n    adds r0, r1\n    movs r1, 0\n    strh r1, [r0, 0x30]\n    b _0806C64E\n    .align 2, 0\n_0806C574: .4byte gPlayerParty\n_0806C578: .4byte gSprites\n_0806C57C:\n    cmp r4, 0\n    bne _0806C5C8\n    ldr r0, _0806C5AC @ =gSprites\n    lsls r1, r5, 4\n    adds r1, r5\n    lsls r1, 2\n    adds r4, r1, r0\n    ldrh r1, [r4, 0x30]\n    subs r0, r1, 0x2\n    lsls r0, 16\n    lsrs r0, 16\n    cmp r0, 0x1\n    bls _0806C5E2\n    ldr r5, _0806C5B0 @ =gPlayerParty + 2 * 0x64\n    adds r0, r5, 0\n    movs r1, 0xB\n    bl GetMonData\n    cmp r0, 0\n    beq _0806C5B4\n    movs r0, 0x2\n    strh r0, [r4, 0x2E]\n    b _0806C64E\n    .align 2, 0\n_0806C5AC: .4byte gSprites\n_0806C5B0: .4byte gPlayerParty + 2 * 0x64\n_0806C5B4:\n    adds r0, r5, 0\n    adds r0, 0x64\n    movs r1, 0xB\n    bl GetMonData\n    cmp r0, 0\n    beq _0806C64E\n    movs r0, 0x3\n    strh r0, [r4, 0x2E]\n    b _0806C64E\n_0806C5C8:\n    cmp r4, 0x1\n    bne _0806C64E\n    ldr r0, _0806C5E8 @ =gSprites\n    lsls r1, r5, 4\n    adds r1, r5\n    lsls r1, 2\n    adds r4, r1, r0\n    ldrh r1, [r4, 0x30]\n    subs r0, r1, 0x4\n    lsls r0, 16\n    lsrs r0, 16\n    cmp r0, 0x1\n    bhi _0806C5EC\n_0806C5E2:\n    strh r1, [r4, 0x2E]\n    b _0806C64E\n    .align 2, 0\n_0806C5E8: .4byte gSprites\n_0806C5EC:\n    ldr r5, _0806C600 @ =gPlayerParty + 4 * 0x64\n    adds r0, r5, 0\n    movs r1, 0xB\n    bl GetMonData\n    cmp r0, 0\n    beq _0806C604\n    movs r0, 0x4\n    strh r0, [r4, 0x2E]\n    b _0806C64E\n    .align 2, 0\n_0806C600: .4byte gPlayerParty + 4 * 0x64\n_0806C604:\n    adds r0, r5, 0\n    adds r0, 0x64\n    movs r1, 0xB\n    bl GetMonData\n    cmp r0, 0\n    beq _0806C64E\n    movs r0, 0x5\n    strh r0, [r4, 0x2E]\n    b _0806C64E\n_0806C618:\n    subs r0, r4, 0x2\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x1\n    bhi _0806C634\n    ldr r0, _0806C630 @ =gSprites\n    lsls r1, r5, 4\n    adds r1, r5\n    lsls r1, 2\n    adds r1, r0\n    movs r0, 0\n    b _0806C64A\n    .align 2, 0\n_0806C630: .4byte gSprites\n_0806C634:\n    subs r0, r4, 0x4\n    lsls r0, 24\n    lsrs r0, 24\n    cmp r0, 0x1\n    bhi _0806C64E\n    ldr r0, _0806C654 @ =gSprites\n    lsls r1, r5, 4\n    adds r1, r5\n    lsls r1, 2\n    adds r1, r0\n    movs r0, 0x1\n_0806C64A:\n    strh r0, [r1, 0x2E]\n    strh r4, [r1, 0x30]\n_0806C64E:\n    pop {r4-r6}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0806C654: .4byte gSprites\n    .syntax divided\n");
# 2083 "src/field/party_menu.c"
}


void ChangeBattleTowerPartyMenuSelection(u8 taskId, s8 directionPressed)
{
    u16 newMenuIndex;
    u8 newMenuIndex2;
    u8 newMenuIndex3;
    s8 menuMovement;
    u8 spriteId = sub_806CA00(taskId);
    u8 menuIndex = gSprites[spriteId].data[0];

    UpdateMonIconFrame_806DA44(taskId, menuIndex, 0);

    if (menuIndex < 6)
    {
        sub_806BF24(&gUnknown_083769A8[menuIndex * 2], menuIndex, 3, 0);
    }
    else if (menuIndex == 6)
    {
        sub_806BB9C(1);
    }
    else
    {
        sub_806BBEC(1);
    }

    menuMovement = directionPressed + 2;

    switch (menuMovement)
    {
    case 2:
        gSprites[spriteId].data[1] = 0;
        break;
    case 1:
        if (menuIndex == 0) {
            gSprites[spriteId].data[0] = 7;
        } else if (menuIndex == 6) {
            gSprites[spriteId].data[0] = gPlayerPartyCount - 1;
        } else {
            gSprites[spriteId].data[0] += directionPressed;
        }

        gSprites[spriteId].data[1] = 0;
        break;
    case 3:
        if (menuIndex == gPlayerPartyCount - 1) {
            gSprites[spriteId].data[0] = 6;
        } else if (menuIndex == 7) {
            gSprites[spriteId].data[0] = 0;
        } else {
            gSprites[spriteId].data[0] += directionPressed;
        }

        gSprites[spriteId].data[1] = 0;
        break;
    case 4:
        if (gPlayerPartyCount > 1 && menuIndex == 0)
        {
            if (gSprites[spriteId].data[1] == 0) {
                gSprites[spriteId].data[1] = 1;
            }

            gSprites[spriteId].data[0] = gSprites[spriteId].data[1];
        }
        break;
    case 0:
        newMenuIndex3 = menuIndex - 1;
        if (newMenuIndex3 <= 4)
        {
            gSprites[spriteId].data[0] = 0;
            gSprites[spriteId].data[1] = menuIndex;
        }
        break;
    }

    gSprites[spriteId].pos1.x = gUnknown_083768B8[PARTY_MENU_LAYOUT_STANDARD][gSprites[spriteId].data[0]].x;
    gSprites[spriteId].pos1.y = gUnknown_083768B8[PARTY_MENU_LAYOUT_STANDARD][gSprites[spriteId].data[0]].y;


    newMenuIndex = gSprites[spriteId].data[0];
    if (gSprites[spriteId].data[0] < 6)
    {
        sub_806BF24(&gUnknown_083769A8[gSprites[spriteId].data[0] * 2], newMenuIndex, 3, 1);
    }
    else if (gSprites[spriteId].data[0] == 6)
    {
        sub_806BB9C(2);
    }
    else
    {
        sub_806BBEC(2);
    }

    (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 2;

    newMenuIndex2 = gSprites[spriteId].data[0];
    UpdateMonIconFrame_806DA44(taskId, newMenuIndex2, 1);

    if (menuIndex != gSprites[spriteId].data[0])
    {
        PlaySE(5);
    }
}


void SelectBattleTowerOKButton(u8 taskId)
{
    u8 spriteId = sub_806CA00(taskId);

    u8 menuIndex = gSprites[spriteId].data[0];
    if (menuIndex != 6)
    {
        UpdateMonIconFrame_806DA44(taskId, menuIndex, 0);

        if (menuIndex < 6)
        {
            sub_806BF24(&gUnknown_083769A8[menuIndex * 2], menuIndex, 3, 0);
        }
        else
        {
            sub_806BBEC(1);
        }

        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].data[0] = 6;
        gSprites[spriteId].pos1.x = gUnknown_083768B8[PARTY_MENU_LAYOUT_STANDARD][6].x;
        gSprites[spriteId].pos1.y = gUnknown_083768B8[PARTY_MENU_LAYOUT_STANDARD][6].y;

        sub_806BB9C(2);

        (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 2;
        PlaySE(5);
    }
}

void sub_806C92C(u8 spriteId)
{
    u8 menuIndex1 = gSprites[spriteId].data[0];
    u8 menuIndex2 = gSprites[spriteId].data[1];

    if (!IsDoubleBattle())
    {
        if (menuIndex1 < 1) {
            if (menuIndex2 < 1) {
                menuIndex2 = 1;
            }
        } else {
            if (menuIndex2 >= 1) {
                menuIndex2 = 0;
            }
        }
    } else {
        if (menuIndex1 < 2) {
            if (menuIndex2 < 2) {
                menuIndex2 = 2;
            }
        } else {
            if (menuIndex2 >= 2) {
                menuIndex2 = 0;
            }
        }
    }

    gSprites[spriteId].data[1] = menuIndex2;
}

void sub_806C994(u8 taskId, u8 b)
{
    u8 spriteId = sub_806CA00(taskId);

    gSprites[spriteId].data[0] = b;
    sub_806C92C(spriteId);
}

void sub_806C9C4(u8 taskId, u8 spriteId)
{
    u8 spriteId2 = sub_806CA00(taskId);

    gSprites[spriteId].pos1.x = gSprites[spriteId2].pos1.x;
    gSprites[spriteId].pos1.y = gSprites[spriteId2].pos1.y;
    gSprites[spriteId].data[0] = gSprites[spriteId2].data[0];
}

u8 sub_806CA00(u8 taskId)
{
    return gTasks[taskId].data[3] >> 8;
}

void sub_806CA18(u8 taskId, u8 b)
{
    u8 var1 = gTasks[taskId].data[3];
    gTasks[taskId].data[3] = var1 | (b << 8);
}

u8 sub_806CA38(u8 taskId)
{
    u8 spriteId = sub_806CA00(taskId);
    return gSprites[spriteId].data[0];
}

void SetupDefaultPartyMenuSwitchPokemon(u8 taskId)
{
    gTasks[taskId].func = TaskDummy;
    (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk0 = taskId;

    CreateTask(HandlePartyMenuSwitchPokemonInput, 0);
    (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk1 = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);

    sub_806C9C4(taskId, (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk1);
    (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk2 = sub_806CA00(taskId);

    PrintPartyMenuPromptText((*(struct Struct201B000 *)(gSharedMem + 0x1B000)).unk272, 0);

    sub_806BF24(&gUnknown_083769A8[gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk1].data[0] * 2], gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk1].data[0], 6, 0);
    (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 2;
}


void ChangePartyMenuSwitchPokemonSelection(u8 taskId, s16 menuDirectionPressed)
{
    struct Sprite *sprite1 = &gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk1];
    struct Sprite *sprite2 = &gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk2];

    ChangePartyMenuSelection(taskId, menuDirectionPressed);

    if (sprite1->data[0] != sprite2->data[0])
    {
        sub_806BF24(&gUnknown_083769A8[sprite1->data[0] * 2], sprite1->data[0], 6, 1);
    }
    else
    {
        sub_806BF24(&gUnknown_083769A8[sprite1->data[0] * 2], sprite1->data[0], 6, 0);
    }
}

void HandlePartyMenuSwitchPokemonInput(u8 taskId)
{
    switch (gMain.newAndRepeatedKeys)
    {
    case 0x0040:
        ChangePartyMenuSwitchPokemonSelection((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk0, -1);
        break;
    case 0x0080:
        ChangePartyMenuSwitchPokemonSelection((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk0, 1);
        break;
    case 0x0020:
        ChangePartyMenuSwitchPokemonSelection((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk0, -2);
        break;
    case 0x0010:
        ChangePartyMenuSwitchPokemonSelection((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk0, 2);
        break;
    }

    if (gMain.newKeys & 0x0001)
    {
        PlaySE(5);
        gTasks[taskId].func = (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkC;
        gTasks[taskId].func(taskId);
    }
    else if (gMain.newKeys == 0x0002)
    {
        PlaySE(5);
        sub_806CD44(taskId);
    }
}

void sub_806CC2C(u8 taskId)
{
    DestroySprite(&gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk1]);
    PrintPartyMenuPromptText(0, 0);

    (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 2;
    SwitchTaskToFollowupFunc((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk0);
    DestroyTask(taskId);
}

void sub_806CC74(u8 taskId)
{
    sub_806BF24(&gUnknown_083769A8[gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk2].data[0] * 2], gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk2].data[0], 3, 1);
    sub_806BF24(&gUnknown_083769A8[gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk1].data[0] * 2], gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk1].data[0], 3, 0);
    sub_806CC2C(taskId);
}

void sub_806CCE4()
{
    u8 monIndex1 = gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk1].data[0];
    u8 monIndex2 = gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk2].data[0];

    if (monIndex1 <= 5)
    {
        sub_806BF24(&gUnknown_083769A8[monIndex1 * 2], monIndex1, 3, 0);
    }

    if (monIndex2 <= 5)
    {
        sub_806BF24(&gUnknown_083769A8[monIndex2 * 2], monIndex2, 3, 1);
    }
}

void sub_806CD44(u8 taskId)
{
    sub_806CCE4();
    sub_806CC2C(taskId);
}

void sub_806CD5C(u8 taskId)
{
    u8 monIndex1 = gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk1].data[0];
    u8 monIndex2 = gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk2].data[0];

    if (monIndex1 == monIndex2 || monIndex1 == 7 || monIndex2 == 7)
    {
        sub_806CD44(taskId);
    }
    else
    {
        u8 var1;

        sub_806D5B8(monIndex1);
        sub_806D5B8(monIndex2);

        if (monIndex1 > monIndex2)
        {
            (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5 = monIndex2;
            (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6 = monIndex1;
        }
        else
        {
            (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5 = monIndex1;
            (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6 = monIndex2;
        }

        (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3 = GetMonIconSpriteId((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk0, (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5);
        (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk4 = GetMonIconSpriteId((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk0, (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6);

        var1 = (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5;
        if (!var1)
        {
            gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3].data[0] = -8;
            gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3].data[2] = -0xA8;
            (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8 = var1;
            (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA = 11;

            gTasks[taskId].func = sub_806D014;
            (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 1;
        }
        else
        {
            gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3].data[0] = 8;
            gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3].data[2] = 0xA8;
            (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8 = 11;
            (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA = 11;

            gTasks[taskId].func = sub_806D118;
            (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 1;
        }

        gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3].callback = SpriteCB_sub_806D37C;

        gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk4].data[0] = 8;
        gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk4].data[2] = 0xA8;
        gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk4].callback = SpriteCB_sub_806D37C;

        gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3].callback(&gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3]);
        gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk4].callback(&gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk4]);
    }
}

void SwapValues_s16(s16 *a, s16 *b)
{
    s16 temp = *a;
    *a = *b;
    *b = temp;
}
# 2471 "src/field/party_menu.c"
__attribute__((naked))
void sub_806CF04(void)
{
    asm(".syntax unified\n    push {r4,r5,lr}\n    ldr r4, _0806CF94 @ =gSharedMem + 0x1000\n    ldrb r1, [r4, 0x3]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    ldr r5, _0806CF98 @ =gSprites + 0x20\n    adds r0, r5\n    ldrb r2, [r4, 0x4]\n    lsls r1, r2, 4\n    adds r1, r2\n    lsls r1, 2\n    adds r1, r5\n    bl SwapValues_s16\n    ldrb r1, [r4, 0x3]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    adds r3, r5, 0x2\n    adds r0, r3\n    ldrb r2, [r4, 0x4]\n    lsls r1, r2, 4\n    adds r1, r2\n    lsls r1, 2\n    adds r1, r3\n    bl SwapValues_s16\n    ldrb r1, [r4, 0x3]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    adds r3, r5, 0x4\n    adds r0, r3\n    ldrb r2, [r4, 0x4]\n    lsls r1, r2, 4\n    adds r1, r2\n    lsls r1, 2\n    adds r1, r3\n    bl SwapValues_s16\n    ldrb r1, [r4, 0x3]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    adds r3, r5, 0\n    adds r3, 0xE\n    adds r0, r3\n    ldrb r2, [r4, 0x4]\n    lsls r1, r2, 4\n    adds r1, r2\n    lsls r1, 2\n    adds r1, r3\n    bl SwapValues_s16\n    ldrb r1, [r4, 0x3]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    subs r5, 0x4\n    adds r0, r5\n    ldr r2, _0806CF9C @ =SpriteCB_sub_806D37C\n    str r2, [r0]\n    ldrb r1, [r4, 0x4]\n    lsls r0, r1, 4\n    adds r0, r1\n    lsls r0, 2\n    adds r0, r5\n    str r2, [r0]\n    pop {r4,r5}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0806CF94: .4byte gSharedMem + 0x1000\n_0806CF98: .4byte gSprites + 0x20\n_0806CF9C: .4byte SpriteCB_sub_806D37C\n    .syntax divided\n");
# 2548 "src/field/party_menu.c"
}


void sub_806CFA0(u8 taskId, u8 b)
{
    u8 var1 = (((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6 - 1) * 3) + 1;

    sub_806BA34((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8, 3);
    sub_806BB3C((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA, var1);

    if (!b)
    {
        (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8--;
        (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA++;
    }
    else
    {
        (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8++;
        (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA--;
    }

    sub_806B9A4((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8, 3, 10);
    sub_806BA94((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA, var1, 0, 10);
}

void sub_806D014(u8 taskId)
{
    sub_806CFA0(taskId, 0);

    if ((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8 < -13 && (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA > 32)
    {
        sub_806CF04();
        gTasks[taskId].func = sub_806D05C;
    }
}

void sub_806D05C(u8 taskId)
{
    sub_806CFA0(taskId, 1);

    if ((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8 == 0 && (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA == 11)
    {
        gTasks[taskId].func = sub_806D198;
    }
}

void sub_806D098(u8 a, u8 b)
{
    u8 var1 = (((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5 - 1) * 3) + 1;
    u8 var2 = (((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6 - 1) * 3) + 1;

    sub_806BB3C((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8, var1);
    sub_806BB3C((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA, var2);

    if (!b)
    {
        (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8++;
        (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA++;
    }
    else
    {
        (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8--;
        (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA--;
    }

    sub_806BA94((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8, var1, 0, 10);
    sub_806BA94((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA, var2, 0, 10);
}

void sub_806D118(u8 taskId)
{
    sub_806D098(taskId, 0);

    if ((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8 > 32 && (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA > 32)
    {
        sub_806CF04();
        gTasks[taskId].func = sub_806D15C;
    }
}

void sub_806D15C(u8 taskId)
{
    sub_806D098(taskId, 1);

    if ((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk8 == 11 && (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unkA == 11)
    {
        gTasks[taskId].func = sub_806D198;
    }
}

void sub_806D198(u8 taskId)
{
    u8 spriteId;

    SetMonIconSpriteId((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk0, (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5, (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk4);
    SetMonIconSpriteId((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk0, (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6, (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3);

    gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3].pos1.x = gUnknown_08376678[IsDoubleBattle()][(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6].x;
    gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3].pos1.y = gUnknown_08376678[IsDoubleBattle()][(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6].y;
    gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3].pos2.x = 0;
    gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3].pos2.y = 0;
    gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk3].callback = UpdateMonIconFrame_806DA38;

    gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk4].pos1.x = gUnknown_08376678[IsDoubleBattle()][(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5].x;
    gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk4].pos1.y = gUnknown_08376678[IsDoubleBattle()][(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5].y;
    gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk4].pos2.x = 0;
    gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk4].pos2.y = 0;
    gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk4].callback = UpdateMonIconFrame_806DA38;

    spriteId = GetMonIconSpriteId((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk0, gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk2].data[0]);
    gSprites[spriteId].callback = UpdateMonIconFrame_806DA0C;

    SwapPokemon(&gPlayerParty[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5], &gPlayerParty[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6]);

    PartyMenuPrintMonLevelOrStatus((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5, &gPlayerParty[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5]);
    TryPrintPartyMenuMonNickname((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5, &gPlayerParty[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5]);
    PartyMenuTryPrintHP((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5, &gPlayerParty[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5]);
    nullsub_12((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5, &gPlayerParty[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk5]);

    PartyMenuPrintMonLevelOrStatus((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6, &gPlayerParty[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6]);
    TryPrintPartyMenuMonNickname((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6, &gPlayerParty[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6]);
    PartyMenuTryPrintHP((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6, &gPlayerParty[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6]);
    nullsub_12((*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6, &gPlayerParty[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk6]);

    PartyMenuDrawHPBars();
    sub_806CC74(taskId);
}

void SpriteCB_sub_806D37C(struct Sprite *sprite)
{
    UpdateMonIconFrame(sprite);

    if (sprite->pos2.x == sprite->data[2])
    {
        sprite->data[0] *= -1;
        sprite->data[2] = 0;
        sprite->callback = UpdateMonIconFrame_806DA38;
    }
    else
    {
        sprite->pos2.x += sprite->data[0];
    }
}

void sub_806D3B4(u8 taskId, u16 species1, u16 species2)
{
    const u8 *var1 = gUnknown_083769C0;

    sub_806BA34(var1[2] + gTasks[taskId].data[0], var1[3]);
    sub_806BB3C(var1[8] + gTasks[taskId].data[0], var1[9]);
    sub_806BB3C(var1[10] + gTasks[taskId].data[0], var1[11]);

    gTasks[taskId].data[0]--;

    sub_806B9A4(var1[2] + gTasks[taskId].data[0], var1[3], 4);

    if (species1)
    {
        sub_806BA94(var1[8] + gTasks[taskId].data[0], var1[9], 0, 4);
    }
    else
    {
        sub_806BA94(var1[8] + gTasks[taskId].data[0], var1[9], 1, 4);
    }

    if (species2)
    {
        sub_806BA94(var1[10] + gTasks[taskId].data[0], var1[11], 0, 4);
    }
    else
    {
        sub_806BA94(var1[10] + gTasks[taskId].data[0], var1[11], 1, 4);
    }
}

void sub_806D4AC(u8 taskId, u16 species, u8 c)
{
    if (species)
    {
        u8 monIndex = c + 3;
        u8 spriteId = GetMonIconSpriteId(taskId, monIndex);

        gSprites[spriteId].data[0] = -8;
        gSprites[spriteId].data[2] = gTasks[taskId].data[0] * -8;
        gSprites[spriteId].callback = SpriteCB_sub_806D37C;
    }
}

void sub_806D50C(u8 taskId, u8 monIndex)
{
    gSprites[GetMonIconSpriteId(taskId, monIndex)].pos1.x += 0xF0;
}

void PrintPartyMenuPromptText(u8 textId, u8 b)
{
    if (textId != 0xFF)
    {
        switch (b)
        {
        case 0:
            MenuDrawTextWindow(0, 16, 23, 19);
            break;
        case 1:
            MenuDrawTextWindow(0, 16, 19, 19);
            break;
        case 2:
            MenuDrawTextWindow(0, 16, 22, 19);
            break;
        case 3:
            MenuDrawTextWindow(0, 16, 18, 19);
            break;
        case 4:
            MenuDrawTextWindow(0, 16, 20, 19);
            break;
        case 5:
            MenuDrawTextWindow(0, 16, 17, 19);
            break;
        }

  SetCustomFont(1);
        MenuPrint(PartyMenuPromptTexts[textId], 1, 17);
  SetCustomFont(0);
    }
}

void sub_806D5A4(void)
{
    MenuZeroFillWindowRect(0, 16, 29, 19);
}

void sub_806D5B8(u8 monIndex)
{
    u32 var1;
    u8 left = gUnknown_08376948[IsDoubleBattle()][monIndex].left;
    u8 top = gUnknown_08376948[IsDoubleBattle()][monIndex].top;
    u8 right = gUnknown_08376948[IsDoubleBattle()][monIndex].right;
    u8 bottom = gUnknown_08376948[IsDoubleBattle()][monIndex].bottom;

    ZeroFillWindowRect(&gUnknown_03004210, left, top, right, bottom);

    var1 = 0;
    CpuFastSet(&var1, (void *)(0x6000000 + 0x14000) + monIndex * 0x400, 0x1000100);
}

void sub_806D668(u8 monIndex)
{
    u32 var1;
    u8 left = gUnknown_08376978[IsDoubleBattle()][monIndex].left;
    u8 top = gUnknown_08376978[IsDoubleBattle()][monIndex].top;
    u8 right = gUnknown_08376978[IsDoubleBattle()][monIndex].right;
    u8 bottom = gUnknown_08376978[IsDoubleBattle()][monIndex].bottom;

    ZeroFillWindowRect(&gUnknown_03004210, left, top, right, bottom);

    var1 = 0;
    CpuFastSet(&var1, (void *)(0x6000000 + 0x14000) + 0x300 + monIndex * 0x400, 0x1000040);
}

bool8 LoadPartyMenuGraphics(u8 a)
{
    u16 palette = 0x7FFF;
    bool8 retVal = 0;

    if (a < 2)
    {
        LZDecompressVram(gPartyMenuMisc_Gfx, (void *)0x6000000);
    }

    if (a == 2 || a == 0)
    {
        LZDecompressVram(gPartyMenuMisc_Tilemap, (void *)(0x6000000 + 0x3800));
    }

    if (a == 3 || a == 0)
    {
        LoadCompressedPalette(gPartyMenuMisc_Pal, 0, 0x160);
    }

    if (a == 4 || a == 0)
    {
        LoadPalette(&palette, 0, 2);
        LoadPalette(gFontDefaultPalette, 0xF0, 0x20);
    }

    if (a == 5 || a == 0)
    {
        LZDecompressVram(gPartyMenuHpBar_Gfx, (void *)(0x6000000 + 0x6000));
    }

    if (a == 6 || a == 0)
    {
        LZDecompressVram(gPartyMenuOrderText_Gfx, (void *)(0x6000000 + 0x6180));
    }

    if (a == 7 || a == 0)
    {
        LZDecompressVram(gStatusGfx_Icons, (void *)(0x6000000 + 0x7180));
    }

    if (a == 8 || a == 0)
    {
        LoadCompressedPalette(gStatusPal_Icons, 0xB0, 0x20);
        retVal = 1;
    }

    return retVal;
}

void SetMonIconAnimByHP(u8 spriteId, u16 currentHP, u16 maxHP)
{
    u8 hpBarLevel = GetHPBarLevel(currentHP, maxHP);
    u8 animNum = 0;

    if (currentHP != maxHP)
    {
        if (hpBarLevel == 3)
        {
            animNum = 1;
        }
        else if (hpBarLevel == 2)
        {
            animNum = 2;
        }
        else if (hpBarLevel == 1)
        {
            animNum = 3;
        }
        else
        {
            animNum = 4;
        }
    }

    sub_809D824(&gSprites[spriteId], animNum);
}

void SetMonIconAnim(u8 spriteId, struct Pokemon *pokemon)
{
    u16 currentHP = GetMonData(pokemon, 57);
    u16 maxHP = GetMonData(pokemon, 58);

    SetMonIconAnimByHP(spriteId, currentHP, maxHP);
}

void CreatePartyMenuMonIcon(u8 taskId, u8 monIndex, u8 menuType, struct Pokemon *pokemon)
{
    u8 x = gUnknown_08376678[menuType][monIndex].x;
    u8 y = gUnknown_08376678[menuType][monIndex].y;

    u16 species2 = GetMonData(pokemon, 65);
    u32 personality = GetMonData(pokemon, 0);

    u8 spriteId = CreateMonIcon(species2, sub_809D62C, x + 8, y, 5, personality);
    SetMonIconSpriteId(taskId, monIndex, spriteId);
    SetMonIconAnim(spriteId, pokemon);
}

void TryCreatePartyMenuMonIcon(u8 taskId, u8 monIndex, struct Pokemon *pokemon)
{
    if (GetMonData(pokemon, 11))
    {
        bool8 isLinkDoubleBattle = IsLinkDoubleBattle();
        if (isLinkDoubleBattle == 1)
        {
            CreatePartyMenuMonIcon(taskId, monIndex, PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE, pokemon);
        }
        else
        {
            CreatePartyMenuMonIcon(taskId, monIndex, IsDoubleBattle(), pokemon);
        }
    }
}

void unref_sub_806D964(u8 taskId)
{
    u8 i;
    for (i = 0; i < gPlayerPartyCount; i++)
    {
        TryCreatePartyMenuMonIcon(taskId, i, &gPlayerParty[i]);
    }
}

void CreateMonIcon_LinkMultiBattle(u8 taskId, u8 monIndex, u8 menuType, struct UnknownPokemonStruct2 *pokemon)
{
    u8 x = gUnknown_08376678[menuType][monIndex].x;
    u8 y = gUnknown_08376678[menuType][monIndex].y;

    u8 spriteId = CreateMonIcon(pokemon->species, sub_809D62C, x, y, 5, pokemon->personality);
    SetMonIconSpriteId(taskId, monIndex, spriteId);
    SetMonIconAnimByHP(spriteId, pokemon->hp, pokemon->maxhp);
}

void UpdateMonIconFrame_806DA0C(struct Sprite *sprite)
{
    u8 var1;

    var1 = UpdateMonIconFrame(sprite);
    if (var1)
    {
        if (var1 & 1)
        {
            sprite->pos2.y = -3;
        }
        else
        {
            sprite->pos2.y = 1;
        }
    }
}

void UpdateMonIconFrame_806DA38(struct Sprite *sprite)
{
    UpdateMonIconFrame(sprite);
}

void UpdateMonIconFrame_806DA44(u8 taskId, u8 monIndex, u8 c)
{
    u8 spriteId;

    if (monIndex < 6)
    {
        spriteId = GetMonIconSpriteId(taskId, monIndex);
        gSprites[spriteId].pos2.y = 0;
        gSprites[spriteId].data[0] = 0;

        if (!c)
        {
            gSprites[spriteId].callback = UpdateMonIconFrame_806DA38;
        }
        else
        {
            gSprites[spriteId].callback = UpdateMonIconFrame_806DA0C;
        }
    }
}

void LoadHeldItemIconGraphics(void)
{
    LoadSpriteSheet(&HeldItemsSpriteSheet);
    LoadSpritePalette(&HeldItemsPalette);
}

void SpriteCB_HeldItemIcon(struct Sprite *sprite)
{

    u8 data7 = sprite->data[7];
    if (gSprites[data7].invisible)
    {
        sprite->invisible = 1;
    }
    else
    {
        sprite->invisible = 0;
        sprite->pos1.x = gSprites[data7].pos1.x + gSprites[data7].pos2.x;
        sprite->pos1.y = gSprites[data7].pos1.y + gSprites[data7].pos2.y;
    }
}

void CreateHeldItemIcon(u8 a, u8 b)
{
    u8 subPriority;
    u8 spriteId;

    subPriority = gSprites[a].subpriority;
    spriteId = CreateSprite(&gSpriteTemplate_837660C, 0xFA, 0xAA, subPriority - 1);

    gSprites[spriteId].pos2.x = 4;
    gSprites[spriteId].pos2.y = 10;
    gSprites[spriteId].callback = SpriteCB_HeldItemIcon;
    gSprites[spriteId].data[7] = a;

    StartSpriteAnim(&gSprites[spriteId], b);
    gSprites[spriteId].callback(&gSprites[spriteId]);
}

void CreateHeldItemIcons(u8 *a, u8 *b, u8 c)
{
    u16 i;
    u16 heldItem;

    switch (c)
    {
    case 0:
        i = 0;
        while (i < a[0])
        {
            heldItem = GetMonData(&gPlayerParty[i], 12);
            if (heldItem)
            {
                CreateHeldItemIcon(b[i], ItemIsMail(heldItem));
            }

            i++;
        }
        break;
    case 1:
        i = 0;
        while (i < a[1])
        {
            heldItem = GetMonData(&gEnemyParty[i], 12);
            if (heldItem)
            {
                CreateHeldItemIcon(b[i + 6], ItemIsMail(heldItem));
            }

            i++;
        }
        break;
    }
}

void CreateHeldItemIcons_806DC34(u8 taskId)
{
    u8 i;
    u8 monIconSpriteId;
    u8 heldItemSpriteId;

    for (i = 0; i < 6; i++)
    {
        if (GetMonData(&gPlayerParty[i], 11))
        {
            monIconSpriteId = GetMonIconSpriteId(taskId, i);
            heldItemSpriteId = CreateSprite(&gSpriteTemplate_837660C, 0xFA, 0xAA, 4);

            gSprites[heldItemSpriteId].pos2.x = 4;
            gSprites[heldItemSpriteId].pos2.y = 10;
            gSprites[heldItemSpriteId].data[7] = monIconSpriteId;
            gSprites[monIconSpriteId].data[7] = heldItemSpriteId;

            SetHeldItemIconVisibility(taskId, i);
            gSprites[heldItemSpriteId].callback(&gSprites[heldItemSpriteId]);
        }
    }
}
# 3118 "src/field/party_menu.c"
__attribute__((naked))
void CreateHeldItemIcon_806DCD4(u8 taskId, u8 monIndex, u16 item)
{
    asm(".syntax unified\n    push {r4-r7,lr}\n    lsls r0, 24\n    lsrs r0, 24\n    lsls r1, 24\n    lsrs r1, 24\n    lsls r2, 16\n    lsrs r7, r2, 16\n    bl GetMonIconSpriteId\n    adds r4, r0, 0\n    lsls r4, 24\n    lsrs r4, 24\n    ldr r0, _0806DD2C @ =gSpriteTemplate_837660C\n    movs r1, 0xFA\n    movs r2, 0xAA\n    movs r3, 0x4\n    bl CreateSprite\n    lsls r0, 24\n    lsrs r6, r0, 24\n    ldr r1, _0806DD30 @ =gSprites\n    lsls r0, r6, 4\n    adds r0, r6\n    lsls r0, 2\n    adds r5, r0, r1\n    movs r0, 0x4\n    strh r0, [r5, 0x24]\n    movs r0, 0xA\n    strh r0, [r5, 0x26]\n    strh r4, [r5, 0x3C]\n    lsls r0, r4, 4\n    adds r0, r4\n    lsls r0, 2\n    adds r0, r1\n    strh r6, [r0, 0x3C]\n    cmp r7, 0\n    bne _0806DD34\n    adds r0, r5, 0\n    adds r0, 0x3E\n    ldrb r1, [r0]\n    movs r2, 0x4\n    orrs r1, r2\n    strb r1, [r0]\n    b _0806DD5C\n    .align 2, 0\n_0806DD2C: .4byte gSpriteTemplate_837660C\n_0806DD30: .4byte gSprites\n_0806DD34:\n    adds r0, r7, 0\n    bl ItemIsMail\n    lsls r0, 24\n    cmp r0, 0\n    beq _0806DD46\n    adds r0, r5, 0\n    movs r1, 0x1\n    b _0806DD4A\n_0806DD46:\n    adds r0, r5, 0\n    movs r1, 0\n_0806DD4A:\n    bl StartSpriteAnim\n    adds r2, r5, 0\n    adds r2, 0x3E\n    ldrb r1, [r2]\n    movs r0, 0x5\n    negs r0, r0\n    ands r0, r1\n    strb r0, [r2]\n_0806DD5C:\n    ldr r2, _0806DD78 @ =gSprites\n    lsls r0, r6, 4\n    adds r0, r6\n    lsls r0, 2\n    adds r1, r2, 0\n    adds r1, 0x1C\n    adds r1, r0, r1\n    adds r0, r2\n    ldr r1, [r1]\n    bl _call_via_r1\n    pop {r4-r7}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0806DD78: .4byte gSprites\n    .syntax divided\n");
# 3205 "src/field/party_menu.c"
}


void SpriteCB_UpdateHeldItemIconPosition(struct Sprite *sprite)
{
    u8 spriteId = sprite->data[7];

    sprite->pos1.x = gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x;
    sprite->pos1.y = gSprites[spriteId].pos1.y;
}

u8 GetMonIconSpriteId(u8 taskId, u8 monIndex)
{
    switch (monIndex)
    {
        case 1:
            return gTasks[taskId].data[0];
            break;
        case 2:
            return gTasks[taskId].data[1] >> 8;
            break;
        case 3:
            return gTasks[taskId].data[1];
            break;
        case 4:
            return gTasks[taskId].data[2] >> 8;
            break;
        case 5:
            return gTasks[taskId].data[2];
            break;
        case 0:
        default:
            return gTasks[taskId].data[0] >> 8;
            break;
    }
}

void SetMonIconSpriteId(u8 taskId, u8 monIndex, u8 spriteId)
{
    switch (monIndex)
    {
        case 0:
            gTasks[taskId].data[0] = (u8)gTasks[taskId].data[0] | (spriteId << 8);
            break;
        case 1:
            gTasks[taskId].data[0] = (gTasks[taskId].data[0] & -0x100) | spriteId;
            break;
        case 2:
            gTasks[taskId].data[1] = (u8)gTasks[taskId].data[1] | (spriteId << 8);
            break;
        case 3:
            gTasks[taskId].data[1] = (gTasks[taskId].data[1] & -0x100) | spriteId;
            break;
        case 4:
            gTasks[taskId].data[2] = (u8)gTasks[taskId].data[2] | (spriteId << 8);
            break;
        case 5:
            gTasks[taskId].data[2] = (gTasks[taskId].data[2] & -0x100) | spriteId;
            break;
    }
}

u16 GetMonHeldItemIconSpriteId(u8 taskId, u8 monIndex)
{
    u8 spriteId = GetMonIconSpriteId(taskId, monIndex);
    u8 retVal = gSprites[spriteId].data[7];
    return retVal;
}
# 3304 "src/field/party_menu.c"
__attribute__((naked))
void SetHeldItemIconVisibility(u8 a, u8 monIndex)
{
    asm(".syntax unified\n    push {r4-r6,lr}\n    adds r4, r1, 0\n    lsls r0, 24\n    lsrs r0, 24\n    lsls r4, 24\n    lsrs r4, 24\n    adds r1, r4, 0\n    bl GetMonHeldItemIconSpriteId\n    lsls r0, 24\n    lsrs r5, r0, 24\n    adds r6, r5, 0\n    movs r0, 0x64\n    adds r1, r4, 0\n    muls r1, r0\n    ldr r0, _0806DFA4 @ =gPlayerParty\n    adds r4, r1, r0\n    adds r0, r4, 0\n    movs r1, 0xC\n    bl GetMonData\n    cmp r0, 0\n    bne _0806DFAC\n    ldr r1, _0806DFA8 @ =gSprites\n    lsls r0, r5, 4\n    adds r0, r5\n    lsls r0, 2\n    adds r0, r1\n    adds r0, 0x3E\n    ldrb r1, [r0]\n    movs r2, 0x4\n    orrs r1, r2\n    strb r1, [r0]\n    b _0806DFF6\n    .align 2, 0\n_0806DFA4: .4byte gPlayerParty\n_0806DFA8: .4byte gSprites\n_0806DFAC:\n    adds r0, r4, 0\n    movs r1, 0xC\n    bl GetMonData\n    lsls r0, 16\n    lsrs r0, 16\n    bl ItemIsMail\n    lsls r0, 24\n    cmp r0, 0\n    beq _0806DFD8\n    lsls r4, r5, 4\n    adds r4, r5\n    lsls r4, 2\n    ldr r0, _0806DFD4 @ =gSprites\n    adds r4, r0\n    adds r0, r4, 0\n    movs r1, 0x1\n    b _0806DFE6\n    .align 2, 0\n_0806DFD4: .4byte gSprites\n_0806DFD8:\n    lsls r4, r6, 4\n    adds r4, r6\n    lsls r4, 2\n    ldr r0, _0806DFFC @ =gSprites\n    adds r4, r0\n    adds r0, r4, 0\n    movs r1, 0\n_0806DFE6:\n    bl StartSpriteAnim\n    adds r4, 0x3E\n    ldrb r1, [r4]\n    movs r0, 0x5\n    negs r0, r0\n    ands r0, r1\n    strb r0, [r4]\n_0806DFF6:\n    pop {r4-r6}\n    pop {r0}\n    bx r0\n    .align 2, 0\n_0806DFFC: .4byte gSprites\n    .syntax divided\n");
# 3386 "src/field/party_menu.c"
}


void PartyMenuDoPrintMonNickname(u8 monIndex, int b, const u8 *nameBuffer)
{
    u32 var1 = 0;
    CpuFastSet(&var1, gTileBuffer, 0x1000100);
    sub_8004E3C((struct WindowConfig *)&gWindowConfig_81E6CAC, gTileBuffer, nameBuffer);
    CpuFastSet(gTileBuffer, (void *)(0x6000000 + 0x14000) + (monIndex * 0x400), 128);
}

void PrintPartyMenuMonNickname(u8 monIndex, u8 b, struct Pokemon *pokemon)
{
    u8 nameBuffer[12];
    GetMonNickname(pokemon, nameBuffer);
    PartyMenuDoPrintMonNickname(monIndex, b, nameBuffer);
}

void TryPrintPartyMenuMonNickname(u8 monIndex, struct Pokemon *pokemon)
{
    if (GetMonData(pokemon, 11))
    {
        bool8 isLinkDoubleBattle = IsLinkDoubleBattle();
        if (isLinkDoubleBattle == 1)
        {
            PrintPartyMenuMonNickname(monIndex, PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE, pokemon);
        }
        else
        {
            PrintPartyMenuMonNickname(monIndex, IsDoubleBattle(), pokemon);
        }
    }
}

void PrintPartyMenuMonNicknames(void)
{
    u8 i;

    for (i = 0; i < 6; i++)
    {
        TryPrintPartyMenuMonNickname(i, &gPlayerParty[i]);
    }
}

u8 *GetMonNickname(struct Pokemon *pokemon, u8 *stringBuffer)
{
    GetMonData(pokemon, 2, stringBuffer);
    return StringGetEnd10(stringBuffer);
}

void PartyMenuPutStatusTilemap(u8 monIndex, u8 menuLayout, u8 status)
{
    u8 i;
    u8 x = gUnknown_08376738[menuLayout][monIndex].x - 1;
    u8 y = gUnknown_08376738[menuLayout][monIndex].y + 1;
    u16 *vramPtr = (u16*)(0x6000000 + 0xF000) + (x + y * 32);
    u8 var1 = status * 4;

    for (i = 0; i < 4; i++)
    {
        vramPtr[i] = (0x18C + var1 + i) | -0x5000;
    }
}

static void PartyMenuClearLevelStatusTilemap(u8 monIndex)
{
    bool8 isLinkDoubleBattle;
    u8 menuLayout;
    u8 x;
    u8 y;
    u16 *vramPtr;
    u8 i;

    isLinkDoubleBattle = IsLinkDoubleBattle();
    if (isLinkDoubleBattle == 1)
    {
        menuLayout = PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE;
    }
    else
    {
        menuLayout = IsDoubleBattle();
    }

    x = gUnknown_08376738[menuLayout][monIndex].x - 1;
    y = gUnknown_08376738[menuLayout][monIndex].y + 1;

    vramPtr = (u16*)(0x6000000 + 0xF000) + (x + y * 32);
    for (i = 0; i < 4; i++)
    {
        vramPtr[i] = 0;
    }
}

static void PartyMenuWriteTilemap(u8 a, u8 x, u8 y)
{
    u16 *vramPtr = (u16*)(0x6000000 + 0xF000) + (x + y * 32);
    *vramPtr = a + 0x10C;
}

void PartyMenuDoPrintLevel(u8 monIndex, u8 menuLayout, u8 level)
{
    u8 *stringVar;
    u32 var1;
    u8 x = gUnknown_08376738[menuLayout][monIndex].x;
    u8 y = gUnknown_08376738[menuLayout][monIndex].y;

    PartyMenuWriteTilemap(0x40, x - 1, y + 1);

    stringVar = gStringVar1;
    stringVar[0] = 0xFC;
    stringVar[1] = 0x12;
    stringVar[2] = 0x8;

    ConvertIntToDecimalString(&stringVar[3], level);

    var1 = 0;
    CpuFastSet(&var1, gUnknown_02039460, 0x1000020);
    sub_8004E3C((struct WindowConfig *)&gWindowConfig_81E6CAC, gUnknown_02039460 - 0x100 , gStringVar1);
    CpuFastSet(gUnknown_02039460, (void *)(0x6000000 + 0x14000) + 0x200 + (monIndex * 0x400), 32);
}

void PartyMenuPrintLevel(u8 monIndex, u8 menuLayout, struct Pokemon *pokemon)
{
    u16 level = GetMonData(pokemon, 56);
    PartyMenuDoPrintLevel(monIndex, menuLayout, level);
}

void PartyMenuPrintMonLevelOrStatus(u8 monIndex, struct Pokemon *pokemon)
{
    if (GetMonData(pokemon, 11) && !GetMonData(pokemon, 45))
    {
        u8 statusAndPkrs;
        bool8 isLinkDoubleBattle;
        u8 menuLayout;

        statusAndPkrs = GetMonStatusAndPokerus(pokemon);

        isLinkDoubleBattle = IsLinkDoubleBattle();
        if (isLinkDoubleBattle == 1)
        {
            menuLayout = PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE;
        }
        else
        {
            menuLayout = IsDoubleBattle();
        }

        if (statusAndPkrs != 0 && statusAndPkrs != 6)
        {
            PartyMenuPutStatusTilemap(monIndex, menuLayout, statusAndPkrs - 1);
        }
        else
        {
            PartyMenuPrintLevel(monIndex, menuLayout, pokemon);
        }

        PartyMenuPrintGenderIcon(monIndex, menuLayout, pokemon);
    }
}

void PartyMenuPrintMonsLevelOrStatus(void)
{
    u8 i;

    for (i = 0; i < 6; i++)
    {
        PartyMenuPrintMonLevelOrStatus(i, &gPlayerParty[i]);
    }
}

void PartyMenuDoPrintGenderIcon(u16 species, u8 gender, u8 menuLayout, u8 monIndex, u8 *nickname)
{
    if (!ShouldHideGenderIcon(species, nickname))
    {
        u8 x = gUnknown_08376738[menuLayout][monIndex].x + 3;
        u8 y = gUnknown_08376738[menuLayout][monIndex].y + 1;

        switch (gender)
        {
            case 0x00:
                PartyMenuWriteTilemap(0x42, x, y);
                break;
            case 0xFE:
                PartyMenuWriteTilemap(0x44, x, y);
                break;
        }
    }
}

void PartyMenuPrintGenderIcon(u8 monIndex, u8 menuLayout, struct Pokemon *pokemon)
{
    u16 species2;
    u8 gender;

    GetMonNickname(pokemon, gStringVar1);
    species2 = GetMonData(pokemon, 65);
    gender = GetMonGender(pokemon);
    PartyMenuDoPrintGenderIcon(species2, gender, menuLayout, monIndex, gStringVar1);
}

void PartyMenuDoPrintHP(u8 monIndex, u8 b, u16 currentHP, u16 maxHP)
{
    u32 *var;
    register u8 *stringVar1 asm("r2") = gStringVar1;
    register u8 *textPtr asm("r2") = sub_8003504(stringVar1, currentHP, 24, 1);
    textPtr[0] = 0xBA;

    sub_8003504(++textPtr, maxHP, 24, 1);
    var = 0;

    CpuFastSet(&var, gUnknown_02039460, 0x1000040);
    sub_8004E3C((struct WindowConfig *)&gWindowConfig_81E6CAC, gUnknown_02039460 - 0x100 , gStringVar1);
    CpuFastSet(gUnknown_02039460, (void *)(0x6000000 + 0x14000) + 0x300 + (monIndex * 0x400), 64);
}

void PartyMenuPrintHP(u8 monIndex, u8 b, struct Pokemon *pokemon)
{
    u16 currentHP;
    u16 maxHP;

    currentHP = GetMonData(pokemon, 57);
    maxHP = GetMonData(pokemon, 58);

    PartyMenuDoPrintHP(monIndex, b, currentHP, maxHP);
}

void PartyMenuTryPrintHP(u8 monIndex, struct Pokemon *pokemon)
{
    if (GetMonData(pokemon, 11) && !GetMonData(pokemon, 45))
    {
        bool8 isLinkDoubleBattle = IsLinkDoubleBattle();
        if (isLinkDoubleBattle == 1)
        {
            PartyMenuPrintHP(monIndex, PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE, pokemon);
        }
        else
        {
            PartyMenuPrintHP(monIndex, IsDoubleBattle(), pokemon);
        }
    }
}

void PartyMenuTryPrintMonsHP(void)
{
    u8 i;

    for (i = 0; i < 6; i++)
    {
        PartyMenuTryPrintHP(i, &gPlayerParty[i]);
    }
}

void unref_sub_806E564(void) { }
void unref_sub_806E568(void) { }
void nullsub_12(u8 monIndex, struct Pokemon *pokemon) { }
void nullsub_13(void) { }

void PartyMenuDoDrawHPBar(u8 monIndex, u8 menuLayout, u16 currentHP, u16 maxHP)
{
    u8 hpBarLevel;
    u16 *vramPtr;
    int var = -32768;
    struct BattleInterfaceStruct1 battleInterface;
    battleInterface.unk0 = maxHP;
    battleInterface.unk4 = currentHP;
    battleInterface.unk8 = 0;

    hpBarLevel = GetHPBarLevel(currentHP, maxHP);
    if (hpBarLevel > 2)
    {
        battleInterface.unkC_0 = 4;
    }
    if (hpBarLevel == 2)
    {
        battleInterface.unkC_0 = 5;
    }
    if (hpBarLevel < 2)
    {
        battleInterface.unkC_0 = 6;
    }

    battleInterface.unk10 = 0x100;

    vramPtr = gUnknown_08376858[menuLayout][monIndex];
    sub_80460C8(&battleInterface, &var, vramPtr, 0);

    vramPtr -= 2;

    vramPtr[0] = 0x3109;
    vramPtr[1] = 0x310A;
    vramPtr[8] = 0x310B;
}

void PartyMenuDrawHPBar(u8 monIndex, u8 menuLayout, struct Pokemon *pokemon)
{
    u16 currentHP = GetMonData(pokemon, 57);
    u16 maxHP = GetMonData(pokemon, 58);

    PartyMenuDoDrawHPBar(monIndex, menuLayout, currentHP, maxHP);
}

void PartyMenuTryDrawHPBar(u8 monIndex, struct Pokemon *pokemon)
{
    if (GetMonData(pokemon, 11) && !GetMonData(pokemon, 45))
    {
        bool8 isDoubleBattle = IsLinkDoubleBattle();
        if (isDoubleBattle == 1)
        {
            PartyMenuDrawHPBar(monIndex, PARTY_MENU_LAYOUT_LINK_DOUBLE_BATTLE, pokemon);
        }
        else
        {
            PartyMenuDrawHPBar(monIndex, IsDoubleBattle(), pokemon);
        }
    }
}

void PartyMenuDrawHPBars(void)
{
    u8 i;

    for (i = 0; i < 6; i++)
    {
        PartyMenuTryDrawHPBar(i, &gPlayerParty[i]);
    }
}

void SwapPokemon(struct Pokemon *a, struct Pokemon *b)
{
    struct Pokemon temp = *a;
    *a = *b;
    *b = temp;
}

void SetPartyPopupMenuOffsets(u8 menuIndex, u8 *left, u8 *top, const struct PartyPopupMenu *menu)
{
    u8 bottomOffset = (2 * menu[menuIndex].numChoices) + 2;
    u8 rightOffset = menu[menuIndex].width + 1;

    *left = 30 - rightOffset;
    *top = 20 - bottomOffset;
}

void ShowPartyPopupMenu(u8 menuIndex, const struct PartyPopupMenu *menu, const struct MenuAction2 *menuActions, u8 cursorPos)
{
    u8 left;
    u8 top;

    SetPartyPopupMenuOffsets(menuIndex, &left, &top, menu);
    sub_8089C50(left, top, menu[menuIndex].width, menu[menuIndex].numChoices, menuActions, menu[menuIndex].items);

    InitMenu(0, left + 1, top + 1, menu[menuIndex].numChoices, cursorPos, menu[menuIndex].width - 1);
}

void ClosePartyPopupMenu(u8 index, const struct PartyPopupMenu *menu)
{
    u8 left;
    u8 top;

    SetPartyPopupMenuOffsets(index, &left, &top, menu);

    MenuZeroFillWindowRect(left, top, left + menu[index].width, menu[index].numChoices * 2 + top + 1);
    HandleDestroyMenuCursors();
}

TaskFunc PartyMenuGetPopupMenuFunc(u8 menuIndex, const struct PartyPopupMenu *menus, const struct MenuAction2 *menuActions, u8 itemIndex)
{
    u8 action = menus[menuIndex].items[itemIndex];
    return menuActions[action].func;
}

u8 sub_806E834(const u8 *message, u8 arg1)
{
    u8 taskId;

    gUnknown_0202E8F6 = 1;

    MenuDrawTextWindow((3), 14, (26), 19);
    MenuPrintMessage(message, (3) + 1, 15);

    taskId = CreateTask(sub_806E884, 1);
    gTasks[taskId].data[0] = arg1;

    return taskId;
}

static void sub_806E884(u8 taskId)
{
    if (MenuUpdateWindowText())
    {
        gUnknown_0202E8F6 = 0;
        if (gTasks[taskId].data[0] == 0)
            MenuZeroFillWindowRect((3), 14, (26), 19);
        DestroyTask(taskId);
    }
}

void sub_806E8D0(u8 taskId, u16 b, TaskFunc c)
{
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk10 = c;
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4 = taskId;
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5 = sub_806CA38(taskId);
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6 = b;
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon = &gPlayerParty[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5];
}

bool8 PartyMenuUpdateMonHeldItem(struct Pokemon *pkmn, u16 item)
{
    u8 itemData[2];

    if (ItemIsMail(item) == 1)
    {
        if (GiveMailToMon(pkmn, item) == 0xFF)
            return 1;
        gUnknown_0202E8F4 = 2;
    }
    else
    {
        gUnknown_0202E8F4 = 1;
    }

    itemData[0] = item;
    itemData[1] = item >> 8;
    SetMonData(pkmn, 12, itemData);
    return 0;
}

void PartyMenuTryGiveMonHeldItem(u8 taskId, u16 newItem, TaskFunc c)
{
    u16 currentItem;

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, newItem, c);
    currentItem = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 12);
    gUnknown_0202E8F4 = 0;
    gUnknown_0202E8F8 = 0;
    if (currentItem != 0)
    {
        if (ItemIsMail(currentItem) == 1)
        {
            sub_806E834(gOtherText_MailMustBeRemoved, 1);
            CreateTask(party_menu_link_mon_held_item_object, 5);
        }
        else
        {
            GetMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, gStringVar1);
            CopyItemName(currentItem, gStringVar2);
            StringExpandPlaceholders(gStringVar4, gOtherText_AlreadyHolding);
            sub_806E834(gStringVar4, 1);
            CreateTask(Task_ConfirmGiveHeldItem, 5);
            if (ItemIsMail(newItem) == 1)
                gUnknown_0202E8F8 = currentItem;
        }
    }
    else
    {
        PartyMenuUpdateMonHeldItem((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, newItem);
        RemoveBagItem(newItem, 1);
        if (ItemIsMail(newItem))
        {
            gTasks[taskId].func = c;
        }
        else
        {
            DisplayGiveHeldItemMessage((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, newItem, 1);
            CreateTask(party_menu_link_mon_held_item_object, 5);
        }
    }
}

void party_menu_link_mon_held_item_object(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        SetHeldItemIconVisibility((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5);
        gTasks[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4].func = (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk10;
        DestroyTask(taskId);
    }
}

void PartyMenuTryGiveMonHeldItem_806EACC(u8 taskId)
{
    s8 selection = ProcessMenuInputNoWrap_();

    if (selection == 0)
    {
        u16 currentItem;

        MenuZeroFillWindowRect(22, 8, 29, 13);
        currentItem = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 12);
        RemoveBagItem((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6, 1);
        if (AddBagItem(currentItem, 1) == 1)
        {
            PartyMenuUpdateMonHeldItem((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6);
            if (ItemIsMail((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6))
            {
                DisplayTakeHeldItemMessage((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, currentItem, 1);
            }
            else
            {
                CopyItemName((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6, gStringVar1);
                StringExpandPlaceholders(gStringVar4, gOtherText_TakenAndReplaced);
                sub_806E834(gStringVar4, 1);
            }
        }
        else
        {
            sub_806E834(gOtherText_BagFullCannotRemoveItem, 0);
            AddBagItem((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6, 1);
        }
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(22, 8, 29, 13);
    }
    gTasks[taskId].func = party_menu_link_mon_held_item_object;
}

void Task_ConfirmGiveHeldItem(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        DisplayYesNoMenu(22, 8, 1);
        gTasks[taskId].func = PartyMenuTryGiveMonHeldItem_806EACC;
    }
}

void DisplayGiveHeldItemMessage(u8 a, u16 b, u8 c)
{
    GetMonNickname(&gPlayerParty[a], gStringVar1);
    CopyItemName(b, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gOtherText_WasGivenToHold);
    sub_806E834(gStringVar4, c);
}

void PartyMenuTryGiveMonMail(u8 taskId, TaskFunc func)
{
    u32 var1;
    u16 currentItem;
    struct MailStruct *mail;

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, 0, func);
    currentItem = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 12);
    gUnknown_0202E8F4 = 0;
    var1 = (*(struct Unk201FE00 *)(gSharedMem + 0x1FE00)).unkE00 + 6;
    mail = &gSaveBlock1.mail[var1 + (*(struct Unk201FE00 *)(gSharedMem + 0x1FE00)).unkE02];

    if (currentItem != 0)
    {
        sub_806E834(gOtherText_PokeHoldingItemCantMail, 1);
        CreateTask(party_menu_link_mon_held_item_object, 5);
    }
    else
    {
        GiveMailToMon2((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, mail);
        ClearMailStruct(mail);
        sub_806E834(gOtherText_MailTransferredMailbox, 1);
        CreateTask(party_menu_link_mon_held_item_object, 5);
    }
}

void PartyMenuTryGiveMonHeldItem_806ECE8(u8 taskId, TaskFunc func)
{
    u16 currentItem;

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, 0, func);
    currentItem = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 12);
    if (currentItem == 0)
    {
        StringExpandPlaceholders(gStringVar4, gOtherText_NotHoldingAnything);
        sub_806E834(gStringVar4, 0);
        CreateTask(party_menu_link_mon_held_item_object, 5);
    }
    else
    {
        u8 itemData[2];

        itemData[0] = 0;
        itemData[1] = 0;
        if (AddBagItem(currentItem, 1) == 1)
        {
            if (ItemIsMail(currentItem) == 1)
                TakeMailFromMon((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon);
            DisplayTakeHeldItemMessage((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, currentItem, 0);
            SetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 12, itemData);
        }
        else
        {
            sub_806E834(gOtherText_BagFullCannotRemoveItem, 0);
        }
        CreateTask(party_menu_link_mon_held_item_object, 5);
    }
}

void DisplayTakeHeldItemMessage(u8 a, u16 b, u8 c)
{
    GetMonNickname(&gPlayerParty[a], gStringVar1);
    CopyItemName(b, gStringVar2);
    StringExpandPlaceholders(gStringVar4, gOtherText_ReceivedTheThingFrom);
    sub_806E834(gStringVar4, c);
}

void DoTakeMail(u8 taskId, TaskFunc func)
{
    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, 0, func);
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6 = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 12);
    sub_806E834(gOtherText_SendRemovedMailPrompt, 1);
    CreateTask(Task_ConfirmTakeHeldMail, 5);
}

void Task_LoseMailMessage(u8 taskId)
{
    s8 selection = ProcessMenuInputNoWrap_();

    if (selection == 0)
    {
        if (AddBagItem((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6, 1) == 1)
        {
            TakeMailFromMon((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon);
            sub_806E834(gOtherText_MailTaken, 0);
        }
        else
        {
            sub_806E834(gOtherText_BagFullCannotRemoveItem, 0);
        }
        MenuZeroFillWindowRect(22, 8, 29, 13);
        gTasks[taskId].func = party_menu_link_mon_held_item_object;
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(22, 8, 29, 13);
        MenuZeroFillWindowRect(0, 14, 29, 19);
        gTasks[taskId].func = party_menu_link_mon_held_item_object;
    }
}

void Task_ConfirmLoseMailMessage(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        DisplayYesNoMenu(22, 8, 1);
        gTasks[taskId].func = Task_LoseMailMessage;
    }
}

void Task_TakeHeldMail(u8 taskId)
{
    s8 selection = ProcessMenuInputNoWrap_();

    if (selection == 0)
    {
        MenuZeroFillWindowRect(22, 8, 29, 13);
        if (TakeMailFromMon2((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon) != 0xFF)
            sub_806E834(gOtherText_MailWasSent, 0);
        else
            sub_806E834(gOtherText_MailboxIsFull, 0);
        gTasks[taskId].func = party_menu_link_mon_held_item_object;
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(22, 8, 29, 13);
        sub_806E834(gOtherText_MailRemovedMessageLost, 1);
        gTasks[taskId].func = Task_ConfirmLoseMailMessage;
    }
}

void Task_ConfirmTakeHeldMail(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        DisplayYesNoMenu(22, 8, 1);
        gTasks[taskId].func = Task_TakeHeldMail;
    }
}

u16 ItemIdToBattleMoveId(u16 item)
{
    u16 machineNumber = item - ITEM_TM01;
    return TMHMMoves[machineNumber];
}

bool8 pokemon_has_move(struct Pokemon *pkmn, u16 move)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        if (GetMonData(pkmn, 13 + i) == move)
            return 1;
    }
    return 0;
}

void TeachMonTMMove(u8 taskId, u16 move, TaskFunc func)
{
    PlaySE(SE_SELECT);
    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, move, func);
    CreateTask(Task_TeamMonTMMove, 5);
}

void Task_TeamMonTMMove(u8 taskId)
{
    GetMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, gStringVar1);
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8 = ItemIdToBattleMoveId((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6);
    StringCopy(gStringVar2, gMoveNames[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8]);
    (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282 = 0;
    if (pokemon_has_move((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8))
    {
        StringExpandPlaceholders(gStringVar4, gOtherText_AlreadyKnows);
        sub_806E834(gStringVar4, 1);
        gTasks[taskId].func = party_menu_link_mon_held_item_object;
    }
    else
    {
        if (!CanMonLearnTMHM((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6 - 33))
        {
            StringExpandPlaceholders(gStringVar4, gOtherText_NotCompatible);
            sub_806E834(gStringVar4, 1);
            gTasks[taskId].func = party_menu_link_mon_held_item_object;
        }
        else
        {
            if (GiveMoveToMon((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8) != 0xFFFF)
            {
                Task_TeamMonTMMove2(taskId);
            }
            else
            {
                StringExpandPlaceholders(gStringVar4, gOtherText_WantsToLearn);
                sub_806E834(gStringVar4, 1);
                gTasks[taskId].func = sub_806F358;
            }
        }
    }
}

void Task_TeamMonTMMove2(u8 taskId)
{
    StringCopy(gStringVar2, gMoveNames[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8]);
    StringExpandPlaceholders(gStringVar4, gOtherText_LearnedMove);
    sub_806E834(gStringVar4, 1);
    AdjustFriendship((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 4);
    if ((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282 == 0 && (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6 <= 0x152)
        RemoveBagItem((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6, 1);
    gTasks[taskId].func = Task_TeamMonTMMove3;
}

void Task_TeamMonTMMove3(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        PlayFanfare(BGM_FANFA1);
        gTasks[taskId].func = Task_TeamMonTMMove4;
    }
}

void Task_TeamMonTMMove4(u8 taskId)
{
    if (IsFanfareTaskInactive())
    {
        if ((gMain.newKeys & 0x0001) || (gMain.newKeys & 0x0002))
        {
            SetHeldItemIconVisibility((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5);
            if ((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282 == 1)
            {
                TeachMonMoveInPartyMenu(taskId);
            }
            else
            {
                gTasks[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4].func = (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk10;
                DestroyTask(taskId);
            }
        }
    }
}

void sub_806F2FC(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        SetHeldItemIconVisibility((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5);
        if ((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282 == 1)
        {
            TeachMonMoveInPartyMenu(taskId);
        }
        else
        {
            gTasks[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4].func = (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk10;
            DestroyTask(taskId);
        }
    }
}

void sub_806F358(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        DisplayYesNoMenu(22, 8, 1);
        gTasks[taskId].func = sub_806F390;
    }
}

void sub_806F390(u8 taskId)
{
    s8 selection = ProcessMenuInputNoWrap_();

    if (selection == 0)
    {
        MenuZeroFillWindowRect(22, 8, 29, 13);
        sub_806E834(gOtherText_WhichMoveToForget2, 1);
        gTasks[taskId].func = sub_806F44C;
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        StopTryingToTeachMove_806F614(taskId);
    }
}

void sub_806F3FC(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        sub_809D9F0(gPlayerParty, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, gPlayerPartyCount - 1, sub_808B564, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8);
        DestroyTask(taskId);
    }
}

void sub_806F44C(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        gTasks[taskId].func = sub_806F3FC;
    }
}

void TaughtMove(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u8 moveIndex;
        u16 r4;

        gTasks[taskId].func = TaskDummy;
        sub_806E8D0(taskId, gScriptItemId, sub_808B508);
        moveIndex = sub_809FA30();
        r4 = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 13 + moveIndex);
        GetMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, gStringVar1);
        StringCopy(gStringVar2, gMoveNames[r4]);
        StringExpandPlaceholders(gStringVar4, gOtherText_ForgetMove123_2);
        sub_806E834(gStringVar4, 1);
        CreateTask(TMMoveUpdateMoveSlot, 5);
    }
}

void TMMoveUpdateMoveSlot(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        RemoveMonPPBonus((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, sub_809FA30());
        SetMonMoveSlot((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8, sub_809FA30());
        Task_TeamMonTMMove2(taskId);
    }
}

void StopTryingToTeachMove_806F588(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        gTasks[taskId].func = TaskDummy;
        sub_806E8D0(taskId, gScriptItemId, sub_808B508);
        StringCopy(gStringVar2, gMoveNames[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8]);
        StringExpandPlaceholders(gStringVar4, gOtherText_StopTryingTo);
        sub_806E834(gStringVar4, 1);
        CreateTask(StopTryingToTeachMove_806F67C, 5);
    }
}

void StopTryingToTeachMove_806F614(u8 taskId)
{
    MenuZeroFillWindowRect(22, 8, 29, 13);
    StringCopy(gStringVar2, gMoveNames[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8]);
    StringExpandPlaceholders(gStringVar4, gOtherText_StopTryingTo);
    sub_806E834(gStringVar4, 1);
    gTasks[taskId].func = StopTryingToTeachMove_806F67C;
}

void StopTryingToTeachMove_806F67C(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        DisplayYesNoMenu(22, 8, 1);
        gTasks[taskId].func = StopTryingToTeachMove_806F6B4;
    }
}

void StopTryingToTeachMove_806F6B4(u8 taskId)
{
    s8 selection = ProcessMenuInputNoWrap_();

    if (selection == 0)
    {
        MenuZeroFillWindowRect(22, 8, 29, 13);
        GetMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, gStringVar1);
        StringCopy(gStringVar2, gMoveNames[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8]);
        StringExpandPlaceholders(gStringVar4, gOtherText_DidNotLearnMove2);
        sub_806E834(gStringVar4, 1);
        gTasks[taskId].func = sub_806F2FC;
    }
    else
    {
        if (selection != 1 && selection != -1)
            return;
        if (selection == -1)
            PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(22, 8, 29, 13);
        GetMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, gStringVar1);
        StringCopy(gStringVar2, gMoveNames[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8]);
        StringExpandPlaceholders(gStringVar4, gOtherText_WantsToLearn);
        sub_806E834(gStringVar4, 1);
        gTasks[taskId].func = sub_806F358;
    }
}

bool8 IsHMMove(u16 move)
{
    u8 i;

    for (i = 0; i < 8; i++)
    {
        if (TMHMMoves[50 + i] == move)
            return 1;
    }

    return 0;
}

s16 sub_806F7E8(u8 taskId, struct BattleInterfaceStruct1 *b, s8 c)
{
    s16 *taskData;
    u8 hpBarLevel;
    void *vramPtr;

    taskData = gTasks[taskId].data;

    b->unk0 = taskData[10];
    b->unk4 = taskData[11];
    b->unk8 = taskData[12] * c;
    b->unk10 = 0x100;
    hpBarLevel = GetHPBarLevel((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282, b->unk0);
    if (hpBarLevel > 2)
        b->unkC_0 = 4;
    if (hpBarLevel == 2)
        b->unkC_0 = 5;
    if (hpBarLevel < 2)
        b->unkC_0 = 6;
    vramPtr = gUnknown_08376858[IsDoubleBattle()][(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5];
    return sub_80460C8(b, &(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unkC, vramPtr, 0);
}

void sub_806F8AC(u8 taskId)
{
    struct BattleInterfaceStruct1 sp0;
    u16 sp14;

    (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282 = sub_806F7E8(taskId, &sp0, -1);
    if ((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282 == -1)
    {
        (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unkC = 0;
        if (-sp0.unk8 + sp0.unk4 > sp0.unk0)
            sp14 = sp0.unk0 - sp0.unk4;
        else
            sp14 = -sp0.unk8;
        gBattleMoveDamage = -sp14;
        GetMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, gStringVar1);
        ConvertIntToDecimalStringN(gStringVar2, sp14, 0, 3);
        if (gTasks[taskId].data[14] == 0)
            StringExpandPlaceholders(gStringVar4, gOtherText_HPRestoredBy);
        else
            StringExpandPlaceholders(gStringVar4, gOtherText_RegainedHealth);
        SetMonIconAnim(GetMonIconSpriteId((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5), (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon);
        task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5 * 2], 7);
        (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 2;
        sub_806E834(gStringVar4, 1);
        sp14 += sp0.unk4;
        SetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 57, &sp14);
        RemoveBagItem((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6, 1);
        sub_8032638();
        gTasks[taskId].func = sub_806FB44;
    }
    else
    {
        PartyMenuDoPrintHP((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, IsDoubleBattle(), (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282, sp0.unk0);
    }
}

void sub_806FA18(u8 taskId)
{
    struct BattleInterfaceStruct1 sp0;

    (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282 = sub_806F7E8(taskId, &sp0, 1);
    if ((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282 == -1)
    {
        PlaySE(SE_KAIFUKU);
        (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unkC = 0;
        gTasks[taskId].data[11] -= gTasks[taskId].data[12];
        SetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 57, &gTasks[taskId].data[11]);
        SetMonIconAnim(GetMonIconSpriteId((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4, (*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk1), (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon);
        (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5 = gSprites[(*(struct Unk2001000 *)(gSharedMem + 0x1000)).unk2].data[0];
        (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon = &gPlayerParty[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5];
        gTasks[taskId].data[10] = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 58);
        gTasks[taskId].data[11] = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 57);
        (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unkC = -32768;
        (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk14 = (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk10;
        gTasks[taskId].func = sub_806F8AC;
        (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282 = gTasks[taskId].data[11];
    }
    else
    {
        PartyMenuDoPrintHP((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, IsDoubleBattle(), (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282, sp0.unk0);
    }
}

void sub_806FB0C(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        gTasks[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4].func = (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk10;
        DestroyTask(taskId);
    }
}

void sub_806FB44(u8 taskId)
{
    if (gUnknown_0202E8F6 == 0)
    {
        gTasks[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4].func = (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk14;
        DestroyTask(taskId);
    }
}

bool8 IsHPRecoveryItem(u16 item)
{
    const u8 *itemEffect;

    if (item == ITEM_ENIGMA_BERRY)
        itemEffect = gSaveBlock1.enigmaBerry.itemEffect;
    else
        itemEffect = gItemEffectTable[item - ITEM_POTION];

    if (itemEffect[4] & 4)
        return 1;
    else
        return 0;
}

void PartyMenuUpdateLevelOrStatus(struct Pokemon *pkmn, u8 monIndex)
{
    PartyMenuClearLevelStatusTilemap(monIndex);
    PartyMenuPrintMonLevelOrStatus(monIndex, pkmn);
}

void GetMedicineItemEffectMessage(u16 item)
{
    switch (GetItemEffectType(item))
    {
        case 3:
            StringExpandPlaceholders(gStringVar4, gOtherText_CuredPoisoning);
            break;
        case 4:
            StringExpandPlaceholders(gStringVar4, gOtherText_WokeUp);
            break;
        case 5:
            StringExpandPlaceholders(gStringVar4, gOtherText_BurnHealed);
            break;
        case 6:
            StringExpandPlaceholders(gStringVar4, gOtherText_ThawedOut);
            break;
        case 7:
            StringExpandPlaceholders(gStringVar4, gOtherText_CuredParalysis);
            break;
        case 8:
            StringExpandPlaceholders(gStringVar4, gOtherText_SnapConfusion);
            break;
        case 9:
            StringExpandPlaceholders(gStringVar4, gOtherText_GotOverLove);
            break;
        case 11:
            StringExpandPlaceholders(gStringVar4, gOtherText_BecameHealthy);
            break;
        case 13:
            StringCopy(gStringVar2, gOtherText_Hp2);
            StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
            break;
        case 12:
            StringCopy(gStringVar2, gOtherText_Attack);
            StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
            break;
        case 17:
            StringCopy(gStringVar2, gOtherText_Defense);
            StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
            break;
        case 16:
            StringCopy(gStringVar2, gOtherText_Speed);
            StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
            break;
        case 14:
            StringCopy(gStringVar2, gOtherText_SpAtk2);
            StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
            break;
        case 15:
            StringCopy(gStringVar2, gOtherText_SpDef2);
            StringExpandPlaceholders(gStringVar4, gOtherText_WasRaised);
            break;
        case 19:
        case 20:
            StringExpandPlaceholders(gStringVar4, gOtherText_PPIncreased);
            break;
        case 21:
            StringExpandPlaceholders(gStringVar4, gOtherText_PPRestored);
            break;
        default:
            StringExpandPlaceholders(gStringVar4, gOtherText_WontHaveAnyEffect);
            break;
    }
}

bool8 IsMedicineIneffective(struct Pokemon *pkmn, u16 item)
{
    if (GetItemEffectType(item) == 13
     && GetMonData(pkmn, 11) == SPECIES_SHEDINJA)
        return 1;
    else
        return 0;
}

bool8 ExecuteTableBasedItemEffect__(u8 a, u16 b, u8 c)
{
    if (gMain.inBattle)
        return ExecuteTableBasedItemEffect_(&gPlayerParty[a], b, sub_8094C20(a), c);
    else
        return ExecuteTableBasedItemEffect_(&gPlayerParty[a], b, a, c);
}

void UseMedicine(u8 taskId, u16 item, TaskFunc func)
{
    u8 r7;
    bool8 r9 = 0;
    bool8 r0;

    gTasks[taskId].func = TaskDummy;
    r7 = CreateTask(TaskDummy, 5);
    sub_806E8D0(taskId, item, func);
    if (!IsMedicineIneffective((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, item))
    {
        r9 = IsHPRecoveryItem(item);
        if (r9 == 1)
        {
            gTasks[r7].data[10] = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 58);
            gTasks[r7].data[11] = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 57);
            if (gTasks[r7].data[10] == gTasks[r7].data[11])
            {
                r9 = 0;
                gTasks[r7].data[10] = 0;
                gTasks[r7].data[11] = 0;
            }
        }
        r0 = ExecuteTableBasedItemEffect__((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, item, 0);
    }
    else
    {
        r0 = 1;
    }

    if (r0)
    {
        gUnknown_0202E8F4 = 0;
        PlaySE(SE_SELECT);
        sub_806E834(gOtherText_WontHaveAnyEffect, 1);
        gTasks[r7].func = sub_806FB0C;
    }
    else
    {
        u8 statusAndPkrs;

        gUnknown_0202E8F4 = 1;
        if (!IsBlueYellowRedFlute(item))
            PlaySE(SE_KAIFUKU);
        else
            PlaySE(SE_BIDORO);
        statusAndPkrs = GetMonStatusAndPokerus((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon);
        if (statusAndPkrs == 6 || statusAndPkrs == 0)
            PartyMenuUpdateLevelOrStatus((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5);
        if (r9 == 1)
        {
            gTasks[r7].data[12] = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 57) - gTasks[r7].data[11];
            (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unkC = -32768;
            if (gTasks[r7].data[11] == 0)
                gTasks[r7].data[14] = 1;
            else
                gTasks[r7].data[14] = 0;
            (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk14 = (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk10;
            gTasks[r7].func = sub_806F8AC;
            (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282 = gTasks[r7].data[11];
        }
        else
        {
            GetMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, gStringVar1);
            if (!IsBlueYellowRedFlute(item))
                RemoveBagItem(item, 1);
            GetMedicineItemEffectMessage(item);
            TryPrintPartyMenuMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon);
            sub_806E834(gStringVar4, 1);
            gTasks[r7].func = sub_806FB0C;
        }
    }
}

bool8 IsBlueYellowRedFlute(u16 item)
{
    if (item == 0x27
     || item == 0x29
     || item == 0x28)
        return 1;
    else
        return 0;
}

void sub_8070048(u8 taskId, u16 item, TaskFunc func)
{
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk10 = func;
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4 = taskId;
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6 = item;
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5 = 0;
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk14 = sub_80701DC;
    (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk27E = 0;
    (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk280 = 0;
    sub_8070088(taskId);
}

void sub_8070088(u8 taskId)
{
    u8 taskId2;

    gTasks[taskId].func = TaskDummy;
    if (GetMonData(&gPlayerParty[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5], 11) == 0)
    {
        gTasks[taskId].func = sub_80701DC;
    }
    else
    {
        s16 *taskData;

        taskId2 = CreateTask(TaskDummy, 5);
        taskData = gTasks[taskId2].data;
        (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon = &gPlayerParty[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5];
        taskData[10] = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 58);
        taskData[11] = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 57);
        if (ExecuteTableBasedItemEffect__((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6, 0))
        {
            DestroyTask(taskId2);
            gTasks[taskId].func = sub_80701DC;
        }
        else
        {
            gUnknown_0202E8F4 = 1;
            MenuZeroFillWindowRect((3), 14, (26), 19);
            PlaySE(SE_KAIFUKU);
            PartyMenuUpdateLevelOrStatus((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5);
            task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5 * 2], 9);
            (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 2;
            taskData[12] = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 57) - taskData[11];
            taskData[14] = 1;
            (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk27E = 1;
            (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk280 = 1;
            (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282 = taskData[11];
            (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unkC = -32768;
            gTasks[taskId2].func = sub_806F8AC;
        }
    }
}

void sub_80701DC(u8 taskId)
{
    if ((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk27E == 1)
    {
        AddBagItem((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6, 1);
        if (GetMonData(&gPlayerParty[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5], 11) != 0)
        {
            task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5 * 2], 3);
            (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 2;
        }
        (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk27E = 0;
    }
    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5++;
    if ((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5 == 6)
    {
        gUnknown_0202E8F4 = 0;
        if ((*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk280 == 0)
        {
            gTasks[taskId].func = TaskDummy;
            sub_806E834(gOtherText_WontHaveAnyEffect, 1);
            CreateTask(sub_806FB0C, 8);
        }
        else
        {
            RemoveBagItem((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6, 1);
            gTasks[taskId].func = (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk10;
        }
        gLastFieldPokeMenuOpened = 0;
    }
    else
    {
        sub_8070088(taskId);
    }
}

void CreateItemUseMoveMenu(u8 partyMonIndex)
{
    u8 r6;
    u8 i;

    r6 = 0;
    MenuDrawTextWindow(19, 10, 29, 19);
    for (i = 0; i < 4; i++)
    {
        u16 move = GetMonData(&gPlayerParty[partyMonIndex], 13 + i);

        MenuPrint(gMoveNames[move], 21, i * 2 + 11);
        if (move != 0)
            r6++;
    }
    InitMenu(0, 20, 11, r6, 0, 9);
}

void Task_HandleItemUseMoveMenuInput(u8 taskId)
{
    if (gMain.newKeys & 0x0040)
    {
        PlaySE(SE_SELECT);
        MoveMenuCursor(-1);
    }
    else if (gMain.newKeys & 0x0080)
    {
        PlaySE(SE_SELECT);
        MoveMenuCursor(1);
    }
    else if (gMain.newKeys & 0x0001)
    {
        gUnknown_08376B54[0](taskId);
    }
    else if (gMain.newKeys & 0x0002)
    {
        PlaySE(SE_SELECT);
        gUnknown_08376B54[1](taskId);
    }
}

void DoPPRecoveryItemEffect(u8 taskId, u16 item, TaskFunc c)
{
    const u8 *itemEffect;
    u8 taskId2;

    if (item == ITEM_ENIGMA_BERRY)
        itemEffect = gSaveBlock1.enigmaBerry.itemEffect;
    else
        itemEffect = gItemEffectTable[item - ITEM_POTION];
    gTasks[taskId].func = TaskDummy;
    taskId2 = CreateTask(TaskDummy, 5);
    sub_806E8D0(taskId, item, c);
    if (!(itemEffect[4] & 0x10))
    {
        gTasks[taskId2].data[11] = 0;
        DoRecoverPP(taskId2);
    }
    else
    {
        PlaySE(SE_SELECT);
        PrintPartyMenuPromptText(10, 3);
        CreateItemUseMoveMenu((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5);
        gTasks[taskId2].func = Task_HandleItemUseMoveMenuInput;
        gMain.newKeys = 0;
    }
}

void ItemUseMoveMenu_HandleMoveSelection(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(19, 10, 29, 19);
    sub_806D5A4();
    gTasks[taskId].data[11] = GetMenuCursorPos();
    DoRecoverPP(taskId);
}

void ItemUseMoveMenu_HandleCancel(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(19, 10, 29, 19);
    if (gMain.inBattle)
        gTasks[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4].func = HandleBattlePartyMenu;
    else
        gTasks[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4].func = sub_808B0C0;
    PrintPartyMenuPromptText(3, 0);
    DestroyTask(taskId);
}

void DoRecoverPP(u8 taskId)
{
    u16 r5 = 0;

    if (ExecuteTableBasedItemEffect__((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6, gTasks[taskId].data[11]))
    {
        gUnknown_0202E8F4 = r5;
        PlaySE(SE_SELECT);
        sub_806E834(gOtherText_WontHaveAnyEffect, 1);
    }
    else
    {
        gUnknown_0202E8F4 = 1;
        PlaySE(SE_KAIFUKU);
        RemoveBagItem((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6, 1);
        r5 = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 13 + gTasks[taskId].data[11]);
        StringCopy(gStringVar1, gMoveNames[r5]);
        GetMedicineItemEffectMessage((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk6);
        sub_806E834(gStringVar4, 1);
    }
    gTasks[taskId].func = sub_806FB0C;
}

void DoPPUpItemEffect(u8 taskId, u16 b, TaskFunc c)
{
    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, b, c);
    PlaySE(SE_SELECT);
    PrintPartyMenuPromptText(11, 3);
    CreateItemUseMoveMenu((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5);
    CreateTask(Task_HandleItemUseMoveMenuInput, 5);
    gMain.newKeys = 0;
}

void DoRareCandyItemEffect(u8 taskId, u16 b, TaskFunc c)
{
    u8 i;
    bool8 r0;

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, b, c);

    if (GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 56) != 100)
    {
        for (i = 0; i < 6; i++)
            (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).statGrowths[i] = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, StatDataTypes[i]);
        r0 = ExecuteTableBasedItemEffect__((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, b, 0);
    }
    else
        r0 = 1;

    if (r0)
    {
        gUnknown_0202E8F4 = 0;
        PlaySE(SE_SELECT);
        sub_806E834(gOtherText_WontHaveAnyEffect, 1);
        CreateTask(sub_806FB0C, 5);
    }
    else
    {
        u8 level;

        gUnknown_0202E8F4 = 1;
        PlayFanfareByFanfareNum(0);
        RedrawPokemonInfoInMenu((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon);
        RemoveBagItem(b, 1);
        GetMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, gStringVar1);
        level = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 56);
        ConvertIntToDecimalStringN(gStringVar2, level, 0, 3);
        StringExpandPlaceholders(gStringVar4, gOtherText_ElevatedTo);
        sub_806E834(gStringVar4, 1);
        CreateTask(Task_RareCandy1, 5);
    }
}

void Task_RareCandy1(u8 taskId)
{
    if (WaitFanfare(0) && gUnknown_0202E8F6 == 0)
    {
        if ((gMain.newKeys & 0x0001) || (gMain.newKeys & 0x0002))
        {
            PlaySE(SE_SELECT);
            PrintStatGrowthsInLevelUpWindow(taskId);
            gTasks[taskId].func = Task_RareCandy2;
        }
    }
}

void Task_RareCandy2(u8 taskId)
{
    if ((gMain.newKeys & 0x0001) || (gMain.newKeys & 0x0002))
    {
        PlaySE(SE_SELECT);
        PrintNewStatsInLevelUpWindow(taskId);
        gTasks[taskId].func = Task_RareCandy3;
    }
}

void PrintStatGrowthsInLevelUpWindow(u8 taskId)
{
    u8 i;

    MenuDrawTextWindow(11, 0, 29, 7);

    for (i = 0; i < 6; i++)
    {
        u8 x;
        u8 y;
        u32 stat;

        stat = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, StatDataTypes[i]);

        (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).statGrowths[i + 6] = stat;
        (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).statGrowths[i] = stat - (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).statGrowths[i];

        x = (i / 3) * 9 + 11;
        y = ((i % 3) << 1) + 1;

        MenuPrint_PixelCoords(StatNames[i], (x + 1) * 8, y * 8, 1);

        if (i == 2)
            MenuPrint_PixelCoords(gOtherText_TallPlusAndRightArrow, (x + 6) * 8 + 6, y * 8, 0);
        else
            MenuPrint_PixelCoords(gOtherText_TallPlusAndRightArrow, (x + 6) * 8 + 6, y * 8, 1);

        gStringVar1[0] = 0xFC;
        gStringVar1[1] = 0x14;
        gStringVar1[2] = 0x06;

        ConvertIntToDecimalStringN(gStringVar1 + 3, (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).statGrowths[i], 1, 2);

        MenuPrint_PixelCoords(gStringVar1, (x + 6) * 8 + 12, y * 8, 0);
    }
}

void PrintNewStatsInLevelUpWindow(u8 taskId)
{
    u8 i;

    for (i = 0; i < 6; i++)
    {
        u8 x;
        u8 y;
        u32 stat;
        u32 newStatIndex;

        stat = GetMonData((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, StatDataTypes[i]);
        newStatIndex = i + 6;
        (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).statGrowths[newStatIndex] = stat;

        x = ((i / 3) * 9) + 11;
        y = ((i % 3) << 1) + 1;

        gStringVar1[0] = 0xFC;
        gStringVar1[1] = 0x14;
        gStringVar1[2] = 0x06;

        ConvertIntToDecimalStringN(gStringVar1 + 3, (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).statGrowths[newStatIndex], 1, 3);
        MenuPrint_PixelCoords(gStringVar1, (x + 6) * 8 + 6, y * 8, 0);
    }
}

void RedrawPokemonInfoInMenu(u8 monIndex, struct Pokemon *pokemon)
{
    u8 statusAndPkrs;
    bool8 isDoubleBattle;
    u16 currentHP;
    u16 maxHP;
    u8 icon;

    statusAndPkrs = GetMonStatusAndPokerus(pokemon);
    if (statusAndPkrs == 0 || statusAndPkrs == 6)
    {
        PartyMenuUpdateLevelOrStatus(pokemon, monIndex);
    }

    isDoubleBattle = IsDoubleBattle();

    currentHP = GetMonData(pokemon, 57);
    maxHP = GetMonData(pokemon, 58);

    PartyMenuDoPrintHP(monIndex, isDoubleBattle, currentHP, maxHP);
    PartyMenuTryDrawHPBar(monIndex, pokemon);

    icon = GetMonIconSpriteId((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4, monIndex);
    SetMonIconAnim(icon, pokemon);

    task_pc_turn_off(&gUnknown_083769A8[IsDoubleBattle() * 12 + monIndex * 2], 7);
    (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk261 = 2;
}

void Task_RareCandy3(u8 taskId)
{
    if (WaitFanfare(0))
    {
        if ((gMain.newKeys & 0x0001) || (gMain.newKeys & 0x0002))
        {
            u16 learnedMove;
            u16 evolutionSpecies;

            MenuZeroFillWindowRect(11, 0, 29, 7);

            learnedMove = MonTryLearningNewMove((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 1);
            (*(struct Unk201B000 *)(gSharedMem + 0x1B000)).unk282 = 1;

            switch (learnedMove)
            {
                case 0:

                    evolutionSpecies = GetEvolutionTargetSpecies((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 0, 0);
                    if (evolutionSpecies != 0)
                    {
                        gCB2_AfterEvolution = sub_80A53F8;
                        BeginEvolutionScene((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, evolutionSpecies, 1, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5);
                        DestroyTask(taskId);
                    }
                    else
                    {
                        sub_8070D90(taskId);
                    }
                    break;
                case 0xFFFF:

                    GetMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, gStringVar1);
                    StringCopy(gStringVar2, gMoveNames[gMoveToLearn]);

                    StringExpandPlaceholders(gStringVar4, gOtherText_WantsToLearn);
                    sub_806E834(gStringVar4, 1);

                    (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8 = gMoveToLearn;
                    gTasks[taskId].func = sub_806F358;
                    break;
                case 0xFFFE:

                    gTasks[taskId].func = TeachMonMoveInPartyMenu;
                    break;
                default:

                    GetMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, gStringVar1);
                    StringCopy(gStringVar2, gMoveNames[learnedMove]);

                    StringExpandPlaceholders(gStringVar4, gOtherText_LearnedMove);
                    sub_806E834(gStringVar4, 1);

                    gTasks[taskId].func = Task_TeamMonTMMove3;
                    break;
            }
        }
    }
}

void TeachMonMoveInPartyMenu(u8 taskId)
{
    u16 learnedMove;
    u16 evolutionSpecies;

    learnedMove = MonTryLearningNewMove((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 0);
    switch (learnedMove)
    {
        case 0:

            evolutionSpecies = GetEvolutionTargetSpecies((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, 0, 0);
            if (evolutionSpecies != 0)
            {
                gCB2_AfterEvolution = sub_80A53F8;
                BeginEvolutionScene((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, evolutionSpecies, 1, (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5);
                DestroyTask(taskId);
            }
            else
            {
                sub_8070D90(taskId);
            }
            break;
        case 0xFFFF:

            GetMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, gStringVar1);
            StringCopy(gStringVar2, gMoveNames[gMoveToLearn]);

            StringExpandPlaceholders(gStringVar4, gOtherText_WantsToLearn);
            sub_806E834(gStringVar4, 1);

            (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk8 = gMoveToLearn;
            gTasks[taskId].func = sub_806F358;
            break;
        case 0xFFFE:

            TeachMonMoveInPartyMenu(taskId);
            break;
        default:

            GetMonNickname((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).pokemon, gStringVar1);
            StringCopy(gStringVar2, gMoveNames[learnedMove]);

            StringExpandPlaceholders(gStringVar4, gOtherText_LearnedMove);
            sub_806E834(gStringVar4, 1);

            gTasks[taskId].func = Task_TeamMonTMMove3;
            break;
    }
}

static void sub_8070D90(u8 taskId)
{
    gTasks[(*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk4].func = (*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk10;
    DestroyTask(taskId);
}

void DoEvolutionStoneItemEffect(u8 taskId, u16 evolutionStoneItem, TaskFunc c)
{
    PlaySE(SE_SELECT);

    gTasks[taskId].func = TaskDummy;
    sub_806E8D0(taskId, evolutionStoneItem, c);

    gCB2_AfterEvolution = sub_80A53F8;

    if (ExecuteTableBasedItemEffect__((*(struct Unk201C000 *)(gSharedMem + 0x1C000)).unk5, evolutionStoneItem, 0))
    {
        gUnknown_0202E8F4 = 0;
        sub_806E834(gOtherText_WontHaveAnyEffect, 1);

        CreateTask(sub_806FB0C, 5);
    }
    else
    {
        RemoveBagItem(evolutionStoneItem, 1);
    }
}
# 5258 "src/field/party_menu.c"
__attribute__((naked))
u8 GetItemEffectType(u16 item)
{
    asm(".syntax unified\n    push {r4,r5,lr}\n    lsls r0, 16\n    lsrs r0, 16\n    cmp r0, 0xAF\n    bne _08070E5C\n    ldr r4, _08070E58 @ =gSaveBlock1 + 0x3676\n    b _08070E66\n    .align 2, 0\n_08070E58: .4byte gSaveBlock1 + 0x3676\n_08070E5C:\n    ldr r1, _08070E8C @ =gItemEffectTable\n    subs r0, 0xD\n    lsls r0, 2\n    adds r0, r1\n    ldr r4, [r0]\n_08070E66:\n    ldrb r1, [r4]\n    movs r5, 0x3F\n    adds r0, r5, 0\n    ands r0, r1\n    cmp r0, 0\n    bne _08070E88\n    ldrb r0, [r4, 0x1]\n    cmp r0, 0\n    bne _08070E88\n    ldrb r0, [r4, 0x2]\n    cmp r0, 0\n    bne _08070E88\n    ldrb r3, [r4, 0x3]\n    movs r0, 0x80\n    ands r0, r3\n    cmp r0, 0\n    beq _08070E90\n_08070E88:\n    movs r0, 0\n    b _08070F8A\n    .align 2, 0\n_08070E8C: .4byte gItemEffectTable\n_08070E90:\n    movs r2, 0x40\n    adds r0, r2, 0\n    ands r0, r1\n    cmp r0, 0\n    beq _08070E9E\n    movs r0, 0xA\n    b _08070F8A\n_08070E9E:\n    adds r0, r2, 0\n    ands r0, r3\n    cmp r0, 0\n    beq _08070EAA\n    movs r0, 0x1\n    b _08070F8A\n_08070EAA:\n    adds r2, r5, 0\n    ands r2, r3\n    cmp r2, 0\n    bne _08070EB8\n    lsrs r0, r1, 7\n    cmp r0, 0\n    beq _08070EFA\n_08070EB8:\n    cmp r2, 0x20\n    bne _08070EC0\n    movs r0, 0x4\n    b _08070F8A\n_08070EC0:\n    cmp r2, 0x10\n    bne _08070EC8\n    movs r0, 0x3\n    b _08070F8A\n_08070EC8:\n    cmp r2, 0x8\n    bne _08070ED0\n    movs r0, 0x5\n    b _08070F8A\n_08070ED0:\n    cmp r2, 0x4\n    bne _08070ED8\n    movs r0, 0x6\n    b _08070F8A\n_08070ED8:\n    cmp r2, 0x2\n    bne _08070EE0\n    movs r0, 0x7\n    b _08070F8A\n_08070EE0:\n    cmp r2, 0x1\n    bne _08070EE8\n    movs r0, 0x8\n    b _08070F8A\n_08070EE8:\n    lsrs r0, r1, 7\n    cmp r0, 0\n    beq _08070EF6\n    cmp r2, 0\n    bne _08070EF6\n    movs r0, 0x9\n    b _08070F8A\n_08070EF6:\n    movs r0, 0xB\n    b _08070F8A\n_08070EFA:\n    ldrb r1, [r4, 0x4]\n    movs r0, 0x44\n    ands r0, r1\n    adds r2, r1, 0\n    cmp r0, 0\n    beq _08070F0A\n    movs r0, 0x2\n    b _08070F8A\n_08070F0A:\n    movs r5, 0x2\n    adds r0, r5, 0\n    ands r0, r2\n    cmp r0, 0\n    beq _08070F18\n    movs r0, 0xC\n    b _08070F8A\n_08070F18:\n    movs r3, 0x1\n    adds r0, r3, 0\n    ands r0, r2\n    cmp r0, 0\n    beq _08070F26\n    movs r0, 0xD\n    b _08070F8A\n_08070F26:\n    ldrb r1, [r4, 0x5]\n    movs r0, 0x8\n    ands r0, r1\n    cmp r0, 0\n    beq _08070F34\n    movs r0, 0xE\n    b _08070F8A\n_08070F34:\n    movs r0, 0x4\n    ands r0, r1\n    cmp r0, 0\n    beq _08070F40\n    movs r0, 0xF\n    b _08070F8A\n_08070F40:\n    adds r0, r5, 0\n    ands r0, r1\n    cmp r0, 0\n    beq _08070F4C\n    movs r0, 0x10\n    b _08070F8A\n_08070F4C:\n    adds r0, r3, 0\n    ands r0, r1\n    cmp r0, 0\n    beq _08070F58\n    movs r0, 0x11\n    b _08070F8A\n_08070F58:\n    movs r0, 0x80\n    ands r0, r2\n    cmp r0, 0\n    beq _08070F64\n    movs r0, 0x12\n    b _08070F8A\n_08070F64:\n    movs r0, 0x20\n    ands r0, r2\n    cmp r0, 0\n    beq _08070F70\n    movs r0, 0x13\n    b _08070F8A\n_08070F70:\n    movs r0, 0x10\n    ands r0, r1\n    cmp r0, 0\n    beq _08070F7C\n    movs r0, 0x14\n    b _08070F8A\n_08070F7C:\n    movs r0, 0x18\n    ands r0, r2\n    cmp r0, 0\n    bne _08070F88\n    movs r0, 0x16\n    b _08070F8A\n_08070F88:\n    movs r0, 0x15\n_08070F8A:\n    pop {r4,r5}\n    pop {r1}\n    bx r1\n    .syntax divided\n");
# 5453 "src/field/party_menu.c"
}


void unref_sub_8070F90(void)
{
    FlagSet(0x801);
    FlagSet(0x800);
    FlagSet(0x802);
}
