#include "global.h"
#include "battle.h"
#include "battle_interface.h"
#include "battle_message.h"
#include "data2.h"
#include "link.h"
#include "main.h"
#include "menu_cursor.h"
#include "palette.h"
#include "pokemon.h"
#include "rom3.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "item_use.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "util.h"
#include "ewram.h"

//Possibly PokemonSubstruct1
struct UnknownStruct3
{
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;
};

extern u8 gActiveBank;
extern void (*gBattleBankFunc[])(void);
extern u32 gBattleExecBuffer;
extern u8 gBattleBufferA[][0x200];
extern u8 gObjectBankIDs[];
extern MainCallback gPreBattleCallback1;
extern bool8 gDoingBattleAnim;
extern u16 gBattlePartyID[];
extern u8 gHealthboxIDs[];
extern u16 gBattleTypeFlags;
extern u16 gMovePowerMoveAnim;
extern u32 gMoveDmgMoveAnim;
extern u8 gHappinessMoveAnim;
extern u16 gWeatherMoveAnim;
extern u32 *gDisableStructMoveAnim;
extern u32 gPID_perBank[];
extern void (*gAnimScriptCallback)(void);
extern bool8 gAnimScriptActive;
extern u8 gDisplayedStringBattle[];
extern u8 gBankInMenu;
extern u8 gBattleMonForms[];
extern u8 gBattleOutcome;
extern u16 gUnknown_02024DE8;
extern u8 gUnknown_02024E68[];
extern struct SpriteTemplate gUnknown_02024E8C;
extern u8 gUnknown_0202F7C4;
extern struct Window gUnknown_03004210;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;
extern u8 gUnknown_0300434C[];
extern const u8 BattleText_WallyMenu[];
extern const u8 BattleText_MenuOptions[];

// TODO: include rom3.h when my other PR gets merged
extern void Emitcmd33(u8, u8, u16);
extern void Emitcmd35(u8, u16);

extern void nullsub_14(void);
extern void PrepareBagForWallyTutorial(void);
extern void sub_8141828();
extern void sub_8045A5C();
extern void sub_804777C();
extern void sub_8043DFC();
extern bool8 IsDoubleBattle(void);
extern void c3_0802FDF4(u8);
extern void PlayerHandlecmd1(void);
extern void LoadPlayerTrainerBankSprite();
extern u8 GetBankIdentity(u8);
extern void sub_80313A0(struct Sprite *);
extern u8 GetBankByPlayerAI(u8);
extern u8 sub_8031720();
extern void ExecuteMoveAnim();
extern void sub_80326EC();
extern void sub_8031F24(void);
extern void sub_80324BC();
extern void BufferStringBattle();
extern u8 GetBankSide(u8);
extern void sub_80304A8(void);
extern void sub_8047858();
extern void sub_80E43C0();
extern void oamt_add_pos2_onto_pos1();
extern void sub_8078B34(struct Sprite *);
extern void sub_8030E38(struct Sprite *);
extern void StoreSpriteCallbackInData();
extern u8 sub_8046400();
extern u8 sub_8077ABC();
extern u8 sub_8077F68();
extern u8 sub_8079E90();
extern void sub_80312F0(struct Sprite *);
extern bool8 move_anim_start_t3();

// this file's functions

void WallyBufferRunCommand(void);
void sub_81374FC(void);
void sub_81376B8(void);
void WallyBufferExecCompleted(void);
u32 sub_8137A84(u8, u8 *);
void sub_8138294(u8);
void sub_81390D0(void);
void sub_8139A2C(u8);

void WallyHandleGetAttributes(void);
void WallyHandlecmd1(void);
void WallyHandleSetAttributes(void);
void WallyHandlecmd3(void);
void WallyHandleLoadPokeSprite(void);
void WallyHandleSendOutPoke(void);
void WallyHandleReturnPokeToBall(void);
void WallyHandleTrainerThrow(void);
void WallyHandleTrainerSlide(void);
void WallyHandleTrainerSlideBack(void);
void WallyHandlecmd10(void);
void WallyHandlecmd11(void);
void WallyHandlecmd12(void);
void WallyHandleBallThrow(void);
void WallyHandlePuase(void);
void WallyHandleMoveAnimation(void);
void WallyHandlePrintString(void);
void WallyHandlePrintStringPlayerOnly(void);
void WallyHandlecmd18(void);
void WallyHandlecmd19(void);
void WallyHandlecmd20(void);
void WallyHandleOpenBag(void);
void WallyHandlecmd22(void);
void WallyHandlecmd23(void);
void WallyHandleHealthBarUpdate(void);
void WallyHandleExpBarUpdate(void);
void WallyHandleStatusIconUpdate(void);
void WallyHandleStatusAnimation(void);
void WallyHandleStatusXor(void);
void WallyHandlecmd29(void);
void WallyHandleDMATransfer(void);
void WallyHandlecmd31(void);
void WallyHandlecmd32(void);
void WallyHandlecmd33(void);
void WallyHandlecmd34(void);
void WallyHandlecmd35(void);
void WallyHandlecmd36(void);
void WallyHandlecmd37(void);
void WallyHandlecmd38(void);
void WallyHandlecmd39(void);
void WallyHandlecmd40(void);
void WallyHandleHitAnimation(void);
void WallyHandlecmd42(void);
void WallyHandleEffectivenessSound(void);
void WallyHandlecmd44(void);
void WallyHandleFaintingCry(void);
void WallyHandleIntroSlide(void);
void WallyHandleTrainerBallThrow(void);
void WallyHandlecmd48(void);
void WallyHandlecmd49(void);
void WallyHandlecmd50(void);
void WallyHandleSpriteInvisibility(void);
void WallyHandleBattleAnimation(void);
void WallyHandleLinkStandbyMsg(void);
void WallyHandleResetActionMoveSelection(void);
void WallyHandlecmd55(void);
void WallyHandlecmd56(void);

