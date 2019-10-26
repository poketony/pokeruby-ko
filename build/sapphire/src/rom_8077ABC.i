# 1 "src/rom_8077ABC.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/rom_8077ABC.c"
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
# 2 "src/rom_8077ABC.c" 2
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
# 3 "src/rom_8077ABC.c" 2
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
# 4 "src/rom_8077ABC.c" 2
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
# 5 "src/rom_8077ABC.c" 2
# 1 "include/blend_palette.h" 1



void BlendPalette(u16 palOffset, u16 numEntries, u8 coeff, u16 blendColor);
# 6 "src/rom_8077ABC.c" 2
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
# 7 "src/rom_8077ABC.c" 2
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
# 8 "src/rom_8077ABC.c" 2
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
# 9 "src/rom_8077ABC.c" 2
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
# 10 "src/rom_8077ABC.c" 2
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
# 11 "src/rom_8077ABC.c" 2
# 1 "include/sprite.h" 1
# 12 "src/rom_8077ABC.c" 2
# 1 "include/task.h" 1
# 13 "src/rom_8077ABC.c" 2
# 1 "include/trig.h" 1



extern const s16 gSineTable[];

s16 Sin(s16 index, s16 amplitude);
s16 Cos(s16 index, s16 amplitude);
s16 Sin2(u16 angle);
s16 Cos2(u16 angle);
# 14 "src/rom_8077ABC.c" 2
# 1 "include/util.h" 1





extern const u8 gMiscBlank_Gfx[];
extern const u32 gBitTable[];

u8 CreateInvisibleSpriteWithCallback(void (*)(struct Sprite *));
void StoreWordInTwoHalfwords(u16 *, u32);
void LoadWordFromTwoHalfwords(u16 *, u32 *);
u16 CalcCRC16(u8 *data, int length);
void DoBgAffineSet(struct BgAffineDstData *dest, u32 texX, u32 texY, s16 scrX, s16 scrY, s16 sx, s16 sy, u16 alpha);
# 15 "src/rom_8077ABC.c" 2
# 1 "include/ewram.h" 1



extern u8 gSharedMem[];
# 16 "src/rom_8077ABC.c" 2
# 35 "src/rom_8077ABC.c"
struct Struct_unk_2019348 {
    u16 field_0;
    u16 field_2;
    u8 field_4;
    u32 field_8;
    u32 field_c;
    u32 field_10;
};

struct TransformStatus {
    u16 unknown;
    u16 species;
};

struct Struct_gUnknown_0837F578 {
    u8 field_0;
    u8 field_1;
};

struct OamMatrix {
    s16 a;
    s16 b;
    s16 c;
    s16 d;
};

struct Struct_2017810 {
    u8 filler_0[6];
    u8 field_6;
    u8 filler_7[5];
};

struct Color {
    u16 r:5;
    u16 g:5;
    u16 b:5;
};

struct Struct_sub_8078914 {
    u8 *field_0;
    u8 *field_4;
    u8 field_8;
};

struct BGCnt {
    u16 priority:2;
    u16 charBase:2;
    u16 unused:2;
    u16 mosaic:1;
    u16 colorMode:1;
    u16 screenBase:5;
    u16 overflow:1;
    u16 size:2;
};





extern struct OamData gOamData_837DF9C[];
extern const union AnimCmd *const gDummySpriteAnimTable[];
extern const union AffineAnimCmd *const gDummySpriteAffineAnimTable[];

extern u16 gBattlePartyID[];
extern u16 gBattleTypeFlags;
extern u32 gPID_perBank[4];
extern u8 gBattleMonForms[4];
extern u16 gUnknown_0202F7CA[];
extern u8 gObjectBankIDs[4];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;
extern s16 gBattleAnimArgs[8];
extern u8 gBanksBySide[4];
extern u8 gNoOfAllBanks;
extern struct OamMatrix gOamMatrices[];
extern struct Struct_2017810 unk_2017810[];
extern u8 gHappinessMoveAnim;

extern u8 UpdateMonIconFrame(struct Sprite *sprite);

__attribute__((section("ewram_data"))) union AffineAnimCmd *gUnknown_0202F7D4 = ((void *)0);
__attribute__((section("ewram_data"))) u32 filler_0202F7D8[3] = {0};

const struct Struct_gUnknown_0837F578 gUnknown_0837F578[][4] = {
    {
        { 72, 80 },
        { 176, 40 },
        { 48, 40 },
        { 112, 80 },
    },
    {
        { 32, 80 },
        { 200, 40 },
        { 90, 88 },
        { 152, 32 },
    },
};




const struct MonCoords gCastformFrontSpriteCoords[] = {
    { 0x44, 17 },
    { 0x66, 9 },
    { 0x46, 9 },
    { 0x86, 8 },
};

const u8 gUnknownCastformData_0837F5A8[] = {
    13,
    14,
    13,
    13,
};


const u8 gUnknown_0837F5AC[] = {
    0,
    0,
    0,
    0,
};

const struct SpriteTemplate gSpriteTemplate_837F5B0[] = {
    {
        .tileTag = 55125,
        .paletteTag = 55125,
        .oam = gOamData_837DF9C,
        .anims = gDummySpriteAnimTable,
        .images = ((void *)0),
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    }, {
        .tileTag = 55126,
        .paletteTag = 55126,
        .oam = gOamData_837DF9C,
        .anims = gDummySpriteAnimTable,
        .images = ((void *)0),
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    }
};

const struct SpriteSheet gUnknown_0837F5E0[] = {
    { gMiscBlank_Gfx, 0x800, 55125, },
    { gMiscBlank_Gfx, 0x800, 55126, },
};


