#include "global.h"
#include "battle.h"
#include "link.h"
#include "text.h"
#include "ewram.h"

extern u16 gBattleTypeFlags;
extern u8 gBattleOutcome;

extern struct Window gUnknown_03004210;

extern u8 BattleText_Win[];
extern u8 BattleText_Loss[];
extern u8 BattleText_Tie[];

#define LEFT_MESSAGE_X 6
#define RIGHT_MESSAGE_X 21
#define TILE_OFFSET_LOSS 168
#define TILE_OFFSET_WIN 160
#define CENTER_MESSAGE_X 13
#define MESSAGE_Y 2

#define PRINT_MESSAGE(text, tileDataStartOffset, x)                             \
{                                                                               \
    InitWindow(&gUnknown_03004210, text, tileDataStartOffset, x, MESSAGE_Y);    \
    sub_8002F44(&gUnknown_03004210);                                            \
}

#define PRINT_MESSAGE_LEFT(text, tileDataStartOffset)       PRINT_MESSAGE(text, tileDataStartOffset, LEFT_MESSAGE_X)
#define PRINT_MESSAGE_RIGHT(text, tileDataStartOffset)      PRINT_MESSAGE(text, tileDataStartOffset, RIGHT_MESSAGE_X)

void PrintLinkBattleWinLossTie(void)
{

    if (gBattleOutcome == 3)
    {
        PRINT_MESSAGE(BattleText_Tie, TILE_OFFSET_WIN, CENTER_MESSAGE_X);
        return;
    }

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        // Double battle?

        if (gBattleOutcome == 1)
        {

            // lp_field_18 = player position?
            switch (gLinkPlayers[BATTLE_STRUCT->linkPlayerIndex].lp_field_18)
            {
            case 0:
            case 2:
                PRINT_MESSAGE_LEFT(BattleText_Win, TILE_OFFSET_WIN);
                PRINT_MESSAGE_RIGHT(BattleText_Loss, TILE_OFFSET_LOSS);
                return;

            case 1:
            case 3:
                PRINT_MESSAGE_RIGHT(BattleText_Win, TILE_OFFSET_WIN)
                PRINT_MESSAGE_LEFT(BattleText_Loss, TILE_OFFSET_LOSS)
                return;
            }
        }
        else
        {

            switch (gLinkPlayers[BATTLE_STRUCT->linkPlayerIndex].lp_field_18)
            {
            case 1:
            case 3:
                PRINT_MESSAGE_LEFT(BattleText_Win, TILE_OFFSET_WIN);
                PRINT_MESSAGE_RIGHT(BattleText_Loss, TILE_OFFSET_LOSS);
                return;

            case 0:
            case 2:
                PRINT_MESSAGE_RIGHT(BattleText_Win, TILE_OFFSET_WIN);
                PRINT_MESSAGE_LEFT(BattleText_Loss, TILE_OFFSET_LOSS);
                return;
            }
        }

        return;
    }


    if (gBattleOutcome == 1)
    {
        if (gLinkPlayers[BATTLE_STRUCT->linkPlayerIndex].lp_field_18 != 0)
        {
            PRINT_MESSAGE_RIGHT(BattleText_Win, TILE_OFFSET_WIN);
            PRINT_MESSAGE_LEFT(BattleText_Loss, TILE_OFFSET_LOSS);
        }
        else
        {
            PRINT_MESSAGE_LEFT(BattleText_Win, TILE_OFFSET_WIN);
            PRINT_MESSAGE_RIGHT(BattleText_Loss, TILE_OFFSET_LOSS);
        }
    }
    else
    {
        if (gLinkPlayers[BATTLE_STRUCT->linkPlayerIndex].lp_field_18 != 0)
        {
            PRINT_MESSAGE_LEFT(BattleText_Win, TILE_OFFSET_WIN);
            PRINT_MESSAGE_RIGHT(BattleText_Loss, TILE_OFFSET_LOSS);
        }
        else
        {
            PRINT_MESSAGE_RIGHT(BattleText_Win, TILE_OFFSET_WIN);
            PRINT_MESSAGE_LEFT(BattleText_Loss, TILE_OFFSET_LOSS);
        }
    }
}
