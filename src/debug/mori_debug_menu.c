#include "global.h"
#include "mori_debug_menu.h"
#include "data2.h"
#include "daycare.h"
#include "learn_move.h"
#include "link.h"
#include "main.h"
#include "menu.h"
#include "pokeblock.h"
#include "start_menu.h"
#include "string_util.h"

#define SIO_MULTI_CNT ((struct SioMultiCnt *)REG_ADDR_SIOCNT)

extern u8 (*gCallback_03004AE8)(void);

u8 gUnknown_03004DA0[0x20];

const u8 gUnknown_0839B22C[][3] =
{
	_(" A"),
	_(" B"),
	_("SL"),
	_("ST"),
	_("RK"),
	_("LK"),
	_("UK"),
	_("DK"),
	_("RT"),
	_("LT"),
};

const u8 gUnknown_0839B24A[] = _("ND");
const u8 gUnknown_0839B24D[] = _("の　こどもは\n"); // "'s child <topic-particle>"=
const u8 gUnknown_0839B255[] = _(" ");
const u8 gUnknown_0839B257[] = _("ながいなまえぽけもん"); // "long name pokemon" (used as test name)
const u8 Text_39B262[] = _("이것을 서치");
const u8 Text_39B271[] = _("알");
const u8 Text_39B275[] = _("수컷 알");
const u8 Text_39B280[] = _("1000보");
const u8 Text_39B28B[] = _("10000보");
const u8 Text_39B297[] = _("기술 매니아");
const u8 Text_39B2A2[] = _("알 부화");
const u8 Text_39B2AF[] = _("롱 네임");
const u8 Text_39B2B9[] = _("ポロックけす");

const struct MenuAction gMoriDebugMenuActions[] =
{
    {Text_39B262, (u8 (*) (void))MoriDebugMenu_SearchChild}, // ugly cast needed to stop complaints of u8 (*func)() not being compatible with this declaration (TODO: Make MenuAction a Callback union to allow a new definition.)
    {Text_39B271, MoriDebugMenu_Egg},
    {Text_39B275, MoriDebugMenu_MaleEgg},
    {Text_39B280, MoriDebugMenu_1000Steps},
    {Text_39B28B, MoriDebugMenu_10000Steps},
    {Text_39B297, MoriDebugMenu_MoveTutor},
    {Text_39B2A2, MoriDebugMenu_BreedEgg},
    {Text_39B2AF, MoriDebugMenu_LongName},
    {Text_39B2B9, MoriDebugMenu_PokeblockCase},
};

void unref_sub_8083CF0(void)
{
    int i;
    int id = SIO_MULTI_CNT->id;
    gUnknown_03004DA0[0] = EOS;
    StringAppend(gUnknown_03004DA0, gUnknown_0839B24A);
    for (i = 0; i < 10; i++)
        if ((word_3002910[id ^ 1] >> i) & 1)
            StringAppend(gUnknown_03004DA0, gUnknown_0839B22C[i]);
}

bool8 sub_8083D4C(void)
{
     if ( gMain.newKeys & A_BUTTON )
    {
        CloseMenu();
        return TRUE;
    }
    else
        return FALSE;
}

u8 MoriDebugMenu_SearchChild(u8 a1, u8 a2, u8 *ptr)
{
    u8 localPtr[52];
    u16 monData;
    u16 eggSpecies;

    monData = GetMonData(gPlayerParty, MON_DATA_SPECIES, ptr);
    eggSpecies = GetEggSpecies(monData);
    StringCopy(localPtr, gSpeciesNames[monData]);
    StringAppend(localPtr, gUnknown_0839B24D);
    StringAppend(localPtr, gSpeciesNames[eggSpecies]);
    StringAppend(localPtr, gUnknown_0839B255);
    MenuZeroFillScreen();
    MenuDrawTextWindow(0, 14, 30, 19);
    MenuPrint(localPtr, 1, 15);
    gCallback_03004AE8 = sub_8083D4C;
    return 0;
}

u8 MoriDebugMenu_Egg(void)
{
    if (CountPokemonInDaycare(&gSaveBlock1.daycare) == 2 && GetDaycareCompatibilityScoreFromSave() )
        TriggerPendingDaycareEgg();
    CloseMenu();

    return 1;
}

u8 MoriDebugMenu_MaleEgg(void)
{
    if (CountPokemonInDaycare(&gSaveBlock1.daycare) == 2 && GetDaycareCompatibilityScoreFromSave() )
        TriggerPendingDaycareMaleEgg();
    CloseMenu();

    return 1;
}

u8 MoriDebugMenu_1000Steps(void)
{
    Debug_AddDaycareSteps(1000);
    CloseMenu();
    return 1;
}

u8 MoriDebugMenu_10000Steps(void)
{
    Debug_AddDaycareSteps(10000);
    CloseMenu();
    return 1;
}

u8 MoriDebugMenu_MoveTutor(void)
{
    sub_8132670();
    CloseMenu();
    return 1;
}

u8 MoriDebugMenu_BreedEgg(void)
{
    u8 loopCounter;

    for (loopCounter = 0; loopCounter <= 5; loopCounter++)
    {
        //UB: Too few arguments for function 'GetMonData'
        if ( GetMonData(&gPlayerParty[loopCounter], MON_DATA_IS_EGG) )
        {
            u8 friendship = 0;
            SetMonData(&gPlayerParty[loopCounter], MON_DATA_FRIENDSHIP, &friendship);
        }
    }
    gSaveBlock1.daycare.misc.countersEtc.eggCycleStepsRemaining = -3;
    CloseMenu();
    return 1;
}

u8 MoriDebugMenu_LongName(void)
{
    SetMonData(gPlayerParty, MON_DATA_NICKNAME, gUnknown_0839B257);
    CloseMenu();
    return 1;
}

u8 MoriDebugMenu_PokeblockCase(void)
{
    s32 loopCounter;

    for (loopCounter = 0; loopCounter <= 39; loopCounter++)
        PokeblockClearIfExists(loopCounter);

    CloseMenu();
    return 1;
}

bool8 MoriDebugMenuProcessInput(void)
{
    s8 choice = ProcessMenuInput();

    switch (choice)
    {
    default:
        gCallback_03004AE8 = gMoriDebugMenuActions[choice].func;
        return FALSE;
    case -2:
        return FALSE;
    case -1:
        CloseMenu();
        return TRUE;
    }
}

s8 InitMoriDebugMenu(void)
{
    MenuZeroFillScreen();
    MenuDrawTextWindow(0, 0, 10, 19);
    PrintMenuItems(1, 1, 9, gMoriDebugMenuActions);
    InitMenu(0, 1, 1, 9, 0, 9);
    gCallback_03004AE8 = MoriDebugMenuProcessInput;
    return 0;
}