// const data

typedef void (*BattleBufferCmd) (void);
static const BattleBufferCmd gWallyBufferCommands[] =
{
    WallyHandleGetAttributes,
    WallyHandlecmd1,
    WallyHandleSetAttributes,
    WallyHandlecmd3,
    WallyHandleLoadPokeSprite,
    WallyHandleSendOutPoke,
    WallyHandleReturnPokeToBall,
    WallyHandleTrainerThrow,
    WallyHandleTrainerSlide,
    WallyHandleTrainerSlideBack,
    WallyHandlecmd10,
    WallyHandlecmd11,
    WallyHandlecmd12,
    WallyHandleBallThrow,
    WallyHandlePuase,
    WallyHandleMoveAnimation,
    WallyHandlePrintString,
    WallyHandlePrintStringPlayerOnly,
    WallyHandlecmd18,
    WallyHandlecmd19,
    WallyHandlecmd20,
    WallyHandleOpenBag,
    WallyHandlecmd22,
    WallyHandlecmd23,
    WallyHandleHealthBarUpdate,
    WallyHandleExpBarUpdate,
    WallyHandleStatusIconUpdate,
    WallyHandleStatusAnimation,
    WallyHandleStatusXor,
    WallyHandlecmd29,
    WallyHandleDMATransfer,
    WallyHandlecmd31,
    WallyHandlecmd32,
    WallyHandlecmd33,
    WallyHandlecmd34,
    WallyHandlecmd35,
    WallyHandlecmd36,
    WallyHandlecmd37,
    WallyHandlecmd38,
    WallyHandlecmd39,
    WallyHandlecmd40,
    WallyHandleHitAnimation,
    WallyHandlecmd42,
    WallyHandleEffectivenessSound,
    WallyHandlecmd44,
    WallyHandleFaintingCry,
    WallyHandleIntroSlide,
    WallyHandleTrainerBallThrow,
    WallyHandlecmd48,
    WallyHandlecmd49,
    WallyHandlecmd50,
    WallyHandleSpriteInvisibility,
    WallyHandleBattleAnimation,
    WallyHandleLinkStandbyMsg,
    WallyHandleResetActionMoveSelection,
    WallyHandlecmd55,
    WallyHandlecmd56,
};

// code

void unref_sub_8137220(void)
{
}

void SetBankFuncToWallyBufferRunCommand(void)
{
    gBattleBankFunc[gActiveBank] = WallyBufferRunCommand;
    ewram160A8 = 0;
    ewram160A9 = 0;
    ewram160AA = 0;
    ewram160AB = 0;
}

void WallyBufferRunCommand(void)
{
    if (gBattleExecBuffer & gBitTable[gActiveBank])
    {
        if (gBattleBufferA[gActiveBank][0] < 0x39)
            gWallyBufferCommands[gBattleBufferA[gActiveBank][0]]();
        else
            WallyBufferExecCompleted();
    }
}

void sub_81372BC(void)
{
    u8 r4;

    switch (ewram160A8)
    {
    case 0:
        ewram160AA = 64;
        ewram160A8++;
        // fall through
    case 1:
        r4 = --ewram160AA;
        if (r4 == 0)
        {
            PlaySE(SE_SELECT);
            Emitcmd33(1, 0, 0);
            WallyBufferExecCompleted();
            ewram160A8++;
            ewram160A9 = r4;
            ewram160AA = 64;
        }
        break;
    case 2:
        r4 = --ewram160AA;
        if (r4 == 0)
        {
            PlaySE(SE_SELECT);
            Emitcmd33(1, 0, 0);
            WallyBufferExecCompleted();
            ewram160A8++;
            ewram160A9 = r4;
            ewram160AA = 64;
        }
        break;
    case 3:
        r4 = --ewram160AA;
        if (r4 == 0)
        {
            Emitcmd33(1, 9, 0);
            WallyBufferExecCompleted();
            ewram160A8++;
            ewram160A9 = r4;
            ewram160AA = 64;
        }
        break;
    case 4:
        if (--ewram160AA == 0)
        {
            PlaySE(SE_SELECT);
            nullsub_8(0);
            sub_802E3E4(1, 0);
            ewram160AA = 64;
            ewram160A8++;
        }
        break;
    case 5:
        if (--ewram160AA == 0)
        {
            PlaySE(SE_SELECT);
            DestroyMenuCursor();
            Emitcmd33(1, 1, 0);
            WallyBufferExecCompleted();
        }
        break;
    }
}

void sub_813741C(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].callback == SpriteCallbackDummy)
        WallyBufferExecCompleted();
}

void sub_8137454(void)
{
    if (gUnknown_03004210.state == 0)
        WallyBufferExecCompleted();
}

void sub_813746C(void)
{
    if (!gPaletteFade.active)
    {
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(gMain.savedCallback);
    }
}

void bx_wait_t5(void)
{
    if (!gDoingBattleAnim)
        WallyBufferExecCompleted();
}

void sub_81374C4(void)
{
    if (!gPaletteFade.active)
    {
        gBattleBankFunc[gActiveBank] = sub_81374FC;
        nullsub_14();
        PrepareBagForWallyTutorial();
    }
}

void sub_81374FC(void)
{
    if (gMain.callback2 == sub_800F808
     && !gPaletteFade.active)
    {
        Emitcmd35(1, gScriptItemId);
        WallyBufferExecCompleted();
    }
}

