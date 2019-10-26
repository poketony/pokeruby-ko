#include "global.h"
#include "battle.h"
#include "battle_interface.h"
#include "data2.h"
#include "link.h"
#include "m4a.h"
#include "main.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "rom3.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "util.h"
#include "ewram.h"

struct UnknownStruct3
{
    u16 moves[4];
    u8 pp[4];
    u8 ppBonuses;
};

extern u8 gActiveBank;
extern u8 gBattleBufferA[][0x200];
extern u8 gObjectBankIDs[];
extern u16 gBattlePartyID[];
extern u8 gHealthboxIDs[];
extern u16 gBattleTypeFlags;
extern u8 gBattleMonForms[];
extern void (*gBattleBankFunc[])(void);
extern u32 *gDisableStructMoveAnim;
extern u32 gMoveDmgMoveAnim;
extern u16 gMovePowerMoveAnim;
extern u8 gHappinessMoveAnim;
extern u16 gWeatherMoveAnim;
extern u32 gPID_perBank[];
extern u8 gAnimScriptActive;
extern void (*gAnimScriptCallback)(void);
extern u8 gDisplayedStringBattle[];
extern bool8 gDoingBattleAnim;
extern u8 gBattleOutcome;
extern u16 gUnknown_02024DE8;
extern u8 gUnknown_02024E68[];
extern struct SpriteTemplate gUnknown_02024E8C;
extern u8 gUnknown_0202F7C4;
extern struct Window gUnknown_03004210;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;
extern u8 gUnknown_0300434C[];
extern u32 gBattleExecBuffer;
extern MainCallback gPreBattleCallback1;
extern struct MusicPlayerInfo gMPlay_BGM;

extern u8 sub_8077F68();
extern u8 sub_8079E90();
extern u8 GetBankIdentity(u8);
extern void BattleLoadOpponentMonSprite(struct Pokemon *, u8);
extern void sub_8037A74(void);
extern void sub_8032984(u8, u16);
extern void sub_8037E30(void);
extern void sub_80312F0(struct Sprite *);
extern u8 sub_8046400();
extern void sub_8032A08();
extern void sub_8043DB0();
extern void sub_8037BBC(void);
extern s32 sub_803FC34(u16);
extern void sub_8031A6C(u16, u8);
extern void sub_80313A0(struct Sprite *);
extern void sub_803757C(void);
extern void oamt_add_pos2_onto_pos1();
extern void StoreSpriteCallbackInData();
extern void sub_8078B34(struct Sprite *);
extern void sub_80375B4(void);
extern void sub_8010384(struct Sprite *);
extern void sub_8037B78(void);
extern u8 sub_8031720();
extern bool8 mplay_80342A4(u8);
extern void ExecuteMoveAnim();
extern void sub_80326EC();
extern void sub_8031F24(void);
extern void sub_80324BC();
extern void BufferStringBattle();
extern void sub_8037C2C(void);
extern void sub_8043D84();
extern void sub_8037B24(void);
extern void sub_8045A5C();
extern void sub_8037FAC(void);
extern void move_anim_start_t2_for_situation();
extern void dp01t_0F_4_move_anim(void);
extern void sub_8047858();
extern u8 GetBankSide(u8);
extern void sub_80E43C0();
extern void sub_803A3A8(struct Sprite *);
extern void sub_8044CA0(u8);
extern void nullsub_47(void);
extern bool8 IsDoubleBattle(void);
extern void sub_8037840(void);
extern void sub_8031B74();
extern u8 AnimBankSpriteExists();
extern u8 move_anim_start_t3();
extern void sub_8037FD8(void);
extern void sub_8037F34(void);
extern void LinkOpponentBufferExecCompleted(void);
extern void sub_8141828();
extern void sub_804777C();

// this file's functions

u32 dp01_getattr_by_ch1_for_player_pokemon__(u8, u8 *);
void sub_803752C(void);
void sub_8037D2C(void);
void sub_8038900(u8);
void sub_8039430(u8, u8);
void sub_8039648(void);
void sub_8039B64(void);
void sub_803A2C4(u8);
void sub_803A4E0(void);

void LinkOpponentHandleGetAttributes(void);
void LinkOpponentHandlecmd1(void);
void LinkOpponentHandleSetAttributes(void);
void LinkOpponentHandlecmd3(void);
void LinkOpponentHandleLoadPokeSprite(void);
void LinkOpponentHandleSendOutPoke(void);
void LinkOpponentHandleReturnPokeToBall(void);
void LinkOpponentHandleTrainerThrow(void);
void LinkOpponentHandleTrainerSlide(void);
void LinkOpponentHandleTrainerSlideBack(void);
void LinkOpponentHandlecmd10(void);
void LinkOpponentHandlecmd11(void);
void LinkOpponentHandlecmd12(void);
void LinkOpponentHandleBallThrow(void);
void LinkOpponentHandlePuase(void);
void LinkOpponentHandleMoveAnimation(void);
void LinkOpponentHandlePrintString(void);
void LinkOpponentHandlePrintStringPlayerOnly(void);
void LinkOpponentHandlecmd18(void);
void LinkOpponentHandlecmd19(void);
void LinkOpponentHandlecmd20(void);
void LinkOpponentHandleOpenBag(void);
void LinkOpponentHandlecmd22(void);
void LinkOpponentHandlecmd23(void);
void LinkOpponentHandleHealthBarUpdate(void);
void LinkOpponentHandleExpBarUpdate(void);
void LinkOpponentHandleStatusIconUpdate(void);
void LinkOpponentHandleStatusAnimation(void);
void LinkOpponentHandleStatusXor(void);
void LinkOpponentHandlecmd29(void);
void LinkOpponentHandleDMATransfer(void);
void LinkOpponentHandlecmd31(void);
void LinkOpponentHandlecmd32(void);
void LinkOpponentHandlecmd33(void);
void LinkOpponentHandlecmd34(void);
void LinkOpponentHandlecmd35(void);
void LinkOpponentHandlecmd36(void);
void LinkOpponentHandlecmd37(void);
void LinkOpponentHandlecmd38(void);
void LinkOpponentHandlecmd39(void);
void LinkOpponentHandlecmd40(void);
void LinkOpponentHandleHitAnimation(void);
void LinkOpponentHandlecmd42(void);
void LinkOpponentHandleEffectivenessSound(void);
void LinkOpponentHandlecmd44(void);
void LinkOpponentHandleFaintingCry(void);
void LinkOpponentHandleIntroSlide(void);
void LinkOpponentHandleTrainerBallThrow(void);
void LinkOpponentHandlecmd48(void);
void LinkOpponentHandlecmd49(void);
void LinkOpponentHandlecmd50(void);
void LinkOpponentHandleSpriteInvisibility(void);
void LinkOpponentHandleBattleAnimation(void);
void LinkOpponentHandleLinkStandbyMsg(void);
void LinkOpponentHandleResetActionMoveSelection(void);
void LinkOpponentHandlecmd55(void);
void LinkOpponentHandlecmd56(void);

// const data