u8 sub_8077ABC(u8 slot, u8 a2) {
    u8 var;
    u16 species;
    struct TransformStatus *transform;

    if (NotInBattle()) {
        if (a2 == 3 && slot == 3) {
            a2 = 1;
        }
    }
    switch (a2) {
    case 0:
    case 2:
        var = gUnknown_0837F578[((gBattleTypeFlags & 0x0001) ? 1 : 0)][GetBankIdentity(slot)].field_0;
        break;
    case 1:
        var = gUnknown_0837F578[((gBattleTypeFlags & 0x0001) ? 1 : 0)][GetBankIdentity(slot)].field_1;
        break;
    case 3:
    case 4:
    default:
        if (NotInBattle()) {
            if ((*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk4 & 1) {
                species = (*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk2;
            } else {
                species = (*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk0;
            }
        } else {
            if (GetBankSide(slot)) {
                transform = &((struct TransformStatus *)(gSharedMem + 0x17800))[slot];
                if (!transform->species) {
                    species = GetMonData(&gEnemyParty[gBattlePartyID[slot]], 11);
                } else {
                    species = transform->species;
                }
            } else {
                transform = &((struct TransformStatus *)(gSharedMem + 0x17800))[slot];
                if (!transform->species) {
                    species = GetMonData(&gPlayerParty[gBattlePartyID[slot]], 11);
                } else {
                    species = transform->species;
                }
            }
        }
        if (a2 == 3) {
            var = sub_8077E44(slot, species, 1);
        } else {
            var = sub_8077E44(slot, species, 0);
        }
        break;
    }
    return var;
}

u8 sub_8077BFC(u8 slot, u16 species) {
    u16 letter;
    u32 personality;
    struct TransformStatus *transform;
    u8 ret;
    u16 var;

    if (!GetBankSide(slot) || NotInBattle()) {
        if (species == SPECIES_UNOWN) {
            if (NotInBattle()) {
                if ((*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk4 & 1) {
                    personality = (*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk10;
                } else {
                    personality = (*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk8;
                }
            } else {
                transform = &((struct TransformStatus *)(gSharedMem + 0x17800))[slot];
                if (!transform->species) {
                    personality = GetMonData(&gPlayerParty[gBattlePartyID[slot]], 0);
                } else {
                    personality = gPID_perBank[slot];
                }
            }
            letter = (( (((personality & 0x03000000) >> 24) << 6) | (((personality & 0x00030000) >> 16) << 4) | (((personality & 0x00000300) >> 8) << 2) | (((personality & 0x00000003) >> 0) << 0) ) % 28);
            if (!letter) {
                var = species;
            } else {
                var = letter + SPECIES_UNOWN_B - 1;
            }
            ret = gMonBackPicCoords[var].y_offset;
        } else if (species == SPECIES_CASTFORM) {
            ret = gUnknown_0837F5AC[gBattleMonForms[slot]];
        } else if (species > SPECIES_EGG) {
            ret = gMonBackPicCoords[0].y_offset;
        } else {
            ret = gMonBackPicCoords[species].y_offset;
        }
    } else {
        if (species == SPECIES_UNOWN) {
            transform = &((struct TransformStatus *)(gSharedMem + 0x17800))[slot];
            if (!transform->species) {
                personality = GetMonData(&gEnemyParty[gBattlePartyID[slot]], 0);
            } else {
                personality = gPID_perBank[slot];
            }
            letter = (( (((personality & 0x03000000) >> 24) << 6) | (((personality & 0x00030000) >> 16) << 4) | (((personality & 0x00000300) >> 8) << 2) | (((personality & 0x00000003) >> 0) << 0) ) % 28);
            if (!letter) {
                var = species;
            } else {
                var = letter + SPECIES_UNOWN_B - 1;
            }
            ret = gMonFrontPicCoords[var].y_offset;
        } else if (species == SPECIES_CASTFORM) {
            ret = gCastformFrontSpriteCoords[gBattleMonForms[slot]].y_offset;
        } else if (species > SPECIES_EGG) {
            ret = gMonFrontPicCoords[0].y_offset;
        } else {
            ret = gMonFrontPicCoords[species].y_offset;
        }
    }
    return ret;
}

u8 sub_8077DD8(u8 slot, u16 species) {
    u8 ret = 0;
    if (GetBankSide(slot) == 1) {
        if (!NotInBattle()) {
            if (species == SPECIES_CASTFORM) {
                ret = gUnknownCastformData_0837F5A8[gBattleMonForms[slot]];
            } else if (species > SPECIES_EGG) {
                ret = gEnemyMonElevation[0];
            } else {
                ret = gEnemyMonElevation[species];
            }
        }
    }
    return ret;
}

u8 sub_8077E44(u8 slot, u16 species, u8 a3) {
    u16 offset;
    u8 y;
    if (GetBankSide(slot) == 0 || NotInBattle()) {
        offset = sub_8077BFC(slot, species);
    } else {
        offset = sub_8077BFC(slot, species);
        offset -= sub_8077DD8(slot, species);
    }
    y = offset + gUnknown_0837F578[((gBattleTypeFlags & 0x0001) ? 1 : 0)][GetBankIdentity(slot)].field_1;
    if (a3) {
        if (GetBankSide(slot) == 0) {
            y += 8;
        }
        if (y > 104) y = 104;
    }
    return y;
}

u8 sub_8077EE4(u8 slot, u8 a2) {
    u16 species;
    struct TransformStatus *transform;
    if (a2 == 3 || a2 == 4) {
        if (NotInBattle()) {
            if ((*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk4 & 1) {
                species = (*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk2;
            } else {
                species = (*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk0;
            }
        } else {
            transform = &((struct TransformStatus *)(gSharedMem + 0x17800))[slot];
            if (!transform->species) {
                species = gUnknown_0202F7CA[slot];
            } else {
                species = transform->species;
            }
        }
        if (a2 == 3) {
            return sub_8077E44(slot, species, 1);
        } else {
            return sub_8077E44(slot, species, 0);
        }
    } else {
        return sub_8077ABC(slot, a2);
    }
}

u8 sub_8077F68(u8 slot) {
    return sub_8077ABC(slot, 4);
}

u8 sub_8077F7C(u8 slot) {
    u16 var;
    if (GetBankSide(slot)) {
        var = sub_8077ABC(slot, 1) + 16;
    } else {
        var = sub_8077ABC(slot, 1) + 17;
    }
    return var;
}

u8 sub_8077FC0(u8 slot) {
    u16 var;
    u8 r6;
    struct TransformStatus *transform;
    r6 = sub_8077ABC(slot, 1);
    if (!NotInBattle()) {
        if (GetBankSide(slot)) {
            transform = &((struct TransformStatus *)(gSharedMem + 0x17800))[slot];
            if (!transform->species) {
                var = GetMonData(&gEnemyParty[gBattlePartyID[slot]], 11);
            } else {
                var = transform->species;
            }
        } else {
            transform = &((struct TransformStatus *)(gSharedMem + 0x17800))[slot];
            if (!transform->species) {
                var = GetMonData(&gPlayerParty[gBattlePartyID[slot]], 11);
            } else {
                var = transform->species;
            }
        }
        if (GetBankSide(slot)) {
            r6 -= sub_8077DD8(slot, var);
        }
    }
    return r6;
}

u8 GetAnimBankSpriteId(u8 whichBank) {
    u8 *sprites;
    if (whichBank == ANIM_BANK_ATK) {
        if (AnimBankSpriteExists(gBattleAnimBankAttacker)) {
            sprites = gObjectBankIDs;
            return sprites[gBattleAnimBankAttacker];
        } else {
            return 0xff;
        }
    } else if (whichBank == ANIM_BANK_DEF) {
        if (AnimBankSpriteExists(gBattleAnimBankTarget)) {
            sprites = gObjectBankIDs;
            return sprites[gBattleAnimBankTarget];
        } else {
            return 0xff;
        }
    } else if (whichBank == ANIM_BANK_ATK_PARTNER) {
        if (!IsAnimBankSpriteVisible(gBattleAnimBankAttacker ^ 2)) {
            return 0xff;
        } else {
            return gObjectBankIDs[gBattleAnimBankAttacker ^ 2];
        }
    } else {
        if (IsAnimBankSpriteVisible(gBattleAnimBankTarget ^ 2)) {
            return gObjectBankIDs[gBattleAnimBankTarget ^ 2];
        } else {
            return 0xff;
        }
    }
}

void StoreSpriteCallbackInData(struct Sprite *sprite, void (*callback)(struct Sprite*)) {
    sprite->data[6] = (u32)(callback) & 0xffff;
    sprite->data[7] = (u32)(callback) >> 16;
}

void SetCallbackToStoredInData(struct Sprite *sprite) {
    u32 callback = (u16)sprite->data[6] | (sprite->data[7] << 16);
    sprite->callback = (void (*)(struct Sprite *))callback;
}

void sub_8078114(struct Sprite *sprite) {
    if (sprite->data[3]) {
        sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
        sprite->pos2.y = Cos(sprite->data[0], sprite->data[1]);
        sprite->data[0] += sprite->data[2];
        if (sprite->data[0] >= 0x100) {
            sprite->data[0] -= 0x100;
        } else if (sprite->data[0] < 0) {
            sprite->data[0] += 0x100;
        }
        sprite->data[3]--;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078174(struct Sprite *sprite) {
    if (sprite->data[3]) {
        sprite->pos2.x = Sin(sprite->data[0], (sprite->data[5] >> 8) + sprite->data[1]);
        sprite->pos2.y = Cos(sprite->data[0], (sprite->data[5] >> 8) + sprite->data[1]);
        sprite->data[0] += sprite->data[2];
        sprite->data[5] += sprite->data[4];
        if (sprite->data[0] >= 0x100) {
            sprite->data[0] -= 0x100;
        } else if (sprite->data[0] < 0) {
            sprite->data[0] += 0x100;
        }
        sprite->data[3]--;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void unref_sub_80781F0(struct Sprite *sprite) {
    if (sprite->data[3]) {
        sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
        sprite->pos2.y = Cos(sprite->data[4], sprite->data[1]);
        sprite->data[0] += sprite->data[2];
        sprite->data[4] += sprite->data[5];
        if (sprite->data[0] >= 0x100) {
            sprite->data[0] -= 0x100;
        } else if (sprite->data[0] < 0) {
            sprite->data[0] += 0x100;
        }
        if (sprite->data[4] >= 0x100) {
            sprite->data[4] -= 0x100;
        } else if (sprite->data[4] < 0) {
            sprite->data[4] += 0x100;
        }
        sprite->data[3]--;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078278(struct Sprite *sprite) {
    if (sprite->data[3]) {
        sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
        sprite->pos2.y = Cos(sprite->data[0], sprite->data[4]);
        sprite->data[0] += sprite->data[2];
        if (sprite->data[0] >= 0x100) {
            sprite->data[0] -= 0x100;
        } else if (sprite->data[0] < 0) {
            sprite->data[0] += 0x100;
        }
        sprite->data[3]--;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_80782D8(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_80782F8(struct Sprite *sprite) {
    sub_8078314(sprite);
    sprite->callback = sub_8078364;
    sprite->callback(sprite);
}

void sub_8078314(struct Sprite *sprite) {
    s16 old;
    int v1;
    if (sprite->data[1] > sprite->data[2]) {
        sprite->data[0] = -sprite->data[0];
    }
    v1 = sprite->data[2] - sprite->data[1];
    old = sprite->data[0];
    sprite->data[0] = abs(v1 / sprite->data[0]);
    sprite->data[2] = (sprite->data[4] - sprite->data[3]) / sprite->data[0];
    sprite->data[1] = old;
}

void sub_8078364(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
        sprite->pos2.x += sprite->data[1];
        sprite->pos2.y += sprite->data[2];
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078394(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
        sprite->data[3] += sprite->data[1];
        sprite->data[4] += sprite->data[2];
        sprite->pos2.x = sprite->data[3] >> 8;
        sprite->pos2.y = sprite->data[4] >> 8;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_80783D0(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
        sprite->data[3] += sprite->data[1];
        sprite->data[4] += sprite->data[2];
        sprite->pos2.x = sprite->data[3] >> 8;
        sprite->pos2.y = sprite->data[4] >> 8;
    } else {
        SetCallbackToStoredInData(sprite);
    }
    UpdateMonIconFrame(sprite);
}

void unref_sub_8078414(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x + sprite->pos2.x;
    sprite->data[3] = sprite->pos1.y + sprite->pos2.y;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    sprite->callback = sub_80782F8;
}

void sub_8078458(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
        gSprites[sprite->data[3]].pos2.x += sprite->data[1];
        gSprites[sprite->data[3]].pos2.y += sprite->data[2];
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_80784A8(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
        sprite->data[3] += sprite->data[1];
        sprite->data[4] += sprite->data[2];
        gSprites[sprite->data[5]].pos2.x = sprite->data[3] >> 8;
        gSprites[sprite->data[5]].pos2.y = sprite->data[4] >> 8;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078504(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
        sprite->pos2.x = sprite->data[2] >> 8;
        sprite->data[2] += sprite->data[1];
        sprite->pos2.y = sprite->data[4] >> 8;
        sprite->data[4] += sprite->data[3];
        if (sprite->data[0] % sprite->data[5] == 0) {
            if (sprite->data[5]) {
                sprite->invisible ^= 1;
            }
        }
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void move_anim_8074EE0(struct Sprite *sprite) {
    FreeSpriteOamMatrix(sprite);
    move_anim_8072740(sprite);
}

void unref_sub_8078588(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x + sprite->pos2.x;
    sprite->data[3] = sprite->pos1.y + sprite->pos2.y;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->callback = sub_80782F8;
}

void unref_sub_80785CC(struct Sprite *sprite) {
    ResetPaletteStructByUid(sprite->data[5]);
    move_anim_8074EE0(sprite);
}

void sub_80785E4(struct Sprite *sprite) {
    if (sprite->affineAnimEnded) {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078600(struct Sprite *sprite) {
    if (sprite->animEnded) {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_807861C(struct Sprite *sprite) {
    (*(vu16 *)(0x4000000 + 0x50)) = 0;
    (*(vu16 *)(0x4000000 + 0x52)) = 0;
    move_anim_8072740(sprite);
}

void sub_8078634(u8 task) {
    (*(vu16 *)(0x4000000 + 0x50)) = 0;
    (*(vu16 *)(0x4000000 + 0x52)) = 0;
    DestroyAnimVisualTask(task);
}

void sub_8078650(struct Sprite *sprite) {
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
}

void sub_807867C(struct Sprite *sprite, s16 a2) {
    u16 v1 = sub_8077ABC(gBattleAnimBankAttacker, 0);
    u16 v2 = sub_8077ABC(gBattleAnimBankTarget, 0);
    if (v1 > v2) {
        sprite->pos1.x -= a2;
    } else if (v1 < v2) {
        sprite->pos1.x += a2;
    } else {
        if (GetBankSide(gBattleAnimBankAttacker)) {
            sprite->pos1.x -= a2;
        } else {
            sprite->pos1.x += a2;
        }
    }
}

void sub_80786EC(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[6] = 0x8000 / sprite->data[0];
    sprite->data[7] = 0;
}

bool8 sub_8078718(struct Sprite *sprite) {
    if (sub_8078B5C(sprite)) {
        return 1;
    }
    sprite->data[7] += sprite->data[6];
    sprite->pos2.y += Sin((u8)(sprite->data[7] >> 8), sprite->data[5]);
    return 0;
}

void oamt_add_pos2_onto_pos1(struct Sprite *sprite) {
    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
}

void sub_8078764(struct Sprite *sprite, u8 a2) {
    if (!a2) {
        sprite->pos1.x = sub_8077EE4(gBattleAnimBankTarget, 0);
        sprite->pos1.y = sub_8077EE4(gBattleAnimBankTarget, 1);
    }
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
}

void sub_80787B0(struct Sprite *sprite, u8 a2) {
    if (!a2) {
        sprite->pos1.x = sub_8077EE4(gBattleAnimBankAttacker, 0);
        sprite->pos1.y = sub_8077EE4(gBattleAnimBankAttacker, 1);
    } else {
        sprite->pos1.x = sub_8077EE4(gBattleAnimBankAttacker, 2);
        sprite->pos1.y = sub_8077EE4(gBattleAnimBankAttacker, 3);
    }
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
}

u8 GetBankSide(u8 slot) {
    return gBanksBySide[slot] & 1;
}

u8 GetBankIdentity(u8 slot) {
    return gBanksBySide[slot];
}

u8 GetBankByPlayerAI(u8 slot) {
    u8 i;
    for (i = 0; i < gNoOfAllBanks; i++) {
        if (gBanksBySide[i] == slot) {
            break;
        }
    }
    return i;
}

bool8 AnimBankSpriteExists(u8 slot) {
    if (NotInBattle()) {
        if (gBattleAnimBankAttacker == slot) {
            return 1;
        }
        if (gBattleAnimBankTarget == slot) {
            return 1;
        }
        return 0;
    } else {
        if (gBanksBySide[slot] == 0xff) {
            return 0;
        }
        if (GetBankSide(slot)) {
            if (GetMonData(&gEnemyParty[gBattlePartyID[slot]], 57) != 0) {
                return 1;
            }
        } else {
            if (GetMonData(&gPlayerParty[gBattlePartyID[slot]], 57) != 0) {
                return 1;
            }
        }
        return 0;
    }
}

bool8 IsDoubleBattle() {
    return ((gBattleTypeFlags & 0x0001) ? 1 : 0);
}

void sub_8078914(struct Struct_sub_8078914 *unk) {
    if (NotInBattle()) {
        unk->field_0 = (u8 *)0x6008000;
        unk->field_4 = (u8 *)0x600f000;
        unk->field_8 = 0xe;
    } else {
        unk->field_0 = (u8 *)0x6004000;
        unk->field_4 = (u8 *)0x600e000;
        unk->field_8 = 0x8;
    }
}

void sub_8078954(struct Struct_sub_8078914 *unk) {
    if (NotInBattle()) {
        unk->field_0 = (u8 *)0x6008000;
        unk->field_4 = (u8 *)0x600f000;
        unk->field_8 = 0xe;
    } else if (GetBankIdentity_permutated(gBattleAnimBankAttacker) == 1) {
        unk->field_0 = (u8 *)0x6004000;
        unk->field_4 = (u8 *)0x600e000;
        unk->field_8 = 0x8;
    } else {
        unk->field_0 = (u8 *)0x6006000;
        unk->field_4 = (u8 *)0x600f000;
        unk->field_8 = 0x9;
    }
}

u8 sub_80789BC() {
    if (NotInBattle()) {
        return 1;
    }
    return 2;
}

void sub_80789D4(bool8 a1) {
    if (!a1) {
        (*(volatile struct BGCnt*)(0x4000000 + 0xe)).size = 0;
        (*(volatile struct BGCnt*)(0x4000000 + 0xe)).overflow = 1;
    } else if (NotInBattle()) {
        (*(volatile struct BGCnt*)(0x4000000 + 0xe)).size = 0;
        (*(volatile struct BGCnt*)(0x4000000 + 0xe)).overflow = 1;
    } else {
        (*(volatile struct BGCnt*)(0x4000000 + 0xe)).size = 1;
        (*(volatile struct BGCnt*)(0x4000000 + 0xe)).overflow = 0;
    }
}

void sub_8078A34(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sub_8078A5C(sprite);
    sprite->callback = sub_80783D0;
    sprite->callback(sprite);
}

void sub_8078A5C(struct Sprite *sprite) {
    s16 x = (sprite->data[2] - sprite->data[1]) << 8;
    s16 y = (sprite->data[4] - sprite->data[3]) << 8;
    sprite->data[1] = x / sprite->data[0];
    sprite->data[2] = y / sprite->data[0];
    sprite->data[4] = 0;
    sprite->data[3] = 0;
}

void obj_translate_based_on_private_1_2_3_4(struct Sprite *sprite) {
    int x = sprite->data[2] - sprite->data[1];
    int y = sprite->data[4] - sprite->data[3];
    bool8 r8 = x < 0;
    bool8 r9 = y < 0;
    u16 x2 = abs(x) << 8;
    u16 y2 = abs(y) << 8;
    x2 = x2 / sprite->data[0];
    y2 = y2 / sprite->data[0];
    if (r8) {
        x2 |= 1;
    } else {
        x2 &= ~1;
    }
    if (r9) {
        y2 |= 1;
    } else {
        y2 &= ~1;
    }
    sprite->data[1] = x2;
    sprite->data[2] = y2;
    sprite->data[4] = 0;
    sprite->data[3] = 0;
}

void sub_8078B34(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->callback = sub_8078BB8;
    sprite->callback(sprite);
}

bool8 sub_8078B5C(struct Sprite *sprite) {
    u16 v1, v2, x, y;
    if (!sprite->data[0]) {
        return 1;
    }
    v1 = sprite->data[1];
    v2 = sprite->data[2];
    x = sprite->data[3];
    y = sprite->data[4];
    x += v1;
    y += v2;
    if (v1 & 1) {
        sprite->pos2.x = -(x >> 8);
    } else {
        sprite->pos2.x = x >> 8;
    }
    if (v2 & 1) {
        sprite->pos2.y = -(y >> 8);
    } else {
        sprite->pos2.y = y >> 8;
    }
    sprite->data[3] = x;
    sprite->data[4] = y;
    sprite->data[0]--;
    return 0;
}

void sub_8078BB8(struct Sprite *sprite) {
    if (sub_8078B5C(sprite)) {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078BD4(struct Sprite *sprite) {
    int v1 = abs(sprite->data[2] - sprite->data[1]) << 8;
    sprite->data[0] = v1 / sprite->data[0];
    obj_translate_based_on_private_1_2_3_4(sprite);
}

void sub_8078C00(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sub_8078BD4(sprite);
    sprite->callback = sub_8078BB8;
    sprite->callback(sprite);
}

void sub_8078C28(struct Sprite *sprite) {
    int x = sprite->data[2] - sprite->data[1];
    int y = sprite->data[4] - sprite->data[3];
    bool8 x_sign = x < 0;
    bool8 y_sign = y < 0;
    u16 x2 = abs(x) << 4;
    u16 y2 = abs(y) << 4;
    x2 /= sprite->data[0];
    y2 /= sprite->data[0];
    if (x_sign) {
        x2 |= 1;
    } else {
        x2 &= ~1;
    }
    if (y_sign) {
        y2 |= 1;
    } else {
        y2 &= ~1;
    }
    sprite->data[1] = x2;
    sprite->data[2] = y2;
    sprite->data[4] = 0;
    sprite->data[3] = 0;
}

void sub_8078CC0(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sub_8078C28(sprite);
    sprite->callback = sub_8078D44;
    sprite->callback(sprite);
}

bool8 sub_8078CE8(struct Sprite *sprite) {
    u16 v1, v2, x, y;
    if (!sprite->data[0]) {
        return 1;
    }
    v1 = sprite->data[1];
    v2 = sprite->data[2];
    x = sprite->data[3];
    y = sprite->data[4];
    x += v1;
    y += v2;
    if (v1 & 1) {
        sprite->pos2.x = -(x >> 4);
    } else {
        sprite->pos2.x = x >> 4;
    }
    if (v2 & 1) {
        sprite->pos2.y = -(y >> 4);
    } else {
        sprite->pos2.y = y >> 4;
    }
    sprite->data[3] = x;
    sprite->data[4] = y;
    sprite->data[0]--;
    return 0;
}

void sub_8078D44(struct Sprite *sprite) {
    if (sub_8078CE8(sprite)) {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078D60(struct Sprite *sprite) {
    int v1 = abs(sprite->data[2] - sprite->data[1]) << 4;
    sprite->data[0] = v1 / sprite->data[0];
    sub_8078C28(sprite);
}

void sub_8078D8C(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sub_8078D60(sprite);
    sprite->callback = sub_8078D44;
    sprite->callback(sprite);
}

void obj_id_set_rotscale(u8 sprite, s16 xScale, s16 yScale, u16 rotation) {
    int i;
    struct ObjAffineSrcData src;
    struct OamMatrix matrix;
    src.xScale = xScale;
    src.yScale = yScale;
    src.rotation = rotation;
    if (sub_8078E38()) {
        src.xScale = -src.xScale;
    }
    i = gSprites[sprite].oam.matrixNum;
    ObjAffineSet(&src, &matrix, 1, 2);
    gOamMatrices[i].a = matrix.a;
    gOamMatrices[i].b = matrix.b;
    gOamMatrices[i].c = matrix.c;
    gOamMatrices[i].d = matrix.d;
}

bool8 sub_8078E38() {
    if (NotInBattle()) {
        if (gSprites[GetAnimBankSpriteId(0)].data[2] == 0xc9 ) {
            return 0;
        }
        return 1;
    }
    return 0;
}

void sub_8078E70(u8 sprite, u8 a2) {
    u8 r7 = gSprites[sprite].data[0];
    if (NotInBattle() || IsAnimBankSpriteVisible(r7)) {
        gSprites[sprite].invisible = 0;
    }
    gSprites[sprite].oam.objMode = a2;
    gSprites[sprite].affineAnimPaused = 1;
    if (!NotInBattle() && !gSprites[sprite].oam.affineMode) {
        gSprites[sprite].oam.matrixNum = ((struct Struct2017810 *) (gSharedMem + 0x17810))[r7].unk6;
    }
    gSprites[sprite].oam.affineMode = 3;
    CalcCenterToCornerVec(&gSprites[sprite], gSprites[sprite].oam.shape, gSprites[sprite].oam.size, gSprites[sprite].oam.affineMode);
}

void sub_8078F40(u8 sprite) {
    obj_id_set_rotscale(sprite, 0x100, 0x100, 0);
    gSprites[sprite].oam.affineMode = 1;
    gSprites[sprite].oam.objMode = 0;
    gSprites[sprite].affineAnimPaused = 0;
    CalcCenterToCornerVec(&gSprites[sprite], gSprites[sprite].oam.shape, gSprites[sprite].oam.size, gSprites[sprite].oam.affineMode);
}

void sub_8078F9C(u8 sprite) {
    u16 matrix = gSprites[sprite].oam.matrixNum;
    s16 c = gOamMatrices[matrix].c;
    if (c < 0) {
        c = -c;
    }
    gSprites[sprite].pos2.y = c >> 3;
}


void sub_8078FDC(struct Sprite *sprite, bool8 a2, s16 xScale, s16 yScale, u16 rotation) {
    int i;
    struct ObjAffineSrcData src;
    struct OamMatrix matrix;
    if (sprite->oam.affineMode & 1) {
        sprite->affineAnimPaused = 1;
        if (a2) {
            CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, sprite->oam.affineMode);
        }
        src.xScale = xScale;
        src.yScale = yScale;
        src.rotation = rotation;
        if (sub_8078E38()) {
            src.xScale = -src.xScale;
        }
        i = sprite->oam.matrixNum;
        ObjAffineSet(&src, &matrix, 1, 2);
        gOamMatrices[i].a = matrix.a;
        gOamMatrices[i].b = matrix.b;
        gOamMatrices[i].c = matrix.c;
        gOamMatrices[i].d = matrix.d;
    }
}

void sub_8079098(struct Sprite *sprite) {
    sub_8078FDC(sprite, 1, 0x100, 0x100, 0);
    sprite->affineAnimPaused = 0;
    CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, sprite->oam.affineMode);
}

static u16 ArcTan2_(s16 a, s16 b) {
    return ArcTan2(a, b);
}

u16 sub_80790F0(s16 a, s16 b) {
    u16 var = ArcTan2_(a, b);
    return -var;
}

void sub_8079108(u16 a1, bool8 a2) {
    int i;
    struct Color *c;
    struct Color *c2;
    u16 average;

    a1 *= 0x10;

    if (!a2) {
        for (i = 0; i < 0x10; i++) {
            c = (struct Color *)&gPlttBufferUnfaded[a1 + i];
            average = c->r + c->g + c->b;
            average /= 3;

            c2 = (struct Color *)&gPlttBufferFaded[a1 + i];
            c2->r = average;
            c2->g = average;
            c2->b = average;
        }
    } else {
        CpuSet(&gPlttBufferUnfaded[a1], &gPlttBufferFaded[a1], 0x04000000 | ((0x20)/(32/8) & 0x1FFFFF));
    }
}

u32 sub_80791A8(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7) {
    u32 var = 0;
    u32 shift;
    if (a1) {
        if (!NotInBattle()) {
            var = 0xe;
        } else {
            var = 1 << sub_80789BC();
        }
    }
    if (a2) {
        shift = gBattleAnimBankAttacker + 16;
        var |= 1 << shift;
    }
    if (a3) {
        shift = gBattleAnimBankTarget + 16;
        var |= 1 << shift;
    }
    if (a4) {
        if (IsAnimBankSpriteVisible(gBattleAnimBankAttacker ^ 2)) {
            shift = (gBattleAnimBankAttacker ^ 2) + 16;
            var |= 1 << shift;
        }
    }
    if (a5) {
        if (IsAnimBankSpriteVisible(gBattleAnimBankTarget ^ 2)) {
            shift = (gBattleAnimBankTarget ^ 2) + 16;
            var |= 1 << shift;
        }
    }
    if (a6) {
        if (!NotInBattle()) {
            var |= 0x100;
        } else {
            var |= 0x4000;
        }
    }
    if (a7) {
        if (!NotInBattle()) {
            var |= 0x200;
        }
    }
    return var;
}

u32 sub_80792C0(u8 a1, u8 a2, u8 a3, u8 a4) {
    u32 var = 0;
    u32 shift;
    if (NotInBattle()) {
        if (a1) {
            var |= 1 << 18;
            return var;
        }
    } else {
        if (a1) {
            if (IsAnimBankSpriteVisible(GetBankByPlayerAI(0))) {
                var |= 1 << (GetBankByPlayerAI(0) + 16);
            }
        }
        if (a2) {
            if (IsAnimBankSpriteVisible(GetBankByPlayerAI(2))) {
                shift = GetBankByPlayerAI(2) + 16;
                var |= 1 << shift;
            }
        }
        if (a3) {
            if (IsAnimBankSpriteVisible(GetBankByPlayerAI(1))) {
                shift = GetBankByPlayerAI(1) + 16;
                var |= 1 << shift;
            }
        }
        if (a4) {
            if (IsAnimBankSpriteVisible(GetBankByPlayerAI(3))) {
                shift = GetBankByPlayerAI(3) + 16;
                var |= 1 << shift;
            }
        }
    }
    return var;
}

u8 sub_80793A8(u8 a1) {
    return a1;
}

u8 unref_sub_80793B0(u8 a1) {
    return GetBankByPlayerAI(a1);
}

void sub_80793C4(struct Sprite *sprite) {
    bool8 var;
    if (!sprite->data[0]) {
        if (!gBattleAnimArgs[3]) {
            var = 1;
        } else {
            var = 0;
        }
        if (!gBattleAnimArgs[2]) {
            sub_80787B0(sprite, var);
        } else {
            sub_8078764(sprite, var);
        }
        sprite->data[0]++;

    } else if (sprite->animEnded || sprite->affineAnimEnded) {
        move_anim_8074EE0(sprite);
    }
}

void sub_807941C(struct Sprite *sprite) {
    bool8 v1;
    u8 v2;
    if (!(gBattleAnimArgs[5] & 0xff00)) {
        v1 = 1;
    } else {
        v1 = 0;
    }
    if (!(gBattleAnimArgs[5] & 0xff)) {
        v2 = 3;
    } else {
        v2 = 1;
    }
    sub_80787B0(sprite, v1);
    if (GetBankSide(gBattleAnimBankAttacker)) {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, v2) + gBattleAnimArgs[3];
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80794A8(struct Sprite *sprite) {
    sub_80787B0(sprite, 1);
    if (GetBankSide(gBattleAnimBankAttacker)) {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];
    sub_80786EC(sprite);
    sprite->callback = sub_8079518;
}

void sub_8079518(struct Sprite *sprite) {
    if (sub_8078718(sprite)) {
        move_anim_8072740(sprite);
    }
}

void sub_8079534(struct Sprite *sprite) {
    u8 r4, slot, r7;
    if (!gBattleAnimArgs[6]) {
        r4 = 1;
        r7 = 3;
    } else {
        r4 = 0;
        r7 = 1;
    }
    if (!gBattleAnimArgs[5]) {
        sub_80787B0(sprite, r4);
        slot = gBattleAnimBankAttacker;
    } else {
        sub_8078764(sprite, r4);
        slot = gBattleAnimBankTarget;
    }
    if (GetBankSide(gBattleAnimBankAttacker)) {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    sub_8078764(sprite, r4);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sub_8077ABC(slot, 2) + gBattleAnimArgs[2];
    sprite->data[4] = sub_8077ABC(slot, r7) + gBattleAnimArgs[3];
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

s16 duplicate_obj_of_side_rel2move_in_transparent_mode(u8 a1) {
    u16 i;
    u8 sprite = GetAnimBankSpriteId(a1);
    if (sprite != 0xff) {
        for (i = 0; i < 0x40; i++) {
            if (gSprites[i].inUse) {
                continue;
            }
            gSprites[i] = gSprites[sprite];
            gSprites[i].oam.objMode = 1;
            gSprites[i].invisible = 0;
            return i;
        }
    }
    return -1;
}

void obj_delete_but_dont_free_vram(struct Sprite *sprite) {
    sprite->usingSheet = 1;
    DestroySprite(sprite);
}

void sub_8079670(u8 task) {
    s16 v1 = 0;
    s16 v2 = 0;
    if (gBattleAnimArgs[2] > gBattleAnimArgs[0]) {
        v2 = 1;
    }
    if (gBattleAnimArgs[2] < gBattleAnimArgs[0]) {
        v2 = -1;
    }
    if (gBattleAnimArgs[3] > gBattleAnimArgs[1]) {
        v1 = 1;
    }
    if (gBattleAnimArgs[3] < gBattleAnimArgs[1]) {
        v1 = -1;
    }
    gTasks[task].data[0] = 0;
    gTasks[task].data[1] = gBattleAnimArgs[4];
    gTasks[task].data[2] = 0;
    gTasks[task].data[3] = gBattleAnimArgs[0];
    gTasks[task].data[4] = gBattleAnimArgs[1];
    gTasks[task].data[5] = v2;
    gTasks[task].data[6] = v1;
    gTasks[task].data[7] = gBattleAnimArgs[2];
    gTasks[task].data[8] = gBattleAnimArgs[3];
    (*(vu16 *)(0x4000000 + 0x52)) = (gBattleAnimArgs[1] << 8) | gBattleAnimArgs[0];
    gTasks[task].func = sub_80796F8;
}

void sub_80796F8(u8 taskId) {
    struct Task *task = &gTasks[taskId];
    if (++task->data[0] > task->data[1]) {
        task->data[0] = 0;
        if (++task->data[2] & 1) {
            if (task->data[3] != task->data[7]) {
                task->data[3] += task->data[5];
            }
        } else {
            if (task->data[4] != task->data[8]) {
                task->data[4] += task->data[6];
            }
        }
        (*(vu16 *)(0x4000000 + 0x52)) = (task->data[4] << 8) | task->data[3];
        if (task->data[3] == task->data[7] && task->data[4] == task->data[8]) {
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
}

void sub_8079790(u8 task) {
    u8 sprite = GetAnimBankSpriteId(gBattleAnimArgs[0]);
    if (sprite == 0xff) {
        DestroyAnimVisualTask(task);
        return;
    }
    gTasks[task].data[0] = (gSprites[sprite].oam.paletteNum * 0x10) + 0x101;
    sub_80797EC(&gTasks[task]);
}

void sub_80797EC(struct Task *task) {
    task->data[1] = gBattleAnimArgs[1];
    task->data[2] = 0;
    task->data[3] = gBattleAnimArgs[2];
    task->data[4] = 0;
    task->data[5] = gBattleAnimArgs[3];
    task->data[6] = 0;
    task->data[7] = gBattleAnimArgs[4];
    task->func = sub_8079814;
}

void sub_8079814(u8 taskId) {
    struct Task *task = &gTasks[taskId];
    if (++task->data[4] >= task->data[5]) {
        task->data[4] = 0;
        if (!task->data[6]) {
            task->data[2]++;
            BlendPalette(task->data[0], 0xf, task->data[2], task->data[1]);
            if (task->data[2] == task->data[3]) {
                task->data[6] = 1;
            }
        } else {
            task->data[2]--;
            BlendPalette(task->data[0], 0xf, task->data[2], task->data[1]);
            if (!task->data[2]) {
                if (--task->data[7]) {
                    task->data[4] = 0;
                    task->data[6] = 0;
                } else {
                    DestroyAnimVisualTask(taskId);
                    return;
                }
            }
        }
    }
}

void sub_80798AC(u8 task) {
    u8 palette = IndexOfSpritePaletteTag(gBattleAnimArgs[0]);
    if (palette == 0xff) {
        DestroyAnimVisualTask(task);
        return;
    }
    gTasks[task].data[0] = (palette * 0x10) + 0x101;
    sub_80797EC(&gTasks[task]);
}

void sub_80798F4(struct Task *task, u8 a2, void *a3) {
    task->data[7] = 0;
    task->data[8] = 0;
    task->data[9] = 0;
    task->data[15] = a2;
    task->data[10] = 0x100;
    task->data[11] = 0x100;
    task->data[12] = 0;
    sub_8079BF4(&task->data[13], &task->data[14], a3);
    sub_8078E70(a2, 0);
}

bool8 sub_807992C(struct Task *task) {
    gUnknown_0202F7D4 = sub_8079BFC(task->data[13], task->data[14]) + (task->data[7] << 3);
    switch (gUnknown_0202F7D4->type) {
    default:
        if (!gUnknown_0202F7D4->frame.duration) {
            task->data[10] = gUnknown_0202F7D4->frame.xScale;
            task->data[11] = gUnknown_0202F7D4->frame.yScale;
            task->data[12] = gUnknown_0202F7D4->frame.rotation;
            task->data[7]++;
            gUnknown_0202F7D4++;
        }
        task->data[10] += gUnknown_0202F7D4->frame.xScale;
        task->data[11] += gUnknown_0202F7D4->frame.yScale;
        task->data[12] += gUnknown_0202F7D4->frame.rotation;
        obj_id_set_rotscale(task->data[15], task->data[10], task->data[11], task->data[12]);
        sub_8079A64(task->data[15]);
        if (++task->data[8] >= gUnknown_0202F7D4->frame.duration) {
            task->data[8] = 0;
            task->data[7]++;
        }
        break;

    case 0x7FFE:
        task->data[7] = gUnknown_0202F7D4->jump.target;
        break;

    case 0x7FFD:
        if (gUnknown_0202F7D4->loop.count) {
            if (task->data[9]) {
                if (!--task->data[9]) {
                    task->data[7]++;
                    break;
                }
            } else {
                task->data[9] = gUnknown_0202F7D4->loop.count;
            }
            if (!task->data[7]) {
                break;
            }
            for (;;) {
                task->data[7]--;
                gUnknown_0202F7D4--;
                if (gUnknown_0202F7D4->type == 0x7FFD) {
                    task->data[7]++;
                    return 1;
                }
                if (!task->data[7]) {
                    return 1;
                }
            }
        }
        task->data[7]++;
        break;

    case 0x7fff:
        gSprites[task->data[15]].pos2.y = 0;
        sub_8078F40(task->data[15]);
        return 0;
    }

    return 1;
}

void sub_8079A64(u8 sprite) {
    int var = 0x40 - sub_8079B10(sprite) * 2;
    u16 matrix = gSprites[sprite].oam.matrixNum;
    int var2 = (var << 8) / gOamMatrices[matrix].d;
    if (var2 > 0x80) {
        var2 = 0x80;
    }
    gSprites[sprite].pos2.y = (var - var2) / 2;
}

void sub_8079AB8(u8 sprite, u8 sprite2) {
    int var = 0x40 - sub_8079B10(sprite2) * 2;
    u16 matrix = gSprites[sprite].oam.matrixNum;
    int var2 = (var << 8) / gOamMatrices[matrix].d;
    if (var2 > 0x80) {
        var2 = 0x80;
    }
    gSprites[sprite].pos2.y = (var - var2) / 2;
}

u16 sub_8079B10(u8 sprite) {
    struct TransformStatus *transform;
    u8 slot = gSprites[sprite].data[0];
    u16 species;
    u16 i;
    for (i = 0; i < (sizeof(gObjectBankIDs) / sizeof(u8)); i++) {
        if (gObjectBankIDs[i] == sprite) {
            if (NotInBattle()) {
                species = (*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk0;
                return gMonBackPicCoords[species].y_offset;
            } else {
                if (!GetBankSide(i)) {
                    transform = &((struct TransformStatus *)(gSharedMem + 0x17800))[slot];
                    if (!transform->species) {
                        species = GetMonData(&gPlayerParty[gBattlePartyID[i]], 11);
                    } else {
                        species = transform->species;
                    }
                    return gMonBackPicCoords[species].y_offset;
                } else {
                    transform = &((struct TransformStatus *)(gSharedMem + 0x17800))[slot];
                    if (!transform->species) {
                        species = GetMonData(&gEnemyParty[gBattlePartyID[i]], 11);
                    } else {
                        species = transform->species;
                    }
                    return gMonFrontPicCoords[species].y_offset;
                }
            }
        }
    }
    return 0x40;
}

void sub_8079BF4(s16 *bottom, s16 *top, void *ptr) {
    *bottom = ((intptr_t) ptr) & 0xffff;
    *top = (((intptr_t) ptr) >> 16) & 0xffff;
}

void *sub_8079BFC(s16 bottom, s16 top) {
    return (void *)((u16)bottom | ((u16)top << 16));
}




void sub_8079C08(struct Task *task, u8 a2, s16 a3, s16 a4, s16 a5, s16 a6, u16 a7) {
    task->data[8] = a7;
    task->data[15] = a2;
    task->data[9] = a3;
    task->data[10] = a4;
    task->data[13] = a5;
    task->data[14] = a6;
    task->data[11] = (a5 - a3) / a7;
    task->data[12] = (a6 - a4) / a7;
}

u8 sub_8079C74(struct Task *task) {
    if (!task->data[8]) {
        return 0;
    }
    if (--task->data[8]) {
        task->data[9] += task->data[11];
        task->data[10] += task->data[12];
    } else {
        task->data[9] = task->data[13];
        task->data[10] = task->data[14];
    }
    obj_id_set_rotscale(task->data[15], task->data[9], task->data[10], 0);
    if (task->data[8]) {
        sub_8079A64(task->data[15]);
    } else {
        gSprites[task->data[15]].pos2.y = 0;
    }
    return task->data[8];
}

void sub_8079CEC(u8 task) {
    u16 v1;
    if (gHappinessMoveAnim <= 30) {
        v1 = 0;
    } else if (gHappinessMoveAnim <= 100) {
        v1 = 1;
    } else if (gHappinessMoveAnim <= 200) {
        v1 = 2;
    } else {
        v1 = 3;
    }
    gBattleAnimArgs[7] = v1;
    DestroyAnimVisualTask(task);
}

void unref_sub_8079D20(u8 priority) {
    if (IsAnimBankSpriteVisible(gBattleAnimBankTarget)) {
        gSprites[gObjectBankIDs[gBattleAnimBankTarget]].oam.priority = priority;
    }
    if (IsAnimBankSpriteVisible(gBattleAnimBankAttacker)) {
        gSprites[gObjectBankIDs[gBattleAnimBankAttacker]].oam.priority = priority;
    }
    if (IsAnimBankSpriteVisible(gBattleAnimBankTarget ^ 2)) {
        gSprites[gObjectBankIDs[gBattleAnimBankTarget ^ 2]].oam.priority = priority;
    }
    if (IsAnimBankSpriteVisible(gBattleAnimBankAttacker ^ 2)) {
        gSprites[gObjectBankIDs[gBattleAnimBankAttacker ^ 2]].oam.priority = priority;
    }
}

void sub_8079E24() {
    int i;
    for (i = 0; i < gNoOfAllBanks; i++) {
        if (IsAnimBankSpriteVisible(i)) {
            gSprites[gObjectBankIDs[i]].subpriority = sub_8079E90(i);
            gSprites[gObjectBankIDs[i]].oam.priority = 2;
        }
    }
}

u8 sub_8079E90(u8 slot) {
    u8 status;
    u8 ret;
    if (NotInBattle()) {
        if (slot == 2) {
            return 30;
        } else {
            return 40;
        }
    } else {
        status = GetBankIdentity(slot);
        if (status == 0) {
            ret = 30;
        } else if (status == 2) {
            ret = 20;
        } else if (status == 1) {
            ret = 40;
        } else {
            ret = 50;
        }
    }
    return ret;
}

u8 sub_8079ED4(u8 slot) {
    u8 status = GetBankIdentity(slot);
    if (NotInBattle()) {
        return 2;
    }
    if (status == 0 || status == 3) {
        return (*(volatile struct BGCnt*)(0x4000000 + 0xc)).priority;
    } else {
        return (*(volatile struct BGCnt*)(0x4000000 + 0xa)).priority;
    }
}

u8 GetBankIdentity_permutated(u8 slot) {
    u8 status;
    if (!NotInBattle()) {
        status = GetBankIdentity(slot);
        if (status == 0 || status == 3) {
            return 2;
        } else {
            return 1;
        }
    }
    return 1;
}

u8 sub_8079F44(u16 species, u8 isBackpic, u8 a3, s16 a4, s16 a5, u8 a6, u32 a7, u32 a8) {
    void *src;
    void *dest;
    int size;

    u8 sprite;
    u16 sheet = LoadSpriteSheet(&gUnknown_0837F5E0[a3]);
    u16 palette = AllocSpritePalette(gSpriteTemplate_837F5B0[a3].paletteTag);
    if (!isBackpic) {
        LoadCompressedPalette(GetMonSpritePalFromOtIdPersonality(species, a8, a7), (palette * 0x10) + 0x100, 0x20);
        LoadSpecialPokePic(
            &gMonFrontPicTable[species],
            gMonFrontPicCoords[species].coords,
            gMonFrontPicCoords[species].y_offset,
            0x2000000,
            (void *)0x2000000,
            species,
            a7,
            1
        );
    } else {
        LoadCompressedPalette(
            GetMonSpritePalFromOtIdPersonality(species, a8, a7), (palette * 0x10) + 0x100, 0x20);
        LoadSpecialPokePic(
            &gMonBackPicTable[species],
            gMonBackPicCoords[species].coords,
            gMonBackPicCoords[species].y_offset,
            0x2000000,
            (void *)0x2000000,
            species,
            a7,
            0
        );
    }

    src = (void *)0x2000000;
    dest = (void *)(0x6010000 + (sheet * 0x20));
    size = 0x800;
    { vu32 *dmaRegs = (vu32 *)(0x4000000 + 0xd4); dmaRegs[0] = (vu32)(src); dmaRegs[1] = (vu32)(dest); dmaRegs[2] = (vu32)((0x8000 | 0x0000 | 0x0400 | 0x0000 | 0x0000) << 16 | ((size)/(32/8))); dmaRegs[2]; };

    if (!isBackpic) {
        sprite = CreateSprite(&gSpriteTemplate_837F5B0[a3], a4, a5 + gMonFrontPicCoords[species].y_offset, a6);
    } else {
        sprite = CreateSprite(&gSpriteTemplate_837F5B0[a3], a4, a5 + gMonBackPicCoords[species].y_offset, a6);
    }
    if (NotInBattle()) {
        gSprites[sprite].affineAnims = &gSpriteAffineAnimTable_81E7C18;
        StartSpriteAffineAnim(&gSprites[sprite], 0);
    }
    return sprite;
}

void sub_807A0F4(struct Sprite *sprite) {
    DestroySpriteAndFreeResources(sprite);
}

int sub_807A100(u8 slot, u8 a2) {
    u16 species;
    u32 personality;
    u16 letter;
    u16 var;
    int ret;
    const struct MonCoords *coords;
    struct TransformStatus *transform;
    if (NotInBattle()) {
        if ((*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk4 & 1) {
            species = (*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk2;
            personality = (*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk10;
        } else {
            species = (*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk0;
            personality = (*(struct Struct2019348 *)(gSharedMem + 0x19348)).unk8;
        }
        if (species == SPECIES_UNOWN) {
            letter = (( (((personality & 0x03000000) >> 24) << 6) | (((personality & 0x00030000) >> 16) << 4) | (((personality & 0x00000300) >> 8) << 2) | (((personality & 0x00000003) >> 0) << 0) ) % 28);
            if (!letter) {
                var = SPECIES_UNOWN;
            } else {
                var = letter + SPECIES_UNOWN_B - 1;
            }
            coords = &gMonBackPicCoords[var];
        } else if (species == SPECIES_CASTFORM) {
            coords = &gCastformFrontSpriteCoords[gBattleMonForms[slot]];
        } else if (species <= SPECIES_EGG) {
            coords = &gMonBackPicCoords[species];
        } else {
            coords = &gMonBackPicCoords[0];
        }
    } else {
        if (!GetBankSide(slot)) {
            transform = &((struct TransformStatus *)(gSharedMem + 0x17800))[slot];
            if (!transform->species) {
                species = GetMonData(&gPlayerParty[gBattlePartyID[slot]], 11);
                personality = GetMonData(&gPlayerParty[gBattlePartyID[slot]], 0);
            } else {
                species = transform->species;
                personality = gPID_perBank[slot];
            }
            if (species == SPECIES_UNOWN) {
                letter = (( (((personality & 0x03000000) >> 24) << 6) | (((personality & 0x00030000) >> 16) << 4) | (((personality & 0x00000300) >> 8) << 2) | (((personality & 0x00000003) >> 0) << 0) ) % 28);
                if (!letter) {
                    var = SPECIES_UNOWN;
                } else {
                    var = letter + SPECIES_UNOWN_B - 1;
                }
                coords = &gMonBackPicCoords[var];
            } else if (species > SPECIES_EGG) {
                coords = &gMonBackPicCoords[0];
            } else {
                coords = &gMonBackPicCoords[species];
            }
        } else {
            transform = &((struct TransformStatus *)(gSharedMem + 0x17800))[slot];
            if (!transform->species) {
                species = GetMonData(&gEnemyParty[gBattlePartyID[slot]], 11);
                personality = GetMonData(&gEnemyParty[gBattlePartyID[slot]], 0);
            } else {
                species = transform->species;
                personality = gPID_perBank[slot];
            }
            if (species == SPECIES_UNOWN) {
                letter = (( (((personality & 0x03000000) >> 24) << 6) | (((personality & 0x00030000) >> 16) << 4) | (((personality & 0x00000300) >> 8) << 2) | (((personality & 0x00000003) >> 0) << 0) ) % 28);
                if (!letter) {
                    var = SPECIES_UNOWN;
                } else {
                    var = letter + SPECIES_UNOWN_B - 1;
                }
                coords = &gMonFrontPicCoords[var];
            } else if (species == SPECIES_CASTFORM) {
                coords = &gCastformFrontSpriteCoords[gBattleMonForms[slot]];
            } else if (species > SPECIES_EGG) {
                coords = &gMonFrontPicCoords[0];
            } else {
                coords = &gMonFrontPicCoords[species];
            }
        }
    }

    switch (a2) {
    case 0:
        return (coords->coords & 0xf) * 8;
    case 1:
        return (coords->coords >> 4) * 8;
    case 4:
        return sub_8077ABC(slot, 2) - ((coords->coords >> 4) * 4);
    case 5:
        return sub_8077ABC(slot, 2) + ((coords->coords >> 4) * 4);
    case 2:
        return sub_8077ABC(slot, 3) - ((coords->coords & 0xf) * 4);
    case 3:
        return sub_8077ABC(slot, 3) + ((coords->coords & 0xf) * 4);
    case 6:
        ret = sub_8077ABC(slot, 1) + 0x1f;
        return ret - coords->y_offset;
    default:
        return 0;
    }
}

void sub_807A3FC(u8 slot, u8 a2, s16 *a3, s16 *a4) {
    u8 v1, v2;
    s16 v3, v4;
    s16 v5, v6;
    if (!a2) {
        v1 = 0;
        v2 = 1;
    } else {
        v1 = 2;
        v2 = 3;
    }
    v3 = sub_8077ABC(slot, v1);
    v4 = sub_8077ABC(slot, v2);
    if (IsDoubleBattle() && !NotInBattle()) {
        v5 = sub_8077ABC(slot ^ 2, v1);
        v6 = sub_8077ABC(slot ^ 2, v2);
    } else {
        v5 = v3;
        v6 = v4;
    }
    *a3 = (v3 + v5) / 2;
    *a4 = (v4 + v6) / 2;
}

u8 sub_807A4A0(int a1, u8 sprite, int a3) {
    u8 new_sprite = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    gSprites[new_sprite] = gSprites[sprite];
    gSprites[new_sprite].usingSheet = 1;
    gSprites[new_sprite].oam.priority = 0;
    gSprites[new_sprite].oam.objMode = 2;
    gSprites[new_sprite].oam.tileNum = gSprites[sprite].oam.tileNum;
    gSprites[new_sprite].callback = SpriteCallbackDummy;
    return new_sprite;
}

void sub_807A544(struct Sprite *sprite) {
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimBankAttacker)) {
        sprite->pos1.x -= gBattleAnimArgs[0];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
        sprite->hFlip = 1;
    } else {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[4];
    sprite->data[5] = gBattleAnimArgs[5];
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078504;
}

void sub_807A5C4(struct Sprite *sprite) {
    if (GetBankSide(gBattleAnimBankAttacker)) {
        sprite->pos1.x -= gBattleAnimArgs[0];
        gBattleAnimArgs[3] *= -1;
    } else {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[4];
    sprite->data[5] = gBattleAnimArgs[5];
    StartSpriteAnim(sprite, gBattleAnimArgs[6]);
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078504;
}

void sub_807A63C(struct Sprite *sprite) {
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimBankAttacker)) {
        sprite->pos1.x -= gBattleAnimArgs[0];
    } else {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_807A69C(u8 taskId) {
    u16 src;
    u16 dest;
    struct Task *task = &gTasks[taskId];
    task->data[0] = GetAnimBankSpriteId(0);
    task->data[1] = (GetBankSide(gBattleAnimBankAttacker)) ? -8 : 8;
    task->data[2] = 0;
    task->data[3] = 0;
    gSprites[task->data[0]].pos2.x -= task->data[0];
    task->data[4] = AllocSpritePalette(10097);
    task->data[5] = 0;

    dest = (task->data[4] + 0x10) * 0x10;
    src = (gSprites[task->data[0]].oam.paletteNum + 0x10) * 0x10;
    task->data[6] = sub_8079E90(gBattleAnimBankAttacker);
    if (task->data[6] == 20 || task->data[6] == 40) {
        task->data[6] = 2;
    } else {
        task->data[6] = 3;
    }
    CpuSet(&gPlttBufferUnfaded[src], &gPlttBufferFaded[dest], 0x04000000 | ((0x20)/(32/8) & 0x1FFFFF));
    BlendPalette(dest, 0x10, gBattleAnimArgs[1], gBattleAnimArgs[0]);
    task->func = sub_807A784;
}

void sub_807A784(u8 taskId) {
    struct Task *task = &gTasks[taskId];
    switch (task->data[2]) {
    case 0:
        sub_807A850(task, taskId);
        gSprites[task->data[0]].pos2.x += task->data[1];
        if (++task->data[3] == 5) {
            task->data[3]--;
            task->data[2]++;
        }
        break;
    case 1:
        sub_807A850(task, taskId);
        gSprites[task->data[0]].pos2.x -= task->data[1];
        if (--task->data[3] == 0) {
            gSprites[task->data[0]].pos2.x = 0;
            task->data[2]++;
        }
        break;
    case 2:
        if (!task->data[5]) {
            FreeSpritePaletteByTag(10097);
            DestroyAnimVisualTask(taskId);
        }
        break;
    }
}

void sub_807A850(struct Task *task, u8 taskId) {
    s16 sprite = duplicate_obj_of_side_rel2move_in_transparent_mode(0);
    if (sprite >= 0) {
        gSprites[sprite].oam.priority = task->data[6];
        gSprites[sprite].oam.paletteNum = task->data[4];
        gSprites[sprite].data[0] = 8;
        gSprites[sprite].data[1] = taskId;
        gSprites[sprite].data[2] = sprite;
        gSprites[sprite].pos2.x = gSprites[task->data[0]].pos2.x;
        gSprites[sprite].callback = sub_807A8D4;
        task->data[5]++;
    }
}

void sub_807A8D4(struct Sprite *sprite) {
    if (--sprite->data[0] == 0) {
        gTasks[sprite->data[1]].data[5]--;
        obj_delete_but_dont_free_vram(sprite);
    }
}

void sub_807A908(struct Sprite *sprite) {
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    if (!GetBankSide(gBattleAnimBankAttacker)) {
        sprite->data[0] = 5;
    } else {
        sprite->data[0] = -10;
    }
    sprite->data[1] = -40;
    sprite->callback = sub_807A960;
}

void sub_807A960(struct Sprite *sprite) {
    sprite->data[2] += sprite->data[0];
    sprite->data[3] += sprite->data[1];
    sprite->pos2.x = sprite->data[2] / 10;
    sprite->pos2.y = sprite->data[3] / 10;
    if (sprite->data[1] < -20) {
        sprite->data[1]++;
    }
    if ((sprite->pos1.y + sprite->pos2.y) < -32) {
        move_anim_8072740(sprite);
    }
}

void sub_807A9BC(struct Sprite *sprite) {
    int x;
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[4];
    sprite->data[4] = sprite->pos1.y + gBattleAnimArgs[5];
    if (!GetBankSide(gBattleAnimBankTarget)) {
        x = (u16)gBattleAnimArgs[4] + 30;
        sprite->pos1.x += x;
        sprite->pos1.y = gBattleAnimArgs[5] - 20;
    } else {
        x = (u16)gBattleAnimArgs[4] - 30;
        sprite->pos1.x += x;
        sprite->pos1.y = gBattleAnimArgs[5] - 80;
    }
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}