void sub_8137538(void)
{
    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank].unk0_7)
        sub_8141828(gActiveBank, &gPlayerParty[gBattlePartyID[gActiveBank]]);

    if (!ewram17810[gActiveBank ^ 2].unk0_3 && !ewram17810[gActiveBank ^ 2].unk0_7)
        sub_8141828(gActiveBank ^ 2, &gPlayerParty[gBattlePartyID[gActiveBank ^ 2]]);

    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank ^ 2].unk0_3)
    {
        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank ^ 2]]);
            sub_8045A5C(gHealthboxIDs[gActiveBank ^ 2], &gPlayerParty[gBattlePartyID[gActiveBank ^ 2]], 0);
            sub_804777C(gActiveBank ^ 2);
            sub_8043DFC(gHealthboxIDs[gActiveBank ^ 2]);
        }
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank]]);
        sub_8045A5C(gHealthboxIDs[gActiveBank], &gPlayerParty[gBattlePartyID[gActiveBank]], 0);
        sub_804777C(gActiveBank);
        sub_8043DFC(gHealthboxIDs[gActiveBank]);
        ewram17840.unk9_0 = 0;
        gBattleBankFunc[gActiveBank] = sub_81376B8;
    }
}

void sub_81376B8(void)
{
    bool8 r4 = FALSE;

    if (gSprites[gHealthboxIDs[gActiveBank]].callback == SpriteCallbackDummy)
        r4 = TRUE;
    if (r4 && ewram17810[gActiveBank].unk1_0 && ewram17810[gActiveBank ^ 2].unk1_0)
    {
        ewram17810[gActiveBank].unk0_7 = 0;
        ewram17810[gActiveBank].unk1_0 = 0;
        ewram17810[gActiveBank ^ 2].unk0_7 = 0;
        ewram17810[gActiveBank ^ 2].unk1_0 = 0;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        CreateTask(c3_0802FDF4, 10);
        sub_80324F8(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
        WallyBufferExecCompleted();
    }
}

void sub_81377B0(void)
{
    s16 r4;

    r4 = sub_8045C78(gActiveBank, gHealthboxIDs[gActiveBank], 0, 0);
    sub_8043DFC(gHealthboxIDs[gActiveBank]);
    if (r4 != -1)
    {
        sub_80440EC(gHealthboxIDs[gActiveBank], r4, 0);
    }
    else
    {
        sub_80324F8(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
        WallyBufferExecCompleted();
    }
}

void bx_blink_t5(void)
{
    u8 spriteId = gObjectBankIDs[gActiveBank];

    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = FALSE;
        WallyBufferExecCompleted();
    }
    else
    {
        if (((u16)gSprites[spriteId].data[1] % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        gSprites[spriteId].data[1]++;
    }
}

void sub_813789C(void)
{
    if (!ewram17810[gActiveBank].unk0_6)
    {
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        WallyBufferExecCompleted();
    }
}

// Duplicate of sub_813741C
void sub_8137908(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].callback == SpriteCallbackDummy)
        WallyBufferExecCompleted();
}

void sub_8137940(void)
{
    if (!ewram17810[gActiveBank].unk0_5)
        WallyBufferExecCompleted();
}

void WallyBufferExecCompleted(void)
{
    gBattleBankFunc[gActiveBank] = WallyBufferRunCommand;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 multiplayerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(2, 4, &multiplayerId);
        gBattleBufferA[gActiveBank][0] = 0x38;
    }
    else
    {
        gBattleExecBuffer &= ~gBitTable[gActiveBank];
    }
}

void unref_sub_81379E4(void)
{
    if (!ewram17810[gActiveBank].unk0_4)
        WallyBufferExecCompleted();
}

void WallyHandleGetAttributes(void)
{
    u8 arr[0x100];
    u32 r6 = 0;
    u8 r4;
    s32 i;

    if (gBattleBufferA[gActiveBank][2] == 0)
    {
        r6 = sub_8137A84(gBattlePartyID[gActiveBank], arr);
    }
    else
    {
        r4 = gBattleBufferA[gActiveBank][2];
        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                r6 += sub_8137A84(i, arr + r6);
            r4 >>= 1;
        }
    }
    Emitcmd29(1, r6, arr);
    WallyBufferExecCompleted();
}