typedef void (*BattleBufferCmd) (void);
const BattleBufferCmd gLinkOpponentBufferCommands[] =
{
    LinkOpponentHandleGetAttributes,
    LinkOpponentHandlecmd1,
    LinkOpponentHandleSetAttributes,
    LinkOpponentHandlecmd3,
    LinkOpponentHandleLoadPokeSprite,
    LinkOpponentHandleSendOutPoke,
    LinkOpponentHandleReturnPokeToBall,
    LinkOpponentHandleTrainerThrow,
    LinkOpponentHandleTrainerSlide,
    LinkOpponentHandleTrainerSlideBack,
    LinkOpponentHandlecmd10,
    LinkOpponentHandlecmd11,
    LinkOpponentHandlecmd12,
    LinkOpponentHandleBallThrow,
    LinkOpponentHandlePuase,
    LinkOpponentHandleMoveAnimation,
    LinkOpponentHandlePrintString,
    LinkOpponentHandlePrintStringPlayerOnly,
    LinkOpponentHandlecmd18,
    LinkOpponentHandlecmd19,
    LinkOpponentHandlecmd20,
    LinkOpponentHandleOpenBag,
    LinkOpponentHandlecmd22,
    LinkOpponentHandlecmd23,
    LinkOpponentHandleHealthBarUpdate,
    LinkOpponentHandleExpBarUpdate,
    LinkOpponentHandleStatusIconUpdate,
    LinkOpponentHandleStatusAnimation,
    LinkOpponentHandleStatusXor,
    LinkOpponentHandlecmd29,
    LinkOpponentHandleDMATransfer,
    LinkOpponentHandlecmd31,
    LinkOpponentHandlecmd32,
    LinkOpponentHandlecmd33,
    LinkOpponentHandlecmd34,
    LinkOpponentHandlecmd35,
    LinkOpponentHandlecmd36,
    LinkOpponentHandlecmd37,
    LinkOpponentHandlecmd38,
    LinkOpponentHandlecmd39,
    LinkOpponentHandlecmd40,
    LinkOpponentHandleHitAnimation,
    LinkOpponentHandlecmd42,
    LinkOpponentHandleEffectivenessSound,
    LinkOpponentHandlecmd44,
    LinkOpponentHandleFaintingCry,
    LinkOpponentHandleIntroSlide,
    LinkOpponentHandleTrainerBallThrow,
    LinkOpponentHandlecmd48,
    LinkOpponentHandlecmd49,
    LinkOpponentHandlecmd50,
    LinkOpponentHandleSpriteInvisibility,
    LinkOpponentHandleBattleAnimation,
    LinkOpponentHandleLinkStandbyMsg,
    LinkOpponentHandleResetActionMoveSelection,
    LinkOpponentHandlecmd55,
    LinkOpponentHandlecmd56
};

// code

void nullsub_47(void)
{
}

void SetBankFuncToLinkOpponentBufferRunCommand(void)
{
    gBattleBankFunc[gActiveBank] = sub_803752C;
}

void sub_803752C(void)
{
    if (gBattleExecBuffer & gBitTable[gActiveBank])
    {
        if (gBattleBufferA[gActiveBank][0] <= 0x38)
            gLinkOpponentBufferCommands[gBattleBufferA[gActiveBank][0]]();
        else
            LinkOpponentBufferExecCompleted();
    }
}

void sub_803757C(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].callback == SpriteCallbackDummy)
        LinkOpponentBufferExecCompleted();
}

void sub_80375B4(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].callback == SpriteCallbackDummy)
    {
        sub_8031B74(gSprites[gObjectBankIDs[gActiveBank]].oam.affineParam);
        gSprites[gObjectBankIDs[gActiveBank]].oam.tileNum = gSprites[gObjectBankIDs[gActiveBank]].data[5];
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        LinkOpponentBufferExecCompleted();
    }
}

void sub_8037644(void)
{
    if ((--ewram17810[gActiveBank].unk9) == 0xFF)
    {
        ewram17810[gActiveBank].unk9 = 0;
        LinkOpponentBufferExecCompleted();
    }
}

void sub_8037680(void)
{
    bool8 r6 = FALSE;

    if (!IsDoubleBattle() || (IsDoubleBattle() && (gBattleTypeFlags & BATTLE_TYPE_MULTI)))
    {
        if (gSprites[gHealthboxIDs[gActiveBank]].callback == SpriteCallbackDummy)
            r6 = TRUE;
    }
    else
    {
        if (gSprites[gHealthboxIDs[gActiveBank]].callback == SpriteCallbackDummy
         && gSprites[gHealthboxIDs[gActiveBank ^ 2]].callback == SpriteCallbackDummy)
            r6 = TRUE;
    }
    if (IsCryPlayingOrClearCrySongs())
        r6 = FALSE;

    if (r6)
    {
        if (GetBankIdentity(gActiveBank) == 1)
        {
            if (!ewram17810[gActiveBank].unk1_0 || !ewram17810[gActiveBank ^ 2].unk1_0)
                return;
            ewram17810[gActiveBank].unk0_7 = 0;
            ewram17810[gActiveBank].unk1_0 = 0;
            ewram17810[gActiveBank ^ 2].unk0_7 = 0;
            ewram17810[gActiveBank ^ 2].unk1_0 = 0;
            FreeSpriteTilesByTag(0x27F9);
            FreeSpritePaletteByTag(0x27F9);
        }
        if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
        {
            if (GetBankIdentity(gActiveBank) == 1)
                m4aMPlayContinue(&gMPlay_BGM);
        }
        else
        {
            m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 256);
        }
        ewram17810[gActiveBank].unk9 = 3;
        gBattleBankFunc[gActiveBank] = sub_8037644;
    }
}

void sub_8037840(void)
{
    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank].unk0_7)
        sub_8141828(gActiveBank, &gEnemyParty[gBattlePartyID[gActiveBank]]);
    if (!ewram17810[gActiveBank ^ 2].unk0_3 && !ewram17810[gActiveBank ^ 2].unk0_7)
        sub_8141828(gActiveBank ^ 2, &gEnemyParty[gBattlePartyID[gActiveBank ^ 2]]);
    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank ^ 2].unk0_3)
    {
        if ((gBattleTypeFlags & BATTLE_TYPE_MULTI) && GetBankIdentity(gActiveBank) == 3)
        {
            if (++ewram17810[gActiveBank].unk9 == 1)
                return;
            ewram17810[gActiveBank].unk9 = 0;
        }
        if (IsDoubleBattle() && !(gBattleTypeFlags & BATTLE_TYPE_MULTI))
        {
            DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank ^ 2]]);
            sub_8045A5C(
              gHealthboxIDs[gActiveBank ^ 2],
              &gEnemyParty[gBattlePartyID[gActiveBank ^ 2]],
              0);
            sub_804777C(gActiveBank ^ 2);
            sub_8043DFC(gHealthboxIDs[gActiveBank ^ 2]);
            sub_8032984(
              gActiveBank ^ 2,
              GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank ^ 2]], MON_DATA_SPECIES));
        }
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank]]);
        sub_8045A5C(
          gHealthboxIDs[gActiveBank],
          &gEnemyParty[gBattlePartyID[gActiveBank]],
          0);
        sub_804777C(gActiveBank);
        sub_8043DFC(gHealthboxIDs[gActiveBank]);
        sub_8032984(
          gActiveBank,
          GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES));

        ewram17840.unk9_0 = 0;
        gBattleBankFunc[gActiveBank] = sub_8037680;
    }
}

