#include "global.h"
#include "starter_choose.h"
#include "data2.h"
#include "decompress.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "pokedex.h"
#include "songs.h"
#include "sound.h"
#include "species.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"
#include "trig.h"
#include "unknown_task.h"

extern u16 gScriptResult;
extern struct SpriteTemplate gUnknown_02024E8C;

//--------------------------------------------------
// Graphics Data
//--------------------------------------------------

const u16 gBirchBagGrassPal[2][16] =
{
    INCBIN_U16("graphics/misc/birch_bag.gbapal"),
    INCBIN_U16("graphics/misc/birch_grass.gbapal"),
};
static const u16 gBirchBallarrow_Pal[] = INCBIN_U16("graphics/misc/birch_ballarrow.gbapal");
static const u16 gBirchCircle_Pal[] = INCBIN_U16("graphics/misc/birch_circle.gbapal");
const u8 gBirchBagTilemap[] = INCBIN_U8("graphics/misc/birch_bag_map.bin.lz");
const u8 gBirchGrassTilemap[] = INCBIN_U8("graphics/misc/birch_grass_map.bin.lz");
const u8 gBirchHelpGfx[] = INCBIN_U8("graphics/misc/birch_help.4bpp.lz");
static const u8 gBirchBallarrow_Gfx[] = INCBIN_U8("graphics/misc/birch_ballarrow.4bpp.lz");
static const u8 gBirchCircle_Gfx[] = INCBIN_U8("graphics/misc/birch_circle.4bpp.lz");
static const u8 gStarterChoose_PokeballCoords[][2] =
{
    {60, 64},
    {120, 88},
    {180, 64},
};
static const u8 gStarterChoose_LabelCoords[][2] =
{
    {0, 9},
    {16, 10},
    {8, 4},
};
static const u16 sStarterMons[] = {SPECIES_TREECKO, SPECIES_TORCHIC, SPECIES_MUDKIP};
static const struct OamData gOamData_83F76CC =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_83F76D4 =
{
    .y = 160,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const struct OamData gOamData_83F76DC =
{
    .y = 160,
    .affineMode = 3,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};
static const u8 gUnknown_083F76E4[][2] =
{
    {60, 32},
    {120, 56},
    {180, 32},
    {0, 0},
};
static const union AnimCmd gSpriteAnim_83F76EC[] =
{
    ANIMCMD_FRAME(48, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83F76F4[] =
{
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_END,
};
static const union AnimCmd gSpriteAnim_83F76FC[] =
{
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(16, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(32, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(0, 32),
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(32, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(16, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(32, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_JUMP(0),
};
static const union AnimCmd gSpriteAnim_83F7744[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_END,
};
static const union AnimCmd *const gSpriteAnimTable_83F774C[] =
{
    gSpriteAnim_83F76EC,
};
static const union AnimCmd *const gSpriteAnimTable_83F7750[] =
{
    gSpriteAnim_83F76F4,
    gSpriteAnim_83F76FC,
};
static const union AnimCmd *const gSpriteAnimTable_83F7758[] =
{
    gSpriteAnim_83F7744,
};
static const union AffineAnimCmd gSpriteAffineAnim_83F775C[] =
{
    AFFINEANIMCMD_FRAME(16, 16, 0, 0),
    AFFINEANIMCMD_FRAME(16, 16, 0, 15),
    AFFINEANIMCMD_END,
};
static const union AffineAnimCmd gSpriteAffineAnim_83F7774[] =
{
    AFFINEANIMCMD_FRAME(20, 20, 0, 0),
    AFFINEANIMCMD_FRAME(20, 20, 0, 15),
    AFFINEANIMCMD_END,
};
static const union AffineAnimCmd *const gSpriteAffineAnimTable_83F778C[] =
{
    gSpriteAffineAnim_83F775C,
};
static const union AffineAnimCmd *const gSpriteAffineAnimTable_83F7790[] =
{
    gSpriteAffineAnim_83F7774,
};
static const struct CompressedSpriteSheet gUnknown_083F7794[] =
{
    {gBirchBallarrow_Gfx, 0x0800, 0x1000},
    {NULL},
};
static const struct CompressedSpriteSheet gUnknown_083F77A4[] =
{
    {gBirchCircle_Gfx, 0x0800, 0x1001},
    {NULL},
};
const struct SpritePalette gUnknown_083F77B4[] =
{
    {gBirchBallarrow_Pal, 0x1000},
    {gBirchCircle_Pal, 0x1001},
    {NULL},
};
static void sub_810A62C(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_83F77CC =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83F76CC,
    .anims = gSpriteAnimTable_83F774C,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_810A62C,
};
static void sub_810A68C(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_83F77E4 =
{
    .tileTag = 4096,
    .paletteTag = 4096,
    .oam = &gOamData_83F76D4,
    .anims = gSpriteAnimTable_83F7750,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_810A68C,
};
static void StarterPokemonSpriteAnimCallback(struct Sprite *sprite);
static const struct SpriteTemplate gSpriteTemplate_83F77FC =
{
    .tileTag = 4097,
    .paletteTag = 4097,
    .oam = &gOamData_83F76DC,
    .anims = gSpriteAnimTable_83F7758,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83F7790,
    .callback = StarterPokemonSpriteAnimCallback,
};

static void MainCallback2(void);
static void Task_StarterChoose1(u8 taskId);
static void Task_StarterChoose2(u8 taskId);
static void Task_StarterChoose3(u8 taskId);
static void Task_StarterChoose4(u8 taskId);
static void Task_StarterChoose5(u8 taskId);
static void Task_StarterChoose6(u8 taskId);

static void CreateStarterPokemonLabel(u8, u8);
static u8 CreatePokemonFrontSprite(u16, u8, u8);

//Position of the sprite of the selected starter Pokemon
#define STARTER_PKMN_POS_X 120
#define STARTER_PKMN_POS_Y 64

//Retrieves one of the available starter Pokemon
u16 GetStarterPokemon(u16 n)
{
    if (n > 3)
        n = 0;
    return sStarterMons[n];
}

static void VblankCallback(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

#define tStarterSelection data[0]
#define tPkmnSpriteId data[1]
#define tCircleSpriteId data[2]

void CB2_ChooseStarter(void)
{
    u16 savedIme;
    u8 taskId;
    u8 spriteId;

    SetVBlankCallback(NULL);

    REG_DISPCNT = 0;
    REG_BG3CNT = 0;
    REG_BG2CNT = 0;
    REG_BG1CNT = 0;
    REG_BG0CNT = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;

    DmaFill16(3, 0, VRAM, VRAM_SIZE);
    DmaFill32(3, 0, OAM, OAM_SIZE);
    DmaFill16(3, 0, PLTT, PLTT_SIZE);

    LZ77UnCompVram(&gBirchHelpGfx, (void *)VRAM);
    LZ77UnCompVram(&gBirchBagTilemap, (void *)(VRAM + 0x3000));
    LZ77UnCompVram(&gBirchGrassTilemap, (void *)(VRAM + 0x3800));
    remove_some_task();
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade();
    FreeAllSpritePalettes();
    LoadPalette(gBirchBagGrassPal, 0, sizeof(gBirchBagGrassPal));
    LoadCompressedObjectPic(&gUnknown_083F7794[0]);
    LoadCompressedObjectPic(&gUnknown_083F77A4[0]);
    LoadSpritePalettes(gUnknown_083F77B4);
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);

    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;

    SetVBlankCallback(VblankCallback);
    SetMainCallback2(MainCallback2);

    REG_WININ = 0x3F;
    REG_WINOUT = 0x1F;
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_BLDCNT = 0xFE;
    REG_BLDALPHA = 0;
    REG_BLDY = 0x7;
    REG_BG3CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(7)  | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BG2CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(6)  | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_BG0CNT = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(31) | BGCNT_16COLOR | BGCNT_TXT256x256;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG2_ON | DISPCNT_BG3_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON;

    taskId = CreateTask(Task_StarterChoose1, 0);
    gTasks[taskId].tStarterSelection = 1;

    //Create hand sprite
    spriteId = CreateSprite(&gSpriteTemplate_83F77CC, 120, 56, 2);
    gSprites[spriteId].data[0] = taskId;

    //Create three Pokeball sprites
    spriteId = CreateSprite(
      &gSpriteTemplate_83F77E4,
      gStarterChoose_PokeballCoords[0][0], gStarterChoose_PokeballCoords[0][1], 2);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = 0;
    spriteId = CreateSprite(
      &gSpriteTemplate_83F77E4,
      gStarterChoose_PokeballCoords[1][0], gStarterChoose_PokeballCoords[1][1], 2);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = 1;
    spriteId = CreateSprite(
      &gSpriteTemplate_83F77E4,
      gStarterChoose_PokeballCoords[2][0], gStarterChoose_PokeballCoords[2][1], 2);
    gSprites[spriteId].data[0] = taskId;
    gSprites[spriteId].data[1] = 2;
}

static void MainCallback2(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void Task_StarterChoose1(u8 taskId)
{
    CreateStarterPokemonLabel(0xFF, gTasks[taskId].tStarterSelection);
    MenuDrawTextWindow(2, 14, 27, 19);
    MenuPrint(gOtherText_BirchInTrouble, 3, 15);
    gTasks[taskId].func = Task_StarterChoose2;
}

static void Task_StarterChoose2(u8 taskId)
{
    u8 selection = gTasks[taskId].tStarterSelection;

    if (gMain.newKeys & A_BUTTON)
    {
        u8 spriteId;

        MenuZeroFillWindowRect(
          gStarterChoose_LabelCoords[selection][0],
          gStarterChoose_LabelCoords[selection][1],
          gStarterChoose_LabelCoords[selection][0] + 13,
          gStarterChoose_LabelCoords[selection][1] + 3);

        REG_WIN0H = 0;
        REG_WIN0V = 0;

        //Create white circle background
        spriteId = CreateSprite(
          &gSpriteTemplate_83F77FC,
          gStarterChoose_PokeballCoords[selection][0],
          gStarterChoose_PokeballCoords[selection][1],
          1);
        gTasks[taskId].tCircleSpriteId = spriteId;

        //Create Pokemon sprite
        spriteId = CreatePokemonFrontSprite(
          GetStarterPokemon(gTasks[taskId].tStarterSelection),
          gStarterChoose_PokeballCoords[selection][0],
          gStarterChoose_PokeballCoords[selection][1]);
        gSprites[spriteId].affineAnims = gSpriteAffineAnimTable_83F778C;
        gSprites[spriteId].callback = StarterPokemonSpriteAnimCallback;
        gTasks[taskId].tPkmnSpriteId = spriteId;

        gTasks[taskId].func = Task_StarterChoose3;
    }
    else
    {
        if ((gMain.newKeys & DPAD_LEFT) && selection > 0)
        {
            gTasks[taskId].tStarterSelection--;
            CreateStarterPokemonLabel(selection, gTasks[taskId].tStarterSelection);
        }
        else if ((gMain.newKeys & DPAD_RIGHT) && selection < 2)
        {
            gTasks[taskId].tStarterSelection++;
            CreateStarterPokemonLabel(selection, gTasks[taskId].tStarterSelection);
        }
    }
}

static void Task_StarterChoose3(u8 taskId)
{
    if (gSprites[gTasks[taskId].tCircleSpriteId].affineAnimEnded &&
      gSprites[gTasks[taskId].tCircleSpriteId].pos1.x == STARTER_PKMN_POS_X &&
      gSprites[gTasks[taskId].tCircleSpriteId].pos1.y == STARTER_PKMN_POS_Y)
    {
        gTasks[taskId].func = Task_StarterChoose4;
    }
}

static void Task_StarterChoose4(u8 taskId)
{
    PlayCry1(GetStarterPokemon(gTasks[taskId].tStarterSelection), 0);
    MenuDrawTextWindow(2, 14, 27, 19);
    //"Do you choose this POKEMON?"
    MenuPrint(gOtherText_DoYouChoosePoke, 3, 15);
    DisplayYesNoMenu(21, 7, 1);
    gTasks[taskId].func = Task_StarterChoose5;
}

static void Task_StarterChoose5(u8 taskId)
{
    u8 spriteId;

    switch (ProcessMenuInputNoWrap_())
    {
    case 0:  // YES
        //Return the starter choice and exit.
        gScriptResult = gTasks[taskId].tStarterSelection;
        SetMainCallback2(gMain.savedCallback);
        break;
    case 1:  // NO
    case -1: // B button
        PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(21, 7, 28, 12);

        spriteId = gTasks[taskId].tPkmnSpriteId;
        FreeSpritePaletteByTag(GetSpritePaletteTagByPaletteNum(gSprites[spriteId].oam.paletteNum));
        FreeOamMatrix(gSprites[spriteId].oam.matrixNum);
        DestroySprite(&gSprites[spriteId]);

        spriteId = gTasks[taskId].tCircleSpriteId;
        FreeOamMatrix(gSprites[spriteId].oam.matrixNum);
        DestroySprite(&gSprites[spriteId]);
        gTasks[taskId].func = Task_StarterChoose6;
        break;
    }
}

static void Task_StarterChoose6(u8 taskId)
{
    gTasks[taskId].func = Task_StarterChoose1;
}

void AddTextColorCtrlCode(u8 *string, u8 bgColor, u8 textColor, u8 shadowColor)
{
    *(string++) = EXT_CTRL_CODE_BEGIN;
    *(string++) = 4;
    *(string++) = textColor;
    *(string++) = bgColor;
    *(string++) = shadowColor;
}

#define SET_CHAR(str, index, c) \
{                               \
    u8 *p = str + index;        \
    *p = c;                     \
}


static void CreateStarterPokemonLabel(u8 prevSelection, u8 selection)
{
    u8 labelText[72];
    const u8 *category;
    u8 srcIndex;
    u8 dstIndex;
    u16 species;

    u8 labelLeft;
    u8 labelRight;
    u8 labelTop;
    u8 labelBottom;

    if (prevSelection != 0xFF)
    {
        //Remove the old Pokemon label
        MenuZeroFillWindowRect(
          gStarterChoose_LabelCoords[prevSelection][0],
          gStarterChoose_LabelCoords[prevSelection][1],
          gStarterChoose_LabelCoords[prevSelection][0] + 13,
          gStarterChoose_LabelCoords[prevSelection][1] + 3);
        REG_WIN0H = 0;
        REG_WIN0V = 0;
    }
    species = GetStarterPokemon(selection);
    category = GetPokemonCategory(SpeciesToNationalPokedexNum(species));
    AddTextColorCtrlCode(labelText, 0, 15, 8);
    dstIndex = 5;
    SET_CHAR(labelText, 5, EXT_CTRL_CODE_BEGIN);
    SET_CHAR(labelText, 6, 0x11);
    SET_CHAR(labelText, 7, dstIndex);

    //Copy category string to label
    dstIndex = 8;
    srcIndex = 0;
    while (category[srcIndex] != EOS && srcIndex <= 10)
    {
        labelText[dstIndex] = category[srcIndex];
        srcIndex++;
        dstIndex++;
    }

    //Copy POKEMON string to label
    StringCopy(labelText + dstIndex, gOtherText_Poke);
    MenuPrint(
      labelText,
      gStarterChoose_LabelCoords[selection][0],
      gStarterChoose_LabelCoords[selection][1]);
    AddTextColorCtrlCode(labelText, 0, 15, 8);

    //Copy Pokemon name to label
    sub_8072C74(labelText + 5, gSpeciesNames[species], 0x6B, 1);
    MenuPrint(
      labelText,
      gStarterChoose_LabelCoords[selection][0],
      gStarterChoose_LabelCoords[selection][1] + 2);

    labelLeft = gStarterChoose_LabelCoords[selection][0] * 8 + 4;
    labelRight = (gStarterChoose_LabelCoords[selection][0] + 13) * 8 + 4;
    labelTop = gStarterChoose_LabelCoords[selection][1] * 8;
    labelBottom = (gStarterChoose_LabelCoords[selection][1] + 4) * 8;
    REG_WIN0H = WIN_RANGE(labelLeft, labelRight);
    REG_WIN0V = WIN_RANGE(labelTop, labelBottom);
}

static void nullsub_72(struct Sprite *sprite)
{
}

static u8 CreatePokemonFrontSprite(u16 species, u8 x, u8 y)
{
    u8 spriteId;

    DecompressPicFromTable_2(
      &gMonFrontPicTable[species],
      gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset,
      gUnknown_081FAF4C[0], gUnknown_081FAF4C[1],
      species);
    LoadCompressedObjectPalette(&gMonPaletteTable[species]);
    GetMonSpriteTemplate_803C56C(species, 1);
    spriteId = CreateSprite(&gUnknown_02024E8C, x, y, 0);
    gSprites[spriteId].callback = nullsub_72;
    gSprites[spriteId].oam.priority = 0;
    return spriteId;
}

//Sprite callback
static void sub_810A62C(struct Sprite *sprite)
{
    sprite->pos1.x = gUnknown_083F76E4[gTasks[sprite->data[0]].tStarterSelection][0];
    sprite->pos1.y = gUnknown_083F76E4[gTasks[sprite->data[0]].tStarterSelection][1];
    sprite->pos2.y = Sin(sprite->data[1], 8);
    sprite->data[1] = (u8)sprite->data[1] + 4;
}

//Sprite callback
static void sub_810A68C(struct Sprite *sprite)
{
    if (gTasks[sprite->data[0]].tStarterSelection == sprite->data[1])
        StartSpriteAnimIfDifferent(sprite, 1);
    else
        StartSpriteAnimIfDifferent(sprite, 0);
}

//Sprite callback
static void StarterPokemonSpriteAnimCallback(struct Sprite *sprite)
{
    //Move sprite to upper center of screen
    if (sprite->pos1.x > STARTER_PKMN_POS_X)
        sprite->pos1.x -= 4;
    if (sprite->pos1.x < STARTER_PKMN_POS_X)
        sprite->pos1.x += 4;
    if (sprite->pos1.y > STARTER_PKMN_POS_Y)
        sprite->pos1.y -= 2;
    if (sprite->pos1.y < STARTER_PKMN_POS_Y)
        sprite->pos1.y += 2;
}