u32 sub_8137A84(u8 a, u8 *buffer)
{
    struct BattlePokemon battlePokemon;
    struct UnknownStruct3 moveData;
    u8 nickname[20];
    u8 *src;
    s16 data16;
    u32 data32;
    s32 size = 0;

    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        battlePokemon.species = GetMonData(&gPlayerParty[a], MON_DATA_SPECIES);
        battlePokemon.item = GetMonData(&gPlayerParty[a], MON_DATA_HELD_ITEM);
        for (size = 0; size < 4; size++)
        {
            battlePokemon.moves[size] = GetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + size);
            battlePokemon.pp[size] = GetMonData(&gPlayerParty[a], MON_DATA_PP1 + size);
        }
        battlePokemon.ppBonuses = GetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES);
        battlePokemon.friendship = GetMonData(&gPlayerParty[a], MON_DATA_FRIENDSHIP);
        battlePokemon.experience = GetMonData(&gPlayerParty[a], MON_DATA_EXP);
        battlePokemon.hpIV = GetMonData(&gPlayerParty[a], MON_DATA_HP_IV);
        battlePokemon.attackIV = GetMonData(&gPlayerParty[a], MON_DATA_ATK_IV);
        battlePokemon.defenseIV = GetMonData(&gPlayerParty[a], MON_DATA_DEF_IV);
        battlePokemon.speedIV = GetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV);
        battlePokemon.spAttackIV = GetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV);
        battlePokemon.spDefenseIV = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV);
        battlePokemon.personality = GetMonData(&gPlayerParty[a], MON_DATA_PERSONALITY);
        battlePokemon.status1 = GetMonData(&gPlayerParty[a], MON_DATA_STATUS);
        battlePokemon.level = GetMonData(&gPlayerParty[a], MON_DATA_LEVEL);
        battlePokemon.hp = GetMonData(&gPlayerParty[a], MON_DATA_HP);
        battlePokemon.maxHP = GetMonData(&gPlayerParty[a], MON_DATA_MAX_HP);
        battlePokemon.attack = GetMonData(&gPlayerParty[a], MON_DATA_ATK);
        battlePokemon.defense = GetMonData(&gPlayerParty[a], MON_DATA_DEF);
        battlePokemon.speed = GetMonData(&gPlayerParty[a], MON_DATA_SPEED);
        battlePokemon.spAttack = GetMonData(&gPlayerParty[a], MON_DATA_SPATK);
        battlePokemon.spDefense = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF);
        battlePokemon.isEgg = GetMonData(&gPlayerParty[a], MON_DATA_IS_EGG);
        battlePokemon.altAbility = GetMonData(&gPlayerParty[a], MON_DATA_ALT_ABILITY);
        battlePokemon.otId = GetMonData(&gPlayerParty[a], MON_DATA_OT_ID);
        GetMonData(&gPlayerParty[a], MON_DATA_NICKNAME, nickname);
        StringCopy10(battlePokemon.nickname, nickname);
        GetMonData(&gPlayerParty[a], MON_DATA_OT_NAME, battlePokemon.otName);
        MEMCPY_ALT(&battlePokemon, buffer, sizeof(battlePokemon), size, src);
        break;
    case 1:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_SPECIES);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 2:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_HELD_ITEM);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 3:
        for (size = 0; size < 4; size++)
        {
            moveData.moves[size] = GetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + size);
            moveData.pp[size] = GetMonData(&gPlayerParty[a], MON_DATA_PP1 + size);
        }
        moveData.ppBonuses = GetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES);
        MEMCPY_ALT(&moveData, buffer, sizeof(moveData), size, src);
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + gBattleBufferA[gActiveBank][1] - 4);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 8:
        for (size = 0; size < 4; size++)
            buffer[size] = GetMonData(&gPlayerParty[a], MON_DATA_PP1 + size);
        buffer[size] = GetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES);
        size++;
        break;
    case 9:
    case 10:
    case 11:
    case 12:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_PP1 + gBattleBufferA[gActiveBank][1] - 9);
        size = 1;
        break;
    case 17:
        data32 = GetMonData(&gPlayerParty[a], MON_DATA_OT_ID);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case 18:
        data32 = GetMonData(&gPlayerParty[a], MON_DATA_EXP);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case 19:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_HP_EV);
        size = 1;
        break;
    case 20:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_ATK_EV);
        size = 1;
        break;
    case 21:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_DEF_EV);
        size = 1;
        break;
    case 22:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPEED_EV);
        size = 1;
        break;
    case 23:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPATK_EV);
        size = 1;
        break;
    case 24:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF_EV);
        size = 1;
        break;
    case 25:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_FRIENDSHIP);
        size = 1;
        break;
    case 26:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_POKERUS);
        size = 1;
        break;
    case 27:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_MET_LOCATION);
        size = 1;
        break;
    case 28:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_MET_LEVEL);
        size = 1;
        break;
    case 29:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_MET_GAME);
        size = 1;
        break;
    case 30:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_POKEBALL);
        size = 1;
        break;
    case 31:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_HP_IV);
        buffer[1] = GetMonData(&gPlayerParty[a], MON_DATA_ATK_IV);
        buffer[2] = GetMonData(&gPlayerParty[a], MON_DATA_DEF_IV);
        buffer[3] = GetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV);
        buffer[4] = GetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV);
        buffer[5] = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV);
        size = 6;
        break;
    case 32:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_HP_IV);
        size = 1;
        break;
    case 33:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_ATK_IV);
        size = 1;
        break;
    case 34:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_DEF_IV);
        size = 1;
        break;
    case 35:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV);
        size = 1;
        break;
    case 36:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV);
        size = 1;
        break;
    case 37:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV);
        size = 1;
        break;
    case 38:
        data32 = GetMonData(&gPlayerParty[a], MON_DATA_PERSONALITY);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        buffer[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case 39:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_CHECKSUM);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 40:
        data32 = GetMonData(&gPlayerParty[a], MON_DATA_STATUS);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        buffer[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case 41:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_LEVEL);
        size = 1;
        break;
    case 42:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_HP);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 43:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_MAX_HP);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 44:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_ATK);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 45:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_DEF);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 46:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_SPEED);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 47:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_SPATK);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 48:
        data16 = GetMonData(&gPlayerParty[a], MON_DATA_SPDEF);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 49:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_COOL);
        size = 1;
        break;
    case 50:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_BEAUTY);
        size = 1;
        break;
    case 51:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_CUTE);
        size = 1;
        break;
    case 52:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SMART);
        size = 1;
        break;
    case 53:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_TOUGH);
        size = 1;
        break;
    case 54:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SHEEN);
        size = 1;
        break;
    case 55:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_COOL_RIBBON);
        size = 1;
        break;
    case 56:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_BEAUTY_RIBBON);
        size = 1;
        break;
    case 57:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_CUTE_RIBBON);
        size = 1;
        break;
    case 58:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_SMART_RIBBON);
        size = 1;
        break;
    case 59:
        buffer[0] = GetMonData(&gPlayerParty[a], MON_DATA_TOUGH_RIBBON);
        size = 1;
        break;
    }
    return size;
}

void WallyHandlecmd1(void)
{
    PlayerHandlecmd1();
}

void WallyHandleSetAttributes(void)
{
    u8 r4;
    u8 i;

    if (gBattleBufferA[gActiveBank][2] == 0)
    {
        sub_8138294(gBattlePartyID[gActiveBank]);
    }
    else
    {
        r4 = gBattleBufferA[gActiveBank][2];
        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                sub_8138294(i);
            r4 >>= 1;
        }
    }
    WallyBufferExecCompleted();
}