void sub_8037A74(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].animEnded == TRUE
     && gSprites[gObjectBankIDs[gActiveBank]].pos2.x == 0)
    {
        if (!ewram17810[gActiveBank].unk0_7)
        {
            sub_8141828(gActiveBank, &gEnemyParty[gBattlePartyID[gActiveBank]]);
            return;
        }
        if (ewram17810[gActiveBank].unk1_0)
        {
            ewram17810[gActiveBank].unk0_7 = 0;
            ewram17810[gActiveBank].unk1_0 = 0;
            FreeSpriteTilesByTag(0x27F9);
            FreeSpritePaletteByTag(0x27F9);
            LinkOpponentBufferExecCompleted();
            return;
        }
    }
}

void sub_8037B24(void)
{
    s16 r4 = sub_8045C78(gActiveBank, gHealthboxIDs[gActiveBank], 0, 0);

    sub_8043DFC(gHealthboxIDs[gActiveBank]);
    if (r4 != -1)
        sub_80440EC(gHealthboxIDs[gActiveBank], r4, 0);
    else
        LinkOpponentBufferExecCompleted();
}

void sub_8037B78(void)
{
    if (!gSprites[gObjectBankIDs[gActiveBank]].inUse)
    {
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        LinkOpponentBufferExecCompleted();
    }
}

void sub_8037BBC(void)
{
    if (!ewram17810[gActiveBank].unk0_6)
    {
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        sub_8032A08(gActiveBank);
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        LinkOpponentBufferExecCompleted();
    }
}

void sub_8037C2C(void)
{
    if (gUnknown_03004210.state == 0)
        LinkOpponentBufferExecCompleted();
}

void dp01t_0F_4_move_anim(void)
{
    u8 spriteId = gObjectBankIDs[gActiveBank];

    if (gSprites[spriteId].data[1] == 32)
    {
        gSprites[spriteId].data[1] = 0;
        gSprites[spriteId].invisible = FALSE;
        gDoingBattleAnim = 0;
        LinkOpponentBufferExecCompleted();
    }
    else
    {
        if (((u16)gSprites[spriteId].data[1] % 4) == 0)
            gSprites[spriteId].invisible ^= 1;
        gSprites[spriteId].data[1]++;
    }
}

void sub_8037CC0(void)
{
    if (gSprites[gHealthboxIDs[gActiveBank]].callback == SpriteCallbackDummy)
    {
        if (ewram17800[gActiveBank].substituteSprite)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 6);
        gBattleBankFunc[gActiveBank] = sub_8037D2C;
    }
}

void sub_8037D2C(void)
{
    if (!ewram17810[gActiveBank].unk0_6)
    {
        CreateTask(c3_0802FDF4, 10);
        LinkOpponentBufferExecCompleted();
    }
}

void sub_8037D64(void)
{
    if (ewram17810[gActiveBank].unk1_0)
    {
        ewram17810[gActiveBank].unk0_7 = 0;
        ewram17810[gActiveBank].unk1_0 = 0;
        FreeSpriteTilesByTag(0x27F9);
        FreeSpritePaletteByTag(0x27F9);
        StartSpriteAnim(&gSprites[gObjectBankIDs[gActiveBank]], 0);
        sub_8045A5C(
          gHealthboxIDs[gActiveBank],
          &gEnemyParty[gBattlePartyID[gActiveBank]],
          0);
        sub_804777C(gActiveBank);
        sub_8043DFC(gHealthboxIDs[gActiveBank]);
        sub_8031F88(gActiveBank);
        gBattleBankFunc[gActiveBank] = sub_8037CC0;
    }
}

void sub_8037E30(void)
{
    if (!ewram17810[gActiveBank].unk0_3 && !ewram17810[gActiveBank].unk0_7)
        sub_8141828(gActiveBank, &gEnemyParty[gBattlePartyID[gActiveBank]]);
    if (gSprites[gUnknown_0300434C[gActiveBank]].callback == SpriteCallbackDummy
     && !ewram17810[gActiveBank].unk0_3)
    {
        DestroySprite(&gSprites[gUnknown_0300434C[gActiveBank]]);
        sub_8032984(gActiveBank, GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES));
        gBattleBankFunc[gActiveBank] = sub_8037D64;
    }
}

void sub_8037EF0(void)
{
    if (gReceivedRemoteLinkPlayers == 0)
    {
        m4aSongNumStop(SE_HINSI);
        gMain.inBattle = FALSE;
        gMain.callback1 = gPreBattleCallback1;
        SetMainCallback2(c2_8011A1C);
    }
}

void sub_8037F34(void)
{
    if (!gPaletteFade.active)
    {
        if (gBattleTypeFlags & BATTLE_TYPE_LINK)
        {
            sub_800832C();
            gBattleBankFunc[gActiveBank] = sub_8037EF0;
        }
        else
        {
            m4aSongNumStop(SE_HINSI);
            gMain.inBattle = FALSE;
            gMain.callback1 = gPreBattleCallback1;
            SetMainCallback2(gMain.savedCallback);
        }
    }
}

void sub_8037FAC(void)
{
    if (!ewram17810[gActiveBank].unk0_4)
        LinkOpponentBufferExecCompleted();
}

void sub_8037FD8(void)
{
    if (!ewram17810[gActiveBank].unk0_5)
        LinkOpponentBufferExecCompleted();
}

void LinkOpponentBufferExecCompleted(void)
{
    gBattleBankFunc[gActiveBank] = sub_803752C;
    if (gBattleTypeFlags & BATTLE_TYPE_LINK)
    {
        u8 playerId = GetMultiplayerId();

        PrepareBufferDataTransferLink(2, 4, &playerId);
        gBattleBufferA[gActiveBank][0] = 0x38;
    }
    else
    {
        gBattleExecBuffer &= ~gBitTable[gActiveBank];
    }
}

void LinkOpponentHandleGetAttributes(void)
{
    u8 buffer[0x100];
    u32 r6 = 0;
    u8 r4;
    s32 i;

    if (gBattleBufferA[gActiveBank][2] == 0)
    {
        r6 = dp01_getattr_by_ch1_for_player_pokemon__(gBattlePartyID[gActiveBank], buffer);
    }
    else
    {
        r4 = gBattleBufferA[gActiveBank][2];
        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                r6 += dp01_getattr_by_ch1_for_player_pokemon__(i, buffer + r6);
            r4 >>= 1;
        }
    }
    Emitcmd29(1, r6, buffer);
    LinkOpponentBufferExecCompleted();
}

