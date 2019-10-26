#include "global.h"
#include "fldeff_softboiled.h"
#include "menu.h"
#include "party_menu.h"
#include "pokemon.h"
#include "pokemon_menu.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "strings.h"
#include "task.h"
#include "ewram.h"

struct Struct2001000 {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 filler3[9];
    void *unkC;
};

struct Struct201C000 {
    struct Pokemon *unk0;
    u8 filler4[1];
    u8 unk5;
    u16 unk6;
    u8 filler8[4];
    s32 unkC;
    void* unk10;
    u8 filler14[26];
    s16 unk2E;
};

#define WINDOW_LEFT 3
#define WINDOW_RIGHT 26

// extern
extern u8 gUnknown_0202E8F6;
extern u8 gLastFieldPokeMenuOpened;
extern u8 gUnknown_0202E8F4;

// Static
static void sub_8133D50(u8 taskId);
static void sub_8133E74(u8 taskId);
static void sub_8133EB8(u8 taskId);
static void sub_8133EF8(void);

bool8 SetUpFieldMove_SoftBoiled(void) {
    u16 maxHp;
    u16 hp;
    u16 minHp;

    maxHp = GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_MAX_HP);
    hp = GetMonData(&gPlayerParty[gLastFieldPokeMenuOpened], MON_DATA_HP);

    minHp = (maxHp / 5);
    if (hp >= minHp)
    {
        return TRUE;
    }

    return FALSE;
}

void sub_8133D28(u8 taskid) {
    EWRAM_1000.unkC = sub_8133D50;
    EWRAM_1B000_2.unk272 = 3;
    DoPokemonMenu_Switch(taskid);
}

static void sub_8133D50(u8 taskId) {
    u8 unk1, unk2;
    u16 hp;
    struct Pokemon *pokemon;
    //struct Task *task;

    struct Sprite *sprites = gSprites;


    unk1 = sprites[EWRAM_1000.unk1].data[0];
    unk2 = sprites[EWRAM_1000.unk2].data[0];

    if (unk1 > 5 || unk2 > 5)
    {
        sub_806CD44(taskId);
        return;
    }

    EWRAM_1C000.unk0 = &gPlayerParty[sprites[EWRAM_1000.unk2].data[0]];
    hp = GetMonData(EWRAM_1C000.unk0, MON_DATA_HP);

    if (hp == 0 || unk1 == unk2 || GetMonData(EWRAM_1C000.unk0, MON_DATA_MAX_HP) == hp)
    {
        sub_8133EB8(taskId);
        return;
    }

    PlaySE(SE_KAIFUKU);

    EWRAM_1C000.unk5 = gSprites[EWRAM_1000.unk1].data[0];

    pokemon = &gPlayerParty[EWRAM_1C000.unk5];
    EWRAM_1C000.unk0 = pokemon;
    EWRAM_1C000.unk6 = 0;
    EWRAM_1C000.unkC = -0x8000;
    EWRAM_1C000.unk10 = sub_8133EF8;


    gTasks[taskId].data[10] = GetMonData(EWRAM_1C000.unk0, MON_DATA_MAX_HP);
    gTasks[taskId].data[11] = GetMonData(EWRAM_1C000.unk0, MON_DATA_HP);
    gTasks[taskId].data[12] = gTasks[taskId].data[10] / 5;

    sub_806D5A4();
    gTasks[taskId].func = sub_806FA18;
    EWRAM_1B000_2.unk282 = gTasks[taskId].data[11];
}

static void sub_8133E74(u8 taskId) {
    if (gUnknown_0202E8F6)
    {
        return;
    }

    MenuZeroFillWindowRect(WINDOW_LEFT, 14, WINDOW_RIGHT, 19);
    PrintPartyMenuPromptText(3, 0);
    gTasks[taskId].func = HandlePartyMenuSwitchPokemonInput;
}

static void sub_8133EB8(u8 taskId) {
    gUnknown_0202E8F4 = 0;
    sub_806D5A4();
    sub_806E834(gOtherText_CantUseOnPoke, 1);
    gTasks[taskId].func = sub_8133E74;
}

static void sub_8133EF8(void) {
    sub_806CCE4();
    EWRAM_1B000_2.unk261 = 2;
    DestroySprite(&gSprites[EWRAM_1000.unk1]);
    MenuZeroFillWindowRect(WINDOW_LEFT, 14, WINDOW_RIGHT, 19);
    PrintPartyMenuPromptText(0, 0);
    SwitchTaskToFollowupFunc(EWRAM_1000.unk0);
}
