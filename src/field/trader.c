#include "global.h"
#include "decoration.h"
#include "decoration_inventory.h"
#include "event_data.h"
#include "main.h"
#include "mauville_man.h"
#include "menu.h"
#include "menu_helpers.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "task.h"

extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;

static const u8 * const gUnknown_083F62D8[] =
{
    SecretBaseText_Tristan,
    SecretBaseText_Philip,
    SecretBaseText_Dennis,
    SecretBaseText_Roberto,
};

static const u8 gTraderDecorations[] =
{
    DECOR_DUSKULL_DOLL,
    DECOR_BALL_CUSHION,
    DECOR_TIRE,
    DECOR_PRETTY_FLOWERS,
};

void sub_810993C(void)
{
    u8 i, j;
    u8 buffer[12];
    struct MauvilleManTrader *trader = &gSaveBlock1.mauvilleMan.trader;

    for (i = 0; i < 3; i++)
    {
        for (j = i + 1; j < 4; j++)
        {
            if (trader->unk1[i] == 0)
            {
                u8 temp = trader->unk1[i];
                trader->unk1[i] = trader->unk1[j];
                trader->unk1[j] = temp;
                StringCopy(buffer, trader->unk5[i]);
                StringCopy(trader->unk5[i], trader->unk5[j]);
                StringCopy(trader->unk5[j], buffer);
            }
        }
    }
}

void TraderSetup(void)
{
    u8 i;
    struct MauvilleManTrader *trader = &gSaveBlock1.mauvilleMan.trader;

    trader->id = MAUVILLE_MAN_TRADER;
    trader->alreadyTraded = FALSE;

    for (i = 0; i < 4; i++)
    {
        StringCopy(trader->unk5[i], gUnknown_083F62D8[i]);
        trader->unk1[i] = gTraderDecorations[i];
    }

    sub_810993C();
}

void sub_8109A20(void)
{
    struct MauvilleManTrader *trader = &gSaveBlock1.mauvilleMan.trader;
    trader->alreadyTraded = FALSE;
}

void sub_8109A30(u8 value)
{
    VarSet(VAR_RECYCLE_GOODS, value);
}

void CreateAvailableDecorationsMenu(u8 taskId)
{
    u8 i;
    u8 numChoices = 1;
    u8 numDecorations = 0;
    struct MauvilleManTrader *trader = &gSaveBlock1.mauvilleMan.trader;

    for (i = 0; i < 4; i++)
    {
        if (trader->unk1[i])
        {
            numChoices++;
        }
    }

    MenuDrawTextWindow(0, 1, 12, numChoices * 2 + 2);

    for (i = 0; i < 4; i++)
    {
        if (trader->unk1[i])
        {
            if (trader->unk1[i] > DECOR_REGISTEEL_DOLL)
            {
                MenuPrint(gOtherText_FiveQuestionsAndSlash, 2, numDecorations * 2 + 2);
            }
            else
            {
                MenuPrint(gDecorations[trader->unk1[i]].name, 2, numDecorations * 2 + 2);
            }

            numDecorations++;
        }
    }

    MenuPrint(gOtherText_CancelNoTerminator, 2, numDecorations * 2 + 2);
    InitMenu(0, 1, 2, numChoices, 0, 11);
    gTasks[taskId].data[1] = numDecorations;
}

void sub_8109B34(u8 taskId, u8 decorationId)
{
    if (decorationId > DECOR_REGISTEEL_DOLL)
    {
        gSpecialVar_0x8004 = 0xFFFF;
    }
    else
    {
        gSpecialVar_0x8004 = decorationId;
    }

    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 1, 12, 12);
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

void Task_HandleGetDecorationMenuInput(u8 taskId)
{
    struct MauvilleManTrader *trader = &gSaveBlock1.mauvilleMan.trader;

    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        MoveMenuCursor(-1);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        MoveMenuCursor(1);
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        gSpecialVar_0x8005 = GetMenuCursorPos();
        if (gTasks[taskId].data[1] == gSpecialVar_0x8005)
        {
            sub_8109B34(taskId, 0);
        }
        else
        {
            StringCopy(gStringVar1, trader->unk5[gSpecialVar_0x8005]);
            sub_8109B34(taskId, trader->unk1[gSpecialVar_0x8005]);
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        sub_8109B34(taskId, 0);
    }
}

void ScrSpecial_GetTraderTradedFlag(void)
{
    struct MauvilleManTrader *trader = &gSaveBlock1.mauvilleMan.trader;
    gScriptResult = trader->alreadyTraded;
}

void ScrSpecial_DoesPlayerHaveNoDecorations(void)
{
    u8 i;

    for (i = 0; i < 8; i++)
    {
        if (sub_8134194(i))
        {
            gScriptResult = FALSE;
            return;
        }
    }
    gScriptResult = TRUE;
}

void ScrSpecial_IsDecorationFull(void)
{
    gScriptResult = FALSE;
    if (gDecorations[gSpecialVar_0x8004].category != gDecorations[gSpecialVar_0x8006].category
        && sub_8133F9C(gDecorations[gSpecialVar_0x8004].category) == -1)
    {
        sub_80FE7D4(gStringVar2, gDecorations[gSpecialVar_0x8004].category);
        gScriptResult = TRUE;
    }
}

void ScrSpecial_TraderMenuGiveDecoration(void)
{
    CreateTask(sub_80FE7A8, 0);
}

void sub_8109D04(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 29, 19);
    DestroyVerticalScrollIndicator(0);
    DestroyVerticalScrollIndicator(1);
    sub_80F9520(gUnknown_020388F7, 8);
    BuyMenuFreeMemory();
    if (sub_80FEFA4() == TRUE)
    {
        gSpecialVar_0x8006 = gUnknown_020388D0[gUnknown_020388F5];
        StringCopy(gStringVar3, gDecorations[gSpecialVar_0x8004].name);
        StringCopy(gStringVar2, gDecorations[gSpecialVar_0x8006].name);
    }
    else
    {
        gSpecialVar_0x8006 = 0xFFFF;
    }
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

void sub_8109DAC(u8 taskId)
{
    HandleDestroyMenuCursors();
    MenuZeroFillWindowRect(0, 0, 29, 19);
    gSpecialVar_0x8006 = 0;
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

void ScrSpecial_TraderDoDecorationTrade(void)
{
    struct MauvilleManTrader *trader = &gSaveBlock1.mauvilleMan.trader;

    sub_81340A8(gSpecialVar_0x8006);
    IsThereStorageSpaceForDecoration(gSpecialVar_0x8004);
    StringCopy(trader->unk5[gSpecialVar_0x8005], gSaveBlock2.playerName);
    trader->unk1[gSpecialVar_0x8005] = gSpecialVar_0x8006;
    sub_810993C();
    trader->alreadyTraded = TRUE;
}

void ScrSpecial_TraderMenuGetDecoration(void)
{
    u8 taskId = CreateTask(Task_HandleGetDecorationMenuInput, 0);
    CreateAvailableDecorationsMenu(taskId);
}