u32 dp01_getattr_by_ch1_for_player_pokemon__(u8 a, u8 *buffer)
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
        battlePokemon.species = GetMonData(&gEnemyParty[a], MON_DATA_SPECIES);
        battlePokemon.item = GetMonData(&gEnemyParty[a], MON_DATA_HELD_ITEM);
        for (size = 0; size < 4; size++)
        {
            battlePokemon.moves[size] = GetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + size);
            battlePokemon.pp[size] = GetMonData(&gEnemyParty[a], MON_DATA_PP1 + size);
        }
        battlePokemon.ppBonuses = GetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES);
        battlePokemon.friendship = GetMonData(&gEnemyParty[a], MON_DATA_FRIENDSHIP);
        battlePokemon.experience = GetMonData(&gEnemyParty[a], MON_DATA_EXP);
        battlePokemon.hpIV = GetMonData(&gEnemyParty[a], MON_DATA_HP_IV);
        battlePokemon.attackIV = GetMonData(&gEnemyParty[a], MON_DATA_ATK_IV);
        battlePokemon.defenseIV = GetMonData(&gEnemyParty[a], MON_DATA_DEF_IV);
        battlePokemon.speedIV = GetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV);
        battlePokemon.spAttackIV = GetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV);
        battlePokemon.spDefenseIV = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV);
        battlePokemon.personality = GetMonData(&gEnemyParty[a], MON_DATA_PERSONALITY);
        battlePokemon.status1 = GetMonData(&gEnemyParty[a], MON_DATA_STATUS);
        battlePokemon.level = GetMonData(&gEnemyParty[a], MON_DATA_LEVEL);
        battlePokemon.hp = GetMonData(&gEnemyParty[a], MON_DATA_HP);
        battlePokemon.maxHP = GetMonData(&gEnemyParty[a], MON_DATA_MAX_HP);
        battlePokemon.attack = GetMonData(&gEnemyParty[a], MON_DATA_ATK);
        battlePokemon.defense = GetMonData(&gEnemyParty[a], MON_DATA_DEF);
        battlePokemon.speed = GetMonData(&gEnemyParty[a], MON_DATA_SPEED);
        battlePokemon.spAttack = GetMonData(&gEnemyParty[a], MON_DATA_SPATK);
        battlePokemon.spDefense = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF);
        battlePokemon.isEgg = GetMonData(&gEnemyParty[a], MON_DATA_IS_EGG);
        battlePokemon.altAbility = GetMonData(&gEnemyParty[a], MON_DATA_ALT_ABILITY);
        battlePokemon.otId = GetMonData(&gEnemyParty[a], MON_DATA_OT_ID);
        GetMonData(&gEnemyParty[a], MON_DATA_NICKNAME, nickname);
        StringCopy10(battlePokemon.nickname, nickname);
        GetMonData(&gEnemyParty[a], MON_DATA_OT_NAME, battlePokemon.otName);

        MEMCPY_ALT(&battlePokemon, buffer, sizeof(battlePokemon), size, src);
        break;
    case 1:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_SPECIES);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 2:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_HELD_ITEM);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 3:
        for (size = 0; size < 4; size++)
        {
            moveData.moves[size] = GetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + size);
            moveData.pp[size] = GetMonData(&gEnemyParty[a], MON_DATA_PP1 + size);
        }
        moveData.ppBonuses = GetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES);
        MEMCPY_ALT(&moveData, buffer, sizeof(moveData), size, src);
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + gBattleBufferA[gActiveBank][1] - 4);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 8:
        for (size = 0; size < 4; size++)
            buffer[size] = GetMonData(&gEnemyParty[a], MON_DATA_PP1 + size);
        buffer[size] = GetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES);
        size++;
        break;
    case 9:
    case 10:
    case 11:
    case 12:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_PP1 + gBattleBufferA[gActiveBank][1] - 9);
        size = 1;
        break;
    case 17:
        data32 = GetMonData(&gEnemyParty[a], MON_DATA_OT_ID);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case 18:
        data32 = GetMonData(&gEnemyParty[a], MON_DATA_EXP);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        size = 3;
        break;
    case 19:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_HP_EV);
        size = 1;
        break;
    case 20:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_ATK_EV);
        size = 1;
        break;
    case 21:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_DEF_EV);
        size = 1;
        break;
    case 22:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPEED_EV);
        size = 1;
        break;
    case 23:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPATK_EV);
        size = 1;
        break;
    case 24:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF_EV);
        size = 1;
        break;
    case 25:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_FRIENDSHIP);
        size = 1;
        break;
    case 26:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_POKERUS);
        size = 1;
        break;
    case 27:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_MET_LOCATION);
        size = 1;
        break;
    case 28:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_MET_LEVEL);
        size = 1;
        break;
    case 29:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_MET_GAME);
        size = 1;
        break;
    case 30:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_POKEBALL);
        size = 1;
        break;
    case 31:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_HP_IV);
        buffer[1] = GetMonData(&gEnemyParty[a], MON_DATA_ATK_IV);
        buffer[2] = GetMonData(&gEnemyParty[a], MON_DATA_DEF_IV);
        buffer[3] = GetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV);
        buffer[4] = GetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV);
        buffer[5] = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV);
        size = 6;
        break;
    case 32:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_HP_IV);
        size = 1;
        break;
    case 33:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_ATK_IV);
        size = 1;
        break;
    case 34:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_DEF_IV);
        size = 1;
        break;
    case 35:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV);
        size = 1;
        break;
    case 36:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV);
        size = 1;
        break;
    case 37:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV);
        size = 1;
        break;
    case 38:
        data32 = GetMonData(&gEnemyParty[a], MON_DATA_PERSONALITY);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        buffer[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case 39:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_CHECKSUM);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 40:
        data32 = GetMonData(&gEnemyParty[a], MON_DATA_STATUS);
        buffer[0] = (data32 & 0x000000FF);
        buffer[1] = (data32 & 0x0000FF00) >> 8;
        buffer[2] = (data32 & 0x00FF0000) >> 16;
        buffer[3] = (data32 & 0xFF000000) >> 24;
        size = 4;
        break;
    case 41:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_LEVEL);
        size = 1;
        break;
    case 42:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_HP);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 43:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_MAX_HP);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 44:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_ATK);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 45:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_DEF);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 46:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_SPEED);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 47:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_SPATK);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 48:
        data16 = GetMonData(&gEnemyParty[a], MON_DATA_SPDEF);
        buffer[0] = data16;
        buffer[1] = data16 >> 8;
        size = 2;
        break;
    case 49:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_COOL);
        size = 1;
        break;
    case 50:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_BEAUTY);
        size = 1;
        break;
    case 51:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_CUTE);
        size = 1;
        break;
    case 52:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SMART);
        size = 1;
        break;
    case 53:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_TOUGH);
        size = 1;
        break;
    case 54:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SHEEN);
        size = 1;
        break;
    case 55:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_COOL_RIBBON);
        size = 1;
        break;
    case 56:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_BEAUTY_RIBBON);
        size = 1;
        break;
    case 57:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_CUTE_RIBBON);
        size = 1;
        break;
    case 58:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_SMART_RIBBON);
        size = 1;
        break;
    case 59:
        buffer[0] = GetMonData(&gEnemyParty[a], MON_DATA_TOUGH_RIBBON);
        size = 1;
        break;
    }
    return size;
}