void sub_8138294(u8 a)
{
    struct BattlePokemon *battlePokemon = (struct BattlePokemon *)&gBattleBufferA[gActiveBank][3];
    struct UnknownStruct3 *moveData = (struct UnknownStruct3 *)&gBattleBufferA[gActiveBank][3];
    s32 i;

    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        {
            u8 iv;

            SetMonData(&gPlayerParty[a], MON_DATA_SPECIES, &battlePokemon->species);
            SetMonData(&gPlayerParty[a], MON_DATA_HELD_ITEM, &battlePokemon->item);
            for (i = 0; i < 4; i++)
            {
                SetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + i, &battlePokemon->moves[i]);
                SetMonData(&gPlayerParty[a], MON_DATA_PP1 + i, &battlePokemon->pp[i]);
            }
            SetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES, &battlePokemon->ppBonuses);
            SetMonData(&gPlayerParty[a], MON_DATA_FRIENDSHIP, &battlePokemon->friendship);
            SetMonData(&gPlayerParty[a], MON_DATA_EXP, &battlePokemon->experience);
            iv = battlePokemon->hpIV;
            SetMonData(&gPlayerParty[a], MON_DATA_HP_IV, &iv);
            iv = battlePokemon->attackIV;
            SetMonData(&gPlayerParty[a], MON_DATA_ATK_IV, &iv);
            iv = battlePokemon->defenseIV;
            SetMonData(&gPlayerParty[a], MON_DATA_DEF_IV, &iv);
            iv = battlePokemon->speedIV;
            SetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV, &iv);
            iv = battlePokemon->spAttackIV;
            SetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV, &iv);
            iv = battlePokemon->spDefenseIV;
            SetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV, &iv);
            SetMonData(&gPlayerParty[a], MON_DATA_PERSONALITY, &battlePokemon->personality);
            SetMonData(&gPlayerParty[a], MON_DATA_STATUS, &battlePokemon->status1);
            SetMonData(&gPlayerParty[a], MON_DATA_LEVEL, &battlePokemon->level);
            SetMonData(&gPlayerParty[a], MON_DATA_HP, &battlePokemon->hp);
            SetMonData(&gPlayerParty[a], MON_DATA_MAX_HP, &battlePokemon->maxHP);
            SetMonData(&gPlayerParty[a], MON_DATA_ATK, &battlePokemon->attack);
            SetMonData(&gPlayerParty[a], MON_DATA_DEF, &battlePokemon->defense);
            SetMonData(&gPlayerParty[a], MON_DATA_SPEED, &battlePokemon->speed);
            SetMonData(&gPlayerParty[a], MON_DATA_SPATK, &battlePokemon->spAttack);
            SetMonData(&gPlayerParty[a], MON_DATA_SPDEF, &battlePokemon->spDefense);
        }
        break;
    case 1:
        SetMonData(&gPlayerParty[a], MON_DATA_SPECIES, &gBattleBufferA[gActiveBank][3]);
        break;
    case 2:
        SetMonData(&gPlayerParty[a], MON_DATA_HELD_ITEM, &gBattleBufferA[gActiveBank][3]);
        break;
    case 3:
        for (i = 0; i < 4; i++)
        {
            SetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + i, &moveData->moves[i]);
            SetMonData(&gPlayerParty[a], MON_DATA_PP1 + i, &moveData->pp[i]);
        }
        SetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES, &moveData->ppBonuses);
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        SetMonData(&gPlayerParty[a], MON_DATA_MOVE1 + gBattleBufferA[gActiveBank][1] - 4, &gBattleBufferA[gActiveBank][3]);
        break;
    case 8:
        SetMonData(&gPlayerParty[a], MON_DATA_PP1, &gBattleBufferA[gActiveBank][3]);
        SetMonData(&gPlayerParty[a], MON_DATA_PP2, &gBattleBufferA[gActiveBank][4]);
        SetMonData(&gPlayerParty[a], MON_DATA_PP3, &gBattleBufferA[gActiveBank][5]);
        SetMonData(&gPlayerParty[a], MON_DATA_PP4, &gBattleBufferA[gActiveBank][6]);
        SetMonData(&gPlayerParty[a], MON_DATA_PP_BONUSES, &gBattleBufferA[gActiveBank][7]);
        break;
    case 9:
    case 10:
    case 11:
    case 12:
        SetMonData(&gPlayerParty[a], MON_DATA_PP1 + gBattleBufferA[gActiveBank][1] - 9, &gBattleBufferA[gActiveBank][3]);
        break;
    case 17:
        SetMonData(&gPlayerParty[a], MON_DATA_OT_ID, &gBattleBufferA[gActiveBank][3]);
        break;
    case 18:
        SetMonData(&gPlayerParty[a], MON_DATA_EXP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 19:
        SetMonData(&gPlayerParty[a], MON_DATA_HP_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 20:
        SetMonData(&gPlayerParty[a], MON_DATA_ATK_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 21:
        SetMonData(&gPlayerParty[a], MON_DATA_DEF_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 22:
        SetMonData(&gPlayerParty[a], MON_DATA_SPEED_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 23:
        SetMonData(&gPlayerParty[a], MON_DATA_SPATK_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 24:
        SetMonData(&gPlayerParty[a], MON_DATA_SPDEF_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 25:
        SetMonData(&gPlayerParty[a], MON_DATA_FRIENDSHIP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 26:
        SetMonData(&gPlayerParty[a], MON_DATA_POKERUS, &gBattleBufferA[gActiveBank][3]);
        break;
    case 27:
        SetMonData(&gPlayerParty[a], MON_DATA_MET_LOCATION, &gBattleBufferA[gActiveBank][3]);
        break;
    case 28:
        SetMonData(&gPlayerParty[a], MON_DATA_MET_LEVEL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 29:
        SetMonData(&gPlayerParty[a], MON_DATA_MET_GAME, &gBattleBufferA[gActiveBank][3]);
        break;
    case 30:
        SetMonData(&gPlayerParty[a], MON_DATA_POKEBALL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 31:
        SetMonData(&gPlayerParty[a], MON_DATA_HP_IV, &gBattleBufferA[gActiveBank][3]);
        SetMonData(&gPlayerParty[a], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBank][4]);
        SetMonData(&gPlayerParty[a], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBank][5]);
        SetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBank][6]);
        SetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBank][7]);
        SetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBank][8]);
        break;
    case 32:
        SetMonData(&gPlayerParty[a], MON_DATA_HP_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 33:
        SetMonData(&gPlayerParty[a], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 34:
        SetMonData(&gPlayerParty[a], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 35:
        SetMonData(&gPlayerParty[a], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 36:
        SetMonData(&gPlayerParty[a], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 37:
        SetMonData(&gPlayerParty[a], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 38:
        SetMonData(&gPlayerParty[a], MON_DATA_PERSONALITY, &gBattleBufferA[gActiveBank][3]);
        break;
    case 39:
        SetMonData(&gPlayerParty[a], MON_DATA_CHECKSUM, &gBattleBufferA[gActiveBank][3]);
        break;
    case 40:
        SetMonData(&gPlayerParty[a], MON_DATA_STATUS, &gBattleBufferA[gActiveBank][3]);
        break;
    case 41:
        SetMonData(&gPlayerParty[a], MON_DATA_LEVEL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 42:
        SetMonData(&gPlayerParty[a], MON_DATA_HP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 43:
        SetMonData(&gPlayerParty[a], MON_DATA_MAX_HP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 44:
        SetMonData(&gPlayerParty[a], MON_DATA_ATK, &gBattleBufferA[gActiveBank][3]);
        break;
    case 45:
        SetMonData(&gPlayerParty[a], MON_DATA_DEF, &gBattleBufferA[gActiveBank][3]);
        break;
    case 46:
        SetMonData(&gPlayerParty[a], MON_DATA_SPEED, &gBattleBufferA[gActiveBank][3]);
        break;
    case 47:
        SetMonData(&gPlayerParty[a], MON_DATA_SPATK, &gBattleBufferA[gActiveBank][3]);
        break;
    case 48:
        SetMonData(&gPlayerParty[a], MON_DATA_SPDEF, &gBattleBufferA[gActiveBank][3]);
        break;
    case 49:
        SetMonData(&gPlayerParty[a], MON_DATA_COOL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 50:
        SetMonData(&gPlayerParty[a], MON_DATA_BEAUTY, &gBattleBufferA[gActiveBank][3]);
        break;
    case 51:
        SetMonData(&gPlayerParty[a], MON_DATA_CUTE, &gBattleBufferA[gActiveBank][3]);
        break;
    case 52:
        SetMonData(&gPlayerParty[a], MON_DATA_SMART, &gBattleBufferA[gActiveBank][3]);
        break;
    case 53:
        SetMonData(&gPlayerParty[a], MON_DATA_TOUGH, &gBattleBufferA[gActiveBank][3]);
        break;
    case 54:
        SetMonData(&gPlayerParty[a], MON_DATA_SHEEN, &gBattleBufferA[gActiveBank][3]);
        break;
    case 55:
        SetMonData(&gPlayerParty[a], MON_DATA_COOL_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 56:
        SetMonData(&gPlayerParty[a], MON_DATA_BEAUTY_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 57:
        SetMonData(&gPlayerParty[a], MON_DATA_CUTE_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 58:
        SetMonData(&gPlayerParty[a], MON_DATA_SMART_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 59:
        SetMonData(&gPlayerParty[a], MON_DATA_TOUGH_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    }
    sub_80324F8(&gPlayerParty[gBattlePartyID[gActiveBank]], gActiveBank);
}

void WallyHandlecmd3(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleLoadPokeSprite(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleSendOutPoke(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleReturnPokeToBall(void)
{
    if (gBattleBufferA[gActiveBank][1] == 0)
    {
        move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 1);
        gBattleBankFunc[gActiveBank] = sub_813789C;
    }
    else
    {
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        WallyBufferExecCompleted();
    }
}

void WallyHandleTrainerThrow(void)
{
    LoadPlayerTrainerBankSprite(2, gActiveBank);
    GetMonSpriteTemplate_803C5A0(2, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      80, 80 + 4 * (8 - gTrainerBackPicCoords[2].coords),
      30);
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = gActiveBank;
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = 240;
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = -2;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_80313A0;
    gBattleBankFunc[gActiveBank] = sub_813741C;
}

void WallyHandleTrainerSlide(void)
{
    LoadPlayerTrainerBankSprite(2, gActiveBank);
    GetMonSpriteTemplate_803C5A0(2, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      80, 80 + 4 * (8 - gTrainerBackPicCoords[2].coords),
      30);
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = gActiveBank;
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = -96;
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = 2;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_80313A0;
    gBattleBankFunc[gActiveBank] = sub_8137908;
}

void WallyHandleTrainerSlideBack(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd10(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd11(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd12(void)
{
    ewram17840.unk8 = 4;
    gDoingBattleAnim = TRUE;
    move_anim_start_t4(gActiveBank, gActiveBank, GetBankByPlayerAI(1), 4);
    gBattleBankFunc[gActiveBank] = bx_wait_t5;
}

void WallyHandleBallThrow(void)
{
    u8 val = gBattleBufferA[gActiveBank][1];

    ewram17840.unk8 = val;
    gDoingBattleAnim = TRUE;
    move_anim_start_t4(gActiveBank, gActiveBank, GetBankByPlayerAI(1), 4);
    gBattleBankFunc[gActiveBank] = bx_wait_t5;
}

void WallyHandlePuase(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleMoveAnimation(void)
{
    u16 r0 = gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8);

    gUnknown_0202F7C4 = gBattleBufferA[gActiveBank][3];
    gMovePowerMoveAnim = gBattleBufferA[gActiveBank][4] | (gBattleBufferA[gActiveBank][5] << 8);
    gMoveDmgMoveAnim = gBattleBufferA[gActiveBank][6] | (gBattleBufferA[gActiveBank][7] << 8) | (gBattleBufferA[gActiveBank][8] << 16) | (gBattleBufferA[gActiveBank][9] << 24);
    gHappinessMoveAnim = gBattleBufferA[gActiveBank][10];
    gWeatherMoveAnim = gBattleBufferA[gActiveBank][12] | (gBattleBufferA[gActiveBank][13] << 8);
    gDisableStructMoveAnim = (u32 *)&gBattleBufferA[gActiveBank][16];
    gPID_perBank[gActiveBank] = *gDisableStructMoveAnim;
    if (sub_8031720(r0, gUnknown_0202F7C4) != 0)
    {
        // Dead code. sub_8031720 always returns 0.
        WallyBufferExecCompleted();
    }
    else
    {
        ewram17810[gActiveBank].unk4 = 0;
        gBattleBankFunc[gActiveBank] = sub_81390D0;
    }
}

void sub_81390D0(void)
{
    u16 r4 = gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8);

#ifndef NONMATCHING
    asm("":::"r6");
#endif

    switch (ewram17810[gActiveBank].unk4)
    {
    case 0:
        if (ewram17800[gActiveBank].substituteSprite == 1)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        ewram17810[gActiveBank].unk4 = 1;
        break;
    case 1:
        if (ewram17810[gActiveBank].unk0_6 == 0)
        {
            sub_80326EC(0);
            ExecuteMoveAnim(r4);
            ewram17810[gActiveBank].unk4 = 2;
        }
        break;
    case 2:
        gAnimScriptCallback();
        if (!gAnimScriptActive)
        {
            sub_80326EC(1);
            if (ewram17800[gActiveBank].substituteSprite == 1)
                move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 6);
            ewram17810[gActiveBank].unk4 = 3;
        }
        break;
    case 3:
        if (ewram17810[gActiveBank].unk0_6 == 0)
        {
            sub_8031F24();
            sub_80324BC(gActiveBank, gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
            ewram17810[gActiveBank].unk4 = 0;
            WallyBufferExecCompleted();
        }
        break;
    }
}

void WallyHandlePrintString(void)
{
    u16 *ptr;

    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    ptr = (u16 *)&gBattleBufferA[gActiveBank][2];
    if (*ptr == 2)
        DestroyMenuCursor();
    BufferStringBattle(*ptr);
    sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 0x90, 2, 15);
    gBattleBankFunc[gActiveBank] = sub_8137454;
}

void WallyHandlePrintStringPlayerOnly(void)
{
    if (GetBankSide(gActiveBank) == 0)
        WallyHandlePrintString();
    else
        WallyBufferExecCompleted();
}

void WallyHandlecmd18(void)
{
    s32 i;

	SetCustomFont(1);
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 160;
    gUnknown_03004210.paletteNum = 0;
    FillWindowRect_DefaultPalette(&gUnknown_03004210, 10, 2, 15, 27, 18);
    FillWindowRect_DefaultPalette(&gUnknown_03004210, 10, 2, 35, 16, 36);
    gBattleBankFunc[gActiveBank] = sub_81372BC;
    
	InitWindow(&gUnknown_03004210, BattleText_MenuOptions, 400, 19, 35);
    sub_8002F44(&gUnknown_03004210);
    sub_814A5C0(0, 0xFFFF, 12, 0x2D9F, 0);
    for (i = 0; i < 4; i++)
        nullsub_8(i);
    sub_802E3E4(0, 0);
	SetCustomFont(0);
    StrCpyDecodeToDisplayedStringBattle(BattleText_WallyMenu);
    InitWindow(&gUnknown_03004210, gDisplayedStringBattle, 440, 2, 35);
    sub_8002F44(&gUnknown_03004210);
}

void WallyHandlecmd19(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd20(void)
{
    switch (ewram160A9)
    {
    case 0:
        sub_80304A8();
        ewram160A9++;
        ewram160AB = 80;
        // fall through
    case 1:
        ewram160AB--;
        if (ewram160AB == 0)
        {
            DestroyMenuCursor();
            PlaySE(SE_SELECT);
            Emitcmd33(1, 10, 256);
            WallyBufferExecCompleted();
        }
        break;
    }
}

void WallyHandleOpenBag(void)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    gBattleBankFunc[gActiveBank] = sub_81374C4;
    gBankInMenu = gActiveBank;
}

void WallyHandlecmd22(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd23(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleHealthBarUpdate(void)
{
    s16 r7;

    load_gfxc_health_bar(0);
    r7 = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);
    if (r7 != 0x7FFF)
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MAX_HP);
        u32 curHP = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_HP);

        sub_8043D84(gActiveBank, gHealthboxIDs[gActiveBank], maxHP, curHP, r7);
    }
    else
    {
        u32 maxHP = GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_MAX_HP);

        sub_8043D84(gActiveBank, gHealthboxIDs[gActiveBank], maxHP, 0, r7);
        sub_80440EC(gHealthboxIDs[gActiveBank], 0, 0);
    }
    gBattleBankFunc[gActiveBank] = sub_81377B0;
}

void WallyHandleExpBarUpdate(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleStatusIconUpdate(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleStatusAnimation(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleStatusXor(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd29(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleDMATransfer(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd31(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd32(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd33(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd34(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd35(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd36(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd37(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd38(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd39(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd40(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleHitAnimation(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].invisible == TRUE)
    {
        WallyBufferExecCompleted();
    }
    else
    {
        gDoingBattleAnim = 1;
        gSprites[gObjectBankIDs[gActiveBank]].data[1] = 0;
        sub_8047858(gActiveBank);
        gBattleBankFunc[gActiveBank] = bx_blink_t5;
    }
}

void WallyHandlecmd42(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleEffectivenessSound(void)
{
    PlaySE(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
    WallyBufferExecCompleted();
}

void WallyHandlecmd44(void)
{
    PlayFanfare(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
    WallyBufferExecCompleted();
}

void WallyHandleFaintingCry(void)
{
    PlayCry1(GetMonData(&gPlayerParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES), 25);
    WallyBufferExecCompleted();
}

void WallyHandleIntroSlide(void)
{
    sub_80E43C0(gBattleBufferA[gActiveBank][1]);
    gUnknown_02024DE8 |= 1;
    WallyBufferExecCompleted();
}

void WallyHandleTrainerBallThrow(void)
{
    u8 paletteNum;
    u8 taskId;

    oamt_add_pos2_onto_pos1(&gSprites[gObjectBankIDs[gActiveBank]]);
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = 50;
    gSprites[gObjectBankIDs[gActiveBank]].data[2] = -40;
    gSprites[gObjectBankIDs[gActiveBank]].data[4] = gSprites[gObjectBankIDs[gActiveBank]].pos1.y;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8078B34;
    gSprites[gObjectBankIDs[gActiveBank]].data[5] = gActiveBank;
    StoreSpriteCallbackInData(&gSprites[gObjectBankIDs[gActiveBank]], sub_8030E38);
    StartSpriteAnim(&gSprites[gObjectBankIDs[gActiveBank]], 1);
    paletteNum = AllocSpritePalette(0xD6F8);
    LoadCompressedPalette(gTrainerBackPicPaletteTable[2].data, 0x100 + paletteNum * 16, 32);
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = paletteNum;
    taskId = CreateTask(sub_8139A2C, 5);
    gTasks[taskId].data[0] = gActiveBank;
    if (ewram17810[gActiveBank].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBank]].func = sub_8044CA0;
    ewram17810[4].unk9 |= 1;
    gBattleBankFunc[gActiveBank] = nullsub_91;
}

void sub_81398BC(u8 bank)
{
    u16 species;

    ewram17800[bank].transformedSpecies = 0;
    gBattlePartyID[bank] = gBattleBufferA[bank][1];
    species = GetMonData(&gPlayerParty[gBattlePartyID[bank]], MON_DATA_SPECIES);
    gUnknown_0300434C[bank] = CreateInvisibleSpriteWithCallback(sub_80312F0);
    GetMonSpriteTemplate_803C56C(species, GetBankIdentity(bank));
    gObjectBankIDs[bank] = CreateSprite(
      &gUnknown_02024E8C,
      sub_8077ABC(bank, 2),
      sub_8077F68(bank),
      sub_8079E90(bank));
    gSprites[gUnknown_0300434C[bank]].data[1] = gObjectBankIDs[bank];
    gSprites[gObjectBankIDs[bank]].data[0] = bank;
    gSprites[gObjectBankIDs[bank]].data[2] = species;
    gSprites[gObjectBankIDs[bank]].oam.paletteNum = bank;
    StartSpriteAnim(&gSprites[gObjectBankIDs[bank]], gBattleMonForms[bank]);
    gSprites[gObjectBankIDs[bank]].invisible = TRUE;
    gSprites[gObjectBankIDs[bank]].callback = SpriteCallbackDummy;
    gSprites[gUnknown_0300434C[bank]].data[0] = sub_8046400(0, 0xFF);
}

void sub_8139A2C(u8 taskId)
{
    if (gTasks[taskId].data[1] < 31)
    {
        gTasks[taskId].data[1]++;
    }
    else
    {
        u8 savedActiveBank = gActiveBank;

        gActiveBank = gTasks[taskId].data[0];
        gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
        sub_81398BC(gActiveBank);
        gBattleBankFunc[gActiveBank] = sub_8137538;
        gActiveBank = savedActiveBank;
        DestroyTask(taskId);
    }
}

void WallyHandlecmd48(void)
{
    if (gBattleBufferA[gActiveBank][1] != 0 && GetBankSide(gActiveBank) == 0)
    {
        WallyBufferExecCompleted();
    }
    else
    {
        ewram17810[gActiveBank].unk0_0 = 1;
        gUnknown_02024E68[gActiveBank] = sub_8044804(gActiveBank, (struct BattleInterfaceStruct2 *)&gBattleBufferA[gActiveBank][4], gBattleBufferA[gActiveBank][1], gBattleBufferA[gActiveBank][2]);
        WallyBufferExecCompleted();
    }
}

void WallyHandlecmd49(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd50(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleSpriteInvisibility(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleBattleAnimation(void)
{
    u8 val2 = gBattleBufferA[gActiveBank][1];
    u16 val = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);

    if (move_anim_start_t3(gActiveBank, gActiveBank, gActiveBank, val2, val))
        WallyBufferExecCompleted();
    else
        gBattleBankFunc[gActiveBank] = sub_8137940;
}

void WallyHandleLinkStandbyMsg(void)
{
    WallyBufferExecCompleted();
}

void WallyHandleResetActionMoveSelection(void)
{
    WallyBufferExecCompleted();
}

void WallyHandlecmd55(void)
{
    gBattleOutcome = gBattleBufferA[gActiveBank][1];
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    WallyBufferExecCompleted();
    if ((gBattleTypeFlags & BATTLE_TYPE_LINK) && !(gBattleTypeFlags & BATTLE_TYPE_WILD))
        gBattleBankFunc[gActiveBank] = sub_813746C;
}

void WallyHandlecmd56(void)
{
}