void LinkOpponentHandlecmd1(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleSetAttributes(void)
{
    u8 i;
    u8 r4;

    if (gBattleBufferA[gActiveBank][2] == 0)
    {
        sub_8038900(gBattlePartyID[gActiveBank]);
    }
    else
    {
        r4 = gBattleBufferA[gActiveBank][2];
        for (i = 0; i < 6; i++)
        {
            if (r4 & 1)
                sub_8038900(i);
            r4 >>= 1;
        }
    }
    LinkOpponentBufferExecCompleted();
}

void sub_8038900(u8 a)
{
    struct BattlePokemon *battlePokemon = (struct BattlePokemon *)&gBattleBufferA[gActiveBank][3];
    struct UnknownStruct3 *moveData = (struct UnknownStruct3 *)&gBattleBufferA[gActiveBank][3];
    s32 i;

    switch (gBattleBufferA[gActiveBank][1])
    {
    case 0:
        {
            u8 iv;

            SetMonData(&gEnemyParty[a], MON_DATA_SPECIES, &battlePokemon->species);
            SetMonData(&gEnemyParty[a], MON_DATA_HELD_ITEM, &battlePokemon->item);
            for (i = 0; i < 4; i++)
            {
                SetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + i, &battlePokemon->moves[i]);
                SetMonData(&gEnemyParty[a], MON_DATA_PP1 + i, &battlePokemon->pp[i]);
            }
            SetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES, &battlePokemon->ppBonuses);
            SetMonData(&gEnemyParty[a], MON_DATA_FRIENDSHIP, &battlePokemon->friendship);
            SetMonData(&gEnemyParty[a], MON_DATA_EXP, &battlePokemon->experience);
            iv = battlePokemon->hpIV;
            SetMonData(&gEnemyParty[a], MON_DATA_HP_IV, &iv);
            iv = battlePokemon->attackIV;
            SetMonData(&gEnemyParty[a], MON_DATA_ATK_IV, &iv);
            iv = battlePokemon->defenseIV;
            SetMonData(&gEnemyParty[a], MON_DATA_DEF_IV, &iv);
            iv = battlePokemon->speedIV;
            SetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV, &iv);
            iv = battlePokemon->spAttackIV;
            SetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV, &iv);
            iv = battlePokemon->spDefenseIV;
            SetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV, &iv);
            SetMonData(&gEnemyParty[a], MON_DATA_PERSONALITY, &battlePokemon->personality);
            SetMonData(&gEnemyParty[a], MON_DATA_STATUS, &battlePokemon->status1);
            SetMonData(&gEnemyParty[a], MON_DATA_LEVEL, &battlePokemon->level);
            SetMonData(&gEnemyParty[a], MON_DATA_HP, &battlePokemon->hp);
            SetMonData(&gEnemyParty[a], MON_DATA_MAX_HP, &battlePokemon->maxHP);
            SetMonData(&gEnemyParty[a], MON_DATA_ATK, &battlePokemon->attack);
            SetMonData(&gEnemyParty[a], MON_DATA_DEF, &battlePokemon->defense);
            SetMonData(&gEnemyParty[a], MON_DATA_SPEED, &battlePokemon->speed);
            SetMonData(&gEnemyParty[a], MON_DATA_SPATK, &battlePokemon->spAttack);
            SetMonData(&gEnemyParty[a], MON_DATA_SPDEF, &battlePokemon->spDefense);
        }
        break;
    case 1:
        SetMonData(&gEnemyParty[a], MON_DATA_SPECIES, &gBattleBufferA[gActiveBank][3]);
        break;
    case 2:
        SetMonData(&gEnemyParty[a], MON_DATA_HELD_ITEM, &gBattleBufferA[gActiveBank][3]);
        break;
    case 3:
        for (i = 0; i < 4; i++)
        {
            SetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + i, &moveData->moves[i]);
            SetMonData(&gEnemyParty[a], MON_DATA_PP1 + i, &moveData->pp[i]);
        }
        SetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES, &moveData->ppBonuses);
        break;
    case 4:
    case 5:
    case 6:
    case 7:
        SetMonData(&gEnemyParty[a], MON_DATA_MOVE1 + gBattleBufferA[gActiveBank][1] - 4, &gBattleBufferA[gActiveBank][3]);
        break;
    case 8:
        SetMonData(&gEnemyParty[a], MON_DATA_PP1, &gBattleBufferA[gActiveBank][3]);
        SetMonData(&gEnemyParty[a], MON_DATA_PP2, &gBattleBufferA[gActiveBank][4]);
        SetMonData(&gEnemyParty[a], MON_DATA_PP3, &gBattleBufferA[gActiveBank][5]);
        SetMonData(&gEnemyParty[a], MON_DATA_PP4, &gBattleBufferA[gActiveBank][6]);
        SetMonData(&gEnemyParty[a], MON_DATA_PP_BONUSES, &gBattleBufferA[gActiveBank][7]);
        break;
    case 9:
    case 10:
    case 11:
    case 12:
        SetMonData(&gEnemyParty[a], MON_DATA_PP1 + gBattleBufferA[gActiveBank][1] - 9, &gBattleBufferA[gActiveBank][3]);
        break;
    case 17:
        SetMonData(&gEnemyParty[a], MON_DATA_OT_ID, &gBattleBufferA[gActiveBank][3]);
        break;
    case 18:
        SetMonData(&gEnemyParty[a], MON_DATA_EXP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 19:
        SetMonData(&gEnemyParty[a], MON_DATA_HP_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 20:
        SetMonData(&gEnemyParty[a], MON_DATA_ATK_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 21:
        SetMonData(&gEnemyParty[a], MON_DATA_DEF_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 22:
        SetMonData(&gEnemyParty[a], MON_DATA_SPEED_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 23:
        SetMonData(&gEnemyParty[a], MON_DATA_SPATK_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 24:
        SetMonData(&gEnemyParty[a], MON_DATA_SPDEF_EV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 25:
        SetMonData(&gEnemyParty[a], MON_DATA_FRIENDSHIP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 26:
        SetMonData(&gEnemyParty[a], MON_DATA_POKERUS, &gBattleBufferA[gActiveBank][3]);
        break;
    case 27:
        SetMonData(&gEnemyParty[a], MON_DATA_MET_LOCATION, &gBattleBufferA[gActiveBank][3]);
        break;
    case 28:
        SetMonData(&gEnemyParty[a], MON_DATA_MET_LEVEL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 29:
        SetMonData(&gEnemyParty[a], MON_DATA_MET_GAME, &gBattleBufferA[gActiveBank][3]);
        break;
    case 30:
        SetMonData(&gEnemyParty[a], MON_DATA_POKEBALL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 31:
        SetMonData(&gEnemyParty[a], MON_DATA_HP_IV, &gBattleBufferA[gActiveBank][3]);
        SetMonData(&gEnemyParty[a], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBank][4]);
        SetMonData(&gEnemyParty[a], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBank][5]);
        SetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBank][6]);
        SetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBank][7]);
        SetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBank][8]);
        break;
    case 32:
        SetMonData(&gEnemyParty[a], MON_DATA_HP_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 33:
        SetMonData(&gEnemyParty[a], MON_DATA_ATK_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 34:
        SetMonData(&gEnemyParty[a], MON_DATA_DEF_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 35:
        SetMonData(&gEnemyParty[a], MON_DATA_SPEED_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 36:
        SetMonData(&gEnemyParty[a], MON_DATA_SPATK_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 37:
        SetMonData(&gEnemyParty[a], MON_DATA_SPDEF_IV, &gBattleBufferA[gActiveBank][3]);
        break;
    case 38:
        SetMonData(&gEnemyParty[a], MON_DATA_PERSONALITY, &gBattleBufferA[gActiveBank][3]);
        break;
    case 39:
        SetMonData(&gEnemyParty[a], MON_DATA_CHECKSUM, &gBattleBufferA[gActiveBank][3]);
        break;
    case 40:
        SetMonData(&gEnemyParty[a], MON_DATA_STATUS, &gBattleBufferA[gActiveBank][3]);
        break;
    case 41:
        SetMonData(&gEnemyParty[a], MON_DATA_LEVEL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 42:
        SetMonData(&gEnemyParty[a], MON_DATA_HP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 43:
        SetMonData(&gEnemyParty[a], MON_DATA_MAX_HP, &gBattleBufferA[gActiveBank][3]);
        break;
    case 44:
        SetMonData(&gEnemyParty[a], MON_DATA_ATK, &gBattleBufferA[gActiveBank][3]);
        break;
    case 45:
        SetMonData(&gEnemyParty[a], MON_DATA_DEF, &gBattleBufferA[gActiveBank][3]);
        break;
    case 46:
        SetMonData(&gEnemyParty[a], MON_DATA_SPEED, &gBattleBufferA[gActiveBank][3]);
        break;
    case 47:
        SetMonData(&gEnemyParty[a], MON_DATA_SPATK, &gBattleBufferA[gActiveBank][3]);
        break;
    case 48:
        SetMonData(&gEnemyParty[a], MON_DATA_SPDEF, &gBattleBufferA[gActiveBank][3]);
        break;
    case 49:
        SetMonData(&gEnemyParty[a], MON_DATA_COOL, &gBattleBufferA[gActiveBank][3]);
        break;
    case 50:
        SetMonData(&gEnemyParty[a], MON_DATA_BEAUTY, &gBattleBufferA[gActiveBank][3]);
        break;
    case 51:
        SetMonData(&gEnemyParty[a], MON_DATA_CUTE, &gBattleBufferA[gActiveBank][3]);
        break;
    case 52:
        SetMonData(&gEnemyParty[a], MON_DATA_SMART, &gBattleBufferA[gActiveBank][3]);
        break;
    case 53:
        SetMonData(&gEnemyParty[a], MON_DATA_TOUGH, &gBattleBufferA[gActiveBank][3]);
        break;
    case 54:
        SetMonData(&gEnemyParty[a], MON_DATA_SHEEN, &gBattleBufferA[gActiveBank][3]);
        break;
    case 55:
        SetMonData(&gEnemyParty[a], MON_DATA_COOL_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 56:
        SetMonData(&gEnemyParty[a], MON_DATA_BEAUTY_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 57:
        SetMonData(&gEnemyParty[a], MON_DATA_CUTE_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 58:
        SetMonData(&gEnemyParty[a], MON_DATA_SMART_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    case 59:
        SetMonData(&gEnemyParty[a], MON_DATA_TOUGH_RIBBON, &gBattleBufferA[gActiveBank][3]);
        break;
    }
}

void LinkOpponentHandlecmd3(void)
{
    u8 *dst;
    u8 i;

    MEMSET_ALT(&gEnemyParty[gBattlePartyID[gActiveBank]] + gBattleBufferA[gActiveBank][1], 
        gBattleBufferA[gActiveBank][3 + i], gBattleBufferA[gActiveBank][2], i, dst);

    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleLoadPokeSprite(void)
{
    u16 species = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES);

    BattleLoadOpponentMonSprite(&gEnemyParty[gBattlePartyID[gActiveBank]], gActiveBank);
    GetMonSpriteTemplate_803C56C(species, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      sub_8077ABC(gActiveBank, 2),
      sub_8077F68(gActiveBank),
      sub_8079E90(gActiveBank));
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = -240;
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = gActiveBank;
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = gActiveBank;
    StartSpriteAnim(&gSprites[gObjectBankIDs[gActiveBank]], gBattleMonForms[gActiveBank]);
    sub_8032984(gActiveBank, GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES));
    gBattleBankFunc[gActiveBank] = sub_8037A74;
}

void LinkOpponentHandleSendOutPoke(void)
{
    gBattlePartyID[gActiveBank] = gBattleBufferA[gActiveBank][1];
    sub_8039430(gActiveBank, gBattleBufferA[gActiveBank][2]);
    gBattleBankFunc[gActiveBank] = sub_8037E30;
}

void sub_8039430(u8 a, u8 b)
{
    u16 species;

    sub_8032AA8(a, b);
    gBattlePartyID[a] = gBattleBufferA[a][1];
    species = GetMonData(&gEnemyParty[gBattlePartyID[a]], MON_DATA_SPECIES);
    gUnknown_0300434C[a] = CreateInvisibleSpriteWithCallback(sub_80312F0);
    BattleLoadOpponentMonSprite(&gEnemyParty[gBattlePartyID[a]], a);
    GetMonSpriteTemplate_803C56C(species, GetBankIdentity(a));
    gObjectBankIDs[a] = CreateSprite(
      &gUnknown_02024E8C,
      sub_8077ABC(a, 2),
      sub_8077F68(a),
      sub_8079E90(a));
    gSprites[gUnknown_0300434C[a]].data[1] = gObjectBankIDs[a];
    gSprites[gObjectBankIDs[a]].data[0] = a;
    gSprites[gObjectBankIDs[a]].data[2] = species;
    gSprites[gObjectBankIDs[a]].oam.paletteNum = a;
    StartSpriteAnim(&gSprites[gObjectBankIDs[a]], gBattleMonForms[a]);
    gSprites[gObjectBankIDs[a]].invisible = TRUE;
    gSprites[gObjectBankIDs[a]].callback = SpriteCallbackDummy;
    gSprites[gUnknown_0300434C[a]].data[0] = sub_8046400(0, 0xFE);
}

void LinkOpponentHandleReturnPokeToBall(void)
{
    if (gBattleBufferA[gActiveBank][1] == 0)
    {
        ewram17810[gActiveBank].unk4 = 0;
        gBattleBankFunc[gActiveBank] = sub_8039648;
    }
    else
    {
        FreeSpriteOamMatrix(&gSprites[gObjectBankIDs[gActiveBank]]);
        DestroySprite(&gSprites[gObjectBankIDs[gActiveBank]]);
        sub_8032A08(gActiveBank);
        sub_8043DB0(gHealthboxIDs[gActiveBank]);
        LinkOpponentBufferExecCompleted();
    }
}

void sub_8039648(void)
{
    switch (ewram17810[gActiveBank].unk4)
    {
    case 0:
        if (ewram17800[gActiveBank].substituteSprite)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        ewram17810[gActiveBank].unk4 = 1;
        break;
    case 1:
        if (!ewram17810[gActiveBank].unk0_6)
        {
            ewram17810[gActiveBank].unk4 = 0;
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 2);
            gBattleBankFunc[gActiveBank] = sub_8037BBC;
        }
        break;
    }
}

void LinkOpponentHandleTrainerThrow(void)
{
    s16 xOffset;
    u32 gender;

    if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
    {
        if (GetBankIdentity(gActiveBank) & 2)
            xOffset = -16;
        else
            xOffset = 16;
        gender = gLinkPlayers[sub_803FC34(gActiveBank)].gender;
    }
    else
    {
        xOffset = 0;
        gender = gLinkPlayers[GetMultiplayerId() ^ 1].gender;
    }
    sub_8031A6C(gender, gActiveBank);
    GetMonSpriteTemplate_803C5A0(gender, GetBankIdentity(gActiveBank));
    gObjectBankIDs[gActiveBank] = CreateSprite(
      &gUnknown_02024E8C,
      176 + xOffset, 40 + 4 * (8 - gTrainerFrontPicCoords[gender].coords),
      sub_8079E90(gActiveBank));
    gSprites[gObjectBankIDs[gActiveBank]].pos2.x = -240;
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = 2;
    gSprites[gObjectBankIDs[gActiveBank]].oam.paletteNum = IndexOfSpritePaletteTag(gTrainerFrontPicPaletteTable[gender].tag);
    gSprites[gObjectBankIDs[gActiveBank]].data[5] = gSprites[gObjectBankIDs[gActiveBank]].oam.tileNum;
    gSprites[gObjectBankIDs[gActiveBank]].oam.tileNum = GetSpriteTileStartByTag(gTrainerFrontPicTable[gender].tag);
    gSprites[gObjectBankIDs[gActiveBank]].oam.affineParam = gender;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_80313A0;
    gBattleBankFunc[gActiveBank] = sub_803757C;
}

void LinkOpponentHandleTrainerSlide(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleTrainerSlideBack(void)
{
    oamt_add_pos2_onto_pos1(&gSprites[gObjectBankIDs[gActiveBank]]);
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = 35;
    gSprites[gObjectBankIDs[gActiveBank]].data[2] = 280;
    gSprites[gObjectBankIDs[gActiveBank]].data[4] = gSprites[gObjectBankIDs[gActiveBank]].pos1.y;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8078B34;
    StoreSpriteCallbackInData(&gSprites[gObjectBankIDs[gActiveBank]], SpriteCallbackDummy);
    gBattleBankFunc[gActiveBank] = sub_80375B4;
}

void LinkOpponentHandlecmd10(void)
{
    if (ewram17810[gActiveBank].unk4 == 0)
    {
        if (ewram17800[gActiveBank].substituteSprite)
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        ewram17810[gActiveBank].unk4++;
    }
    else if (!ewram17810[gActiveBank].unk0_6)
    {
        ewram17810[gActiveBank].unk4 = 0;
        PlaySE12WithPanning(SE_POKE_DEAD, 63);
        gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8010384;
        gBattleBankFunc[gActiveBank] = sub_8037B78;
    }
}

void LinkOpponentHandlecmd11(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd12(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleBallThrow(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlePuase(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleMoveAnimation(void)
{
    if (!mplay_80342A4(gActiveBank))
    {
        u32 r0 = gBattleBufferA[gActiveBank][1]
               | (gBattleBufferA[gActiveBank][2] << 8);

        gUnknown_0202F7C4 = gBattleBufferA[gActiveBank][3];
        gMovePowerMoveAnim = gBattleBufferA[gActiveBank][4]
                          | (gBattleBufferA[gActiveBank][5] << 8);
        gMoveDmgMoveAnim = gBattleBufferA[gActiveBank][6]
                          | (gBattleBufferA[gActiveBank][7] << 8)
                          | (gBattleBufferA[gActiveBank][8] << 16)
                          | (gBattleBufferA[gActiveBank][9] << 24);
        gHappinessMoveAnim = gBattleBufferA[gActiveBank][10];
        gWeatherMoveAnim = gBattleBufferA[gActiveBank][12]
                          | (gBattleBufferA[gActiveBank][13] << 8);
        gDisableStructMoveAnim = (u32 *)&gBattleBufferA[gActiveBank][16];
        gPID_perBank[gActiveBank] = *gDisableStructMoveAnim;

        // Dead code. sub_8031720 always returns 0.
        if (sub_8031720(r0, gUnknown_0202F7C4) != 0)
        {
            LinkOpponentBufferExecCompleted();
        }
        else
        {
            ewram17810[gActiveBank].unk4 = 0;
            gBattleBankFunc[gActiveBank] = sub_8039B64;
        }
    }
}

void sub_8039B64(void)
{
    u16 r4 = gBattleBufferA[gActiveBank][1]
           | (gBattleBufferA[gActiveBank][2] << 8);
    u8 r7 = gBattleBufferA[gActiveBank][11];

    switch (ewram17810[gActiveBank].unk4)
    {
    case 0:
        if (ewram17800[gActiveBank].substituteSprite && !ewram17800[gActiveBank].unk0_3)
        {
            ewram17800[gActiveBank].unk0_3 = 1;
            move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 5);
        }
        ewram17810[gActiveBank].unk4 = 1;
        break;
    case 1:
        if (!ewram17810[gActiveBank].unk0_6)
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
            if ((ewram17800[gActiveBank].substituteSprite) && r7 <= 1)
            {
                move_anim_start_t4(gActiveBank, gActiveBank, gActiveBank, 6);
                ewram17800[gActiveBank].unk0_3 = 0;
            }
            ewram17810[gActiveBank].unk4 = 3;
        }
        break;
    case 3:
        if (!ewram17810[gActiveBank].unk0_6)
        {
            sub_8031F24();
            sub_80324BC(
              gActiveBank,
              gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
            ewram17810[gActiveBank].unk4 = 0;
            LinkOpponentBufferExecCompleted();
        }
        break;
    }
}

void LinkOpponentHandlePrintString(void)
{
    gUnknown_030042A4 = 0;
    gUnknown_030042A0 = 0;
    BufferStringBattle(*(u16 *)&gBattleBufferA[gActiveBank][2]);
    sub_8002EB0(&gUnknown_03004210, gDisplayedStringBattle, 144, 2, 15);
    gBattleBankFunc[gActiveBank] = sub_8037C2C;
}

void LinkOpponentHandlePrintStringPlayerOnly(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd18(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd19(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd20(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleOpenBag(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd22(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd23(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleHealthBarUpdate(void)
{
    s16 r7;

    load_gfxc_health_bar(0);
    r7 = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);
    if (r7 != 0x7FFF)
    {
        u32 maxHP = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_MAX_HP);
        u32 hp = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_HP);

        sub_8043D84(gActiveBank, gHealthboxIDs[gActiveBank], maxHP, hp, r7);
    }
    else
    {
        u32 maxHP = GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_MAX_HP);

        sub_8043D84(gActiveBank, gHealthboxIDs[gActiveBank], maxHP, 0, r7);
    }
    gBattleBankFunc[gActiveBank] = sub_8037B24;
}

void LinkOpponentHandleExpBarUpdate(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleStatusIconUpdate(void)
{
    if (mplay_80342A4(gActiveBank) == 0)
    {
        sub_8045A5C(gHealthboxIDs[gActiveBank], &gEnemyParty[gBattlePartyID[gActiveBank]], 9);
        ewram17810[gActiveBank].unk0_4 = 0;
        gBattleBankFunc[gActiveBank] = sub_8037FAC;
    }
}

void LinkOpponentHandleStatusAnimation(void)
{
    if (mplay_80342A4(gActiveBank) == 0)
    {
        move_anim_start_t2_for_situation(
          gBattleBufferA[gActiveBank][1],
          gBattleBufferA[gActiveBank][2]
          | (gBattleBufferA[gActiveBank][3] << 8)
          | (gBattleBufferA[gActiveBank][4] << 16)
          | (gBattleBufferA[gActiveBank][5] << 24));
        gBattleBankFunc[gActiveBank] = sub_8037FAC;
    }
}

void LinkOpponentHandleStatusXor(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd29(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleDMATransfer(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd31(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd32(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd33(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd34(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd35(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd36(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd37(void)
{
    gUnknown_020238C8.unk0_0 = 0;
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd38(void)
{
    gUnknown_020238C8.unk0_0 = gBattleBufferA[gActiveBank][1];
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd39(void)
{
    gUnknown_020238C8.unk0_7 = 0;
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd40(void)
{
    gUnknown_020238C8.unk0_7 ^= 1;
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleHitAnimation(void)
{
    if (gSprites[gObjectBankIDs[gActiveBank]].invisible == TRUE)
    {
        LinkOpponentBufferExecCompleted();
    }
    else
    {
        gDoingBattleAnim = TRUE;
        gSprites[gObjectBankIDs[gActiveBank]].data[1] = 0;
        sub_8047858(gActiveBank);
        gBattleBankFunc[gActiveBank] = dp01t_0F_4_move_anim;
    }
}

void LinkOpponentHandlecmd42(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleEffectivenessSound(void)
{
    s8 pan;

    if (GetBankSide(gActiveBank) == 0)
        pan = -64;
    else
        pan = 63;
    PlaySE12WithPanning(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8), pan);
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd44(void)
{
    PlayFanfare(gBattleBufferA[gActiveBank][1] | (gBattleBufferA[gActiveBank][2] << 8));
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleFaintingCry(void)
{
    PlayCry3(
      GetMonData(&gEnemyParty[gBattlePartyID[gActiveBank]], MON_DATA_SPECIES),
      25, 5);
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleIntroSlide(void)
{
    sub_80E43C0(gBattleBufferA[gActiveBank][1]);
    gUnknown_02024DE8 |= 1;
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleTrainerBallThrow(void)
{
    u8 taskId;

    oamt_add_pos2_onto_pos1(&gSprites[gObjectBankIDs[gActiveBank]]);
    gSprites[gObjectBankIDs[gActiveBank]].data[0] = 35;
    gSprites[gObjectBankIDs[gActiveBank]].data[2] = 280;
    gSprites[gObjectBankIDs[gActiveBank]].data[4] = gSprites[gObjectBankIDs[gActiveBank]].pos1.y;
    gSprites[gObjectBankIDs[gActiveBank]].callback = sub_8078B34;
    StoreSpriteCallbackInData(&gSprites[gObjectBankIDs[gActiveBank]], sub_803A3A8);
    taskId = CreateTask(sub_803A2C4, 5);
    gTasks[taskId].data[0] = gActiveBank;
    if (ewram17810[gActiveBank].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBank]].func = sub_8044CA0;
    ewram17840.unk9_0 = 1;
    gBattleBankFunc[gActiveBank] = nullsub_47;
}

void sub_803A2C4(u8 taskId)
{
    u8 r9;

    r9 = gActiveBank;
    gActiveBank = gTasks[taskId].data[0];
    if (!IsDoubleBattle() || (gBattleTypeFlags & BATTLE_TYPE_MULTI))
    {
        gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
        sub_8039430(gActiveBank, 0);
    }
    else
    {
        gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
        sub_8039430(gActiveBank, 0);
        gActiveBank ^= 2;
        gBattleBufferA[gActiveBank][1] = gBattlePartyID[gActiveBank];
        sub_8039430(gActiveBank, 0);
        gActiveBank ^= 2;
    }
    gBattleBankFunc[gActiveBank] = sub_8037840;
    gActiveBank = r9;
    DestroyTask(taskId);
}

void sub_803A3A8(struct Sprite *sprite)
{
    sub_8031B74(sprite->oam.affineParam);
    sprite->oam.tileNum = sprite->data[5];
    FreeSpriteOamMatrix(sprite);
    DestroySprite(sprite);
}

void LinkOpponentHandlecmd48(void)
{
    if (gBattleBufferA[gActiveBank][1] != 0 && GetBankSide(gActiveBank) == 0)
    {
        LinkOpponentBufferExecCompleted();
        return;
    }

    ewram17810[gActiveBank].unk0_0 = 1;
    if (gBattleBufferA[gActiveBank][2] != 0)
    {
        if (ewram17810[gActiveBank].unk1_1 < 2)
        {
            ewram17810[gActiveBank].unk1_1++;
            return;
        }
        else
        {
            ewram17810[gActiveBank].unk1_1 = 0;
        }
    }
    gUnknown_02024E68[gActiveBank] = sub_8044804(
      gActiveBank,
      (struct BattleInterfaceStruct2 *)&gBattleBufferA[gActiveBank][4],
      gBattleBufferA[gActiveBank][1],
      gBattleBufferA[gActiveBank][2]);
    ewram17810[gActiveBank].unk5 = 0;
    if (gBattleBufferA[gActiveBank][2] != 0)
        ewram17810[gActiveBank].unk5 = 0x5D;
    gBattleBankFunc[gActiveBank] = sub_803A4E0;
}

void sub_803A4E0(void)
{
    if (ewram17810[gActiveBank].unk5++ >= 93)
    {
        ewram17810[gActiveBank].unk5 = 0;
        LinkOpponentBufferExecCompleted();
    }
}

void LinkOpponentHandlecmd49(void)
{
    if (ewram17810[gActiveBank].unk0_0)
        gTasks[gUnknown_02024E68[gActiveBank]].func = sub_8044CA0;
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd50(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleSpriteInvisibility(void)
{
    if (AnimBankSpriteExists(gActiveBank) != 0)
    {
        gSprites[gObjectBankIDs[gActiveBank]].invisible = gBattleBufferA[gActiveBank][1];
        sub_8031F88(gActiveBank);
    }
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleBattleAnimation(void)
{
    if (mplay_80342A4(gActiveBank) == 0)
    {
        u8 r3 = gBattleBufferA[gActiveBank][1];
        u16 r4 = gBattleBufferA[gActiveBank][2] | (gBattleBufferA[gActiveBank][3] << 8);

        if (move_anim_start_t3(gActiveBank, gActiveBank, gActiveBank, r3, r4) != 0)
            LinkOpponentBufferExecCompleted();
        else
            gBattleBankFunc[gActiveBank] = sub_8037FD8;
    }
}

void LinkOpponentHandleLinkStandbyMsg(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandleResetActionMoveSelection(void)
{
    LinkOpponentBufferExecCompleted();
}

void LinkOpponentHandlecmd55(void)
{
    if (gBattleBufferA[gActiveBank][1] == 3)
        gBattleOutcome = gBattleBufferA[gActiveBank][1];
    else
        gBattleOutcome = gBattleBufferA[gActiveBank][1] ^ 3;
    FadeOutMapMusic(5);
    BeginFastPaletteFade(3);
    LinkOpponentBufferExecCompleted();
    gBattleBankFunc[gActiveBank] = sub_8037F34;
}

void LinkOpponentHandlecmd56(void)
{
}
