#include "global.h"
#include "battle_anim.h"
#include "battle.h"
#include "battle_anim_80CA710.h"
#include "battle_interface.h"
#include "contest.h"
#include "decompress.h"
#include "m4a.h"
#include "main.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "sprite.h"
#include "task.h"
#include "ewram.h"

// sprites start at 10000 and thus must be subtracted of 10000 to account for the true index.
#define GET_TRUE_SPRITE_INDEX(i) (i - 10000)

extern u16 gBattlePartyID[4];
extern u8 gObjectBankIDs[];
extern u8 gBankAttacker;
extern u8 gBankTarget;
EWRAM_DATA const u8 *gBattleAnimScriptPtr = NULL;
EWRAM_DATA const u8 *gBattleAnimScriptRetAddr = NULL;
EWRAM_DATA void (*gAnimScriptCallback)(void) = NULL;
EWRAM_DATA s8 gAnimFramesToWait = 0;
EWRAM_DATA u8 gAnimScriptActive = FALSE;
EWRAM_DATA u8 gAnimVisualTaskCount = 0;
EWRAM_DATA u8 gAnimSoundTaskCount = 0;
EWRAM_DATA u32 gDisableStructMoveAnim = 0;
EWRAM_DATA u32 gMoveDmgMoveAnim = 0;
EWRAM_DATA u16 gMovePowerMoveAnim = 0;
EWRAM_DATA u8 gHappinessMoveAnim = 0;
EWRAM_DATA u16 gWeatherMoveAnim = 0;
EWRAM_DATA u8 gMonAnimTaskIdArray[2] = {0};
EWRAM_DATA u8 gUnknown_0202F7C4 = 0;
EWRAM_DATA u8 gUnknown_0202F7C5 = 0;
EWRAM_DATA u16 gAnimMoveIndex = 0; // set but unused.
EWRAM_DATA u8 gBattleAnimBankAttacker = 0;
EWRAM_DATA u8 gBattleAnimBankTarget = 0;
EWRAM_DATA u16 gUnknown_0202F7CA[4] = {0};
EWRAM_DATA u8 gUnknown_0202F7D2 = 0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_03004200;
extern u16 gUnknown_03004240;
extern u16 gUnknown_03004244;
extern u16 gUnknown_03004280;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_030042C4;

u16 gSoundAnimFramesToWait;
s16 gBattleAnimArgs[8];
u16 gAnimSpriteIndexArray[8];

extern struct MusicPlayerInfo gMPlay_BGM;
extern struct MusicPlayerInfo gMPlay_SE1;
extern struct MusicPlayerInfo gMPlay_SE2;

extern const u16 gUnknown_081C7160[];
extern const u8 *const gBattleAnims_Moves[];
extern const struct CompressedSpriteSheet gBattleAnimPicTable[];
extern const struct CompressedSpritePalette gBattleAnimPaletteTable[];
extern const struct BattleAnimBackground gBattleAnimBackgroundTable[];

static void RunAnimScriptCommand(void);
static void ScriptCmd_loadsprite(void);
static void ScriptCmd_unloadsprite(void);
static void ScriptCmd_sprite(void);
static void ScriptCmd_createtask(void);
static void ScriptCmd_delay(void);
static void ScriptCmd_waitforvisualfinish(void);
static void ScriptCmd_hang1(void);
static void ScriptCmd_hang2(void);
static void ScriptCmd_end(void);
static void ScriptCmd_playse(void);
static void ScriptCmd_monbg(void);
static void sub_8076380(void);
static void task_pA_ma0A_obj_to_bg_pal(u8);
static void ScriptCmd_clearmonbg(void);
static void sub_807672C(u8);
static void ScriptCmd_monbg_22(void);
static void ScriptCmd_clearmonbg_23(void);
static void sub_80769A4(u8);
static void ScriptCmd_setalpha(void);
static void ScriptCmd_setbldcnt(void);
static void ScriptCmd_blendoff(void);
static void ScriptCmd_call(void);
static void ScriptCmd_return(void);
static void ScriptCmd_setvar(void);
static void ScriptCmd_ifelse(void);
static void ScriptCmd_jumpif(void);
static void ScriptCmd_jump(void);
static void ScriptCmd_fadetobg(void);
static void ScriptCmd_fadetobg_25(void);
static void task_p5_load_battle_screen_elements(u8);
static void sub_8076DB8(u16);
static void dp01t_11_3_message_for_player_only(void);
static void ScriptCmd_restorebg(void);
static void ScriptCmd_waitbgfadeout(void);
static void ScriptCmd_waitbgfadein(void);
static void ScriptCmd_changebg(void);
static void ScriptCmd_panse_19(void);
static void ScriptCmd_setpan(void);
static void ScriptCmd_panse_1B(void);
static void c3_08073CEC(u8);
static void ScriptCmd_panse_26(void);
static void ScriptCmd_panse_27(void);
static void ScriptCmd_panse_1C(void);
static void sub_80774FC(u8);
static void ScriptCmd_panse_1D(void);
static void sub_80775CC(u8);
static void ScriptCmd_createtask_1F(void);
static void ScriptCmd_waitsound(void);
static void ScriptCmd_jumpvareq(void);
static void ScriptCmd_jumpunkcond(void);
static void ScriptCmd_monbgprio_28(void);
static void ScriptCmd_monbgprio_29(void);
static void ScriptCmd_monbgprio_2A(void);
static void ScriptCmd_invisible(void);
static void ScriptCmd_visible(void);
static void ScriptCmd_doublebattle_2D(void);
static void ScriptCmd_doublebattle_2E(void);
static void ScriptCmd_stopsound(void);

static void (*const sScriptCmdTable[])(void) = {
    ScriptCmd_loadsprite,
    ScriptCmd_unloadsprite,
    ScriptCmd_sprite,
    ScriptCmd_createtask,
    ScriptCmd_delay,
    ScriptCmd_waitforvisualfinish,
    ScriptCmd_hang1,
    ScriptCmd_hang2,
    ScriptCmd_end,
    ScriptCmd_playse,
    ScriptCmd_monbg,
    ScriptCmd_clearmonbg,
    ScriptCmd_setalpha,
    ScriptCmd_blendoff,
    ScriptCmd_call,
    ScriptCmd_return,
    ScriptCmd_setvar,
    ScriptCmd_ifelse,
    ScriptCmd_jumpif,
    ScriptCmd_jump,
    ScriptCmd_fadetobg,
    ScriptCmd_restorebg,
    ScriptCmd_waitbgfadeout,
    ScriptCmd_waitbgfadein,
    ScriptCmd_changebg,
    ScriptCmd_panse_19,
    ScriptCmd_setpan,
    ScriptCmd_panse_1B,
    ScriptCmd_panse_1C,
    ScriptCmd_panse_1D,
    ScriptCmd_setbldcnt,
    ScriptCmd_createtask_1F,
    ScriptCmd_waitsound,
    ScriptCmd_jumpvareq,
    ScriptCmd_monbg_22,
    ScriptCmd_clearmonbg_23,
    ScriptCmd_jumpunkcond,
    ScriptCmd_fadetobg_25,
    ScriptCmd_panse_26,
    ScriptCmd_panse_27,
    ScriptCmd_monbgprio_28,
    ScriptCmd_monbgprio_29,
    ScriptCmd_monbgprio_2A,
    ScriptCmd_invisible,
    ScriptCmd_visible,
    ScriptCmd_doublebattle_2D,
    ScriptCmd_doublebattle_2E,
    ScriptCmd_stopsound,
};

void battle_anim_clear_some_data(void)
{
    s32 i;

    gAnimFramesToWait = 0;
    gAnimScriptActive = FALSE;
    gAnimVisualTaskCount = 0;
    gAnimSoundTaskCount = 0;
    gDisableStructMoveAnim = 0;
    gMoveDmgMoveAnim = 0;
    gMovePowerMoveAnim = 0;
    gHappinessMoveAnim = 0;

    // clear index array.
    for (i = 0; i < 8; i++)
        gAnimSpriteIndexArray[i] |= 0xFFFF;

    // clear anim args.
    for (i = 0; i < 8; i++)
        gBattleAnimArgs[i] = 0;

    gMonAnimTaskIdArray[0] = 0xFF;
    gMonAnimTaskIdArray[1] = 0xFF;
    gUnknown_0202F7C4 = 0;
    gUnknown_0202F7C5 = 0;
    gAnimMoveIndex = 0;
    gBattleAnimBankAttacker = 0;
    gBattleAnimBankTarget = 0;
    gUnknown_0202F7D2 = 0;
}

void ExecuteMoveAnim(u16 move)
{
    gBattleAnimBankAttacker = gBankAttacker;
    gBattleAnimBankTarget = gBankTarget;
    DoMoveAnim(gBattleAnims_Moves, move, 1);
}

void DoMoveAnim(const u8 *const moveAnims[], u16 move, u8 c)
{
    s32 i;

    if (NotInBattle() == 0)
    {
        sub_8079E24();
        sub_8043EB4(0);
        for (i = 0; i < 4; i++)
        {
            if (GetBankSide(i) != 0)
                gUnknown_0202F7CA[i] = GetMonData(&gEnemyParty[gBattlePartyID[i]], MON_DATA_SPECIES);
            else
                gUnknown_0202F7CA[i] = GetMonData(&gPlayerParty[gBattlePartyID[i]], MON_DATA_SPECIES);
        }
    }
    else
    {
        for (i = 0; i < 4; i++)
            gUnknown_0202F7CA[i] = EWRAM_19348;
    }

    if (c == 0)
        gAnimMoveIndex = 0;
    else
        gAnimMoveIndex = move;

    for (i = 0; i < 8; i++)
        gBattleAnimArgs[i] = 0;

    gMonAnimTaskIdArray[0] = 0xFF;
    gMonAnimTaskIdArray[1] = 0xFF;
    gBattleAnimScriptPtr = moveAnims[move];
    gAnimScriptActive = TRUE;
    gAnimFramesToWait = 0;
    gAnimScriptCallback = RunAnimScriptCommand;

    for (i = 0; i < 8; i++)
        gAnimSpriteIndexArray[i] |= 0xFFFF;

    if (c != 0)
    {
        for (i = 0; gUnknown_081C7160[i] != 0xFFFF; i++)
        {
            if (move == gUnknown_081C7160[i])
            {
                m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 128);
                break;
            }
        }
    }

    gUnknown_030042C4 = 0;
    gUnknown_03004240 = 0;
    gUnknown_03004200 = 0;
    gUnknown_03004244 = 0;
}

void move_anim_8072740(struct Sprite *sprite)
{
    FreeSpriteOamMatrix(sprite);
    DestroySprite(sprite);
    gAnimVisualTaskCount--;
}

void DestroyAnimVisualTask(u8 taskId)
{
    DestroyTask(taskId);
    gAnimVisualTaskCount--;
}

void DestroyAnimSoundTask(u8 taskId)
{
    DestroyTask(taskId);
    gAnimSoundTaskCount--;
}

static void AddSpriteIndex(u16 index)
{
    s32 i;

    for (i = 0; i < 8; i++)
    {
        if (gAnimSpriteIndexArray[i] == 0xFFFF)
        {
            gAnimSpriteIndexArray[i] = index;
            return;
        }
    }
}

static void ClearSpriteIndex(u16 index)
{
    s32 i;

    for (i = 0; i < 8; i++)
    {
        if (gAnimSpriteIndexArray[i] == index)
        {
            gAnimSpriteIndexArray[i] |= 0xFFFF;
            return;
        }
    }
}

static void WaitAnimFrameCount(void)
{
    if (gAnimFramesToWait <= 0)
    {
        gAnimScriptCallback = RunAnimScriptCommand;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait--;
    }
}

static void RunAnimScriptCommand(void)
{
    do
    {
        sScriptCmdTable[T1_READ_8(gBattleAnimScriptPtr)]();
    } while (gAnimFramesToWait == 0 && gAnimScriptActive != FALSE);
}

static void ScriptCmd_loadsprite(void)
{
    u16 index;

    gBattleAnimScriptPtr++;
    index = T1_READ_16(gBattleAnimScriptPtr);
    LoadCompressedObjectPic(&gBattleAnimPicTable[GET_TRUE_SPRITE_INDEX(index)]);
    LoadCompressedObjectPalette(&gBattleAnimPaletteTable[GET_TRUE_SPRITE_INDEX(index)]);
    gBattleAnimScriptPtr += 2;
    AddSpriteIndex(GET_TRUE_SPRITE_INDEX(index));
    gAnimFramesToWait = 1;
    gAnimScriptCallback = WaitAnimFrameCount;
}

static void ScriptCmd_unloadsprite(void)
{
    u16 index;

    gBattleAnimScriptPtr++;
    index = T1_READ_16(gBattleAnimScriptPtr);
    FreeSpriteTilesByTag(gBattleAnimPicTable[GET_TRUE_SPRITE_INDEX(index)].tag);
    FreeSpritePaletteByTag(gBattleAnimPicTable[GET_TRUE_SPRITE_INDEX(index)].tag);
    gBattleAnimScriptPtr += 2;
    ClearSpriteIndex(GET_TRUE_SPRITE_INDEX(index));
}

#ifdef NONMATCHING
static void ScriptCmd_sprite(void)
{
    s32 i;
    struct SpriteTemplate *r7;
    u8 r4;
    u8 r0;
    u8 _r0;
    u16 r6;
    u8 r2;
    s8 r1;

    gBattleAnimScriptPtr++;
    r7 = (struct SpriteTemplate *)(T2_READ_32(gBattleAnimScriptPtr));
    gBattleAnimScriptPtr += 4;
    r4 = T1_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    r0 = T1_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    for (i = 0; i < r0; i++)
    {
        gBattleAnimArgs[i] = T1_READ_16(gBattleAnimScriptPtr);
        gBattleAnimScriptPtr += 2;
    }
    if (r4 & 0x80)
    {
        r4 ^= 0x80;
        if (r4 > 0x3F)
            r4 -= 0x40;
        else
            r4 = -r4;
        _r0 = sub_8079E90(gBattleAnimBankTarget);
        r1 = r4;

    }
    else
    {
        //_08075B44
        if (r4 > 0x3F)
            r4 -= 0x40;
        else
            r4 = -r4;
        _r0 = sub_8079E90(gBattleAnimBankAttacker);
        r1 = r4;
    }
    r6 = _r0 + r1;
    if ((s16)r6 < 3)
        r6 = 3;

    r4 = sub_8077ABC(gBattleAnimBankTarget, 2);
    r2 = sub_8077ABC(gBattleAnimBankTarget, 3);
    CreateSpriteAndAnimate(r7, r4, r2, r6);
    gAnimVisualTaskCount++;
}
#else
__attribute__((naked))
static void ScriptCmd_sprite(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    ldr r5, _08075B2C @ =gBattleAnimScriptPtr\n\
    ldr r1, [r5]\n\
    adds r3, r1, 0x1\n\
    str r3, [r5]\n\
    ldrb r2, [r1, 0x1]\n\
    ldrb r0, [r3, 0x1]\n\
    lsls r0, 8\n\
    adds r2, r0\n\
    ldrb r0, [r3, 0x2]\n\
    lsls r0, 16\n\
    adds r2, r0\n\
    ldrb r0, [r3, 0x3]\n\
    lsls r0, 24\n\
    adds r7, r2, r0\n\
    adds r0, r1, 0x5\n\
    str r0, [r5]\n\
    ldrb r4, [r1, 0x5]\n\
    adds r0, r1, 0x6\n\
    str r0, [r5]\n\
    ldrb r0, [r1, 0x6]\n\
    adds r1, 0x7\n\
    str r1, [r5]\n\
    cmp r0, 0\n\
    beq _08075B14\n\
    adds r6, r5, 0\n\
    ldr r5, _08075B30 @ =gBattleAnimArgs\n\
    adds r3, r0, 0\n\
_08075AFC:\n\
    ldr r2, [r6]\n\
    ldrb r1, [r2]\n\
    ldrb r0, [r2, 0x1]\n\
    lsls r0, 8\n\
    orrs r1, r0\n\
    strh r1, [r5]\n\
    adds r2, 0x2\n\
    str r2, [r6]\n\
    adds r5, 0x2\n\
    subs r3, 0x1\n\
    cmp r3, 0\n\
    bne _08075AFC\n\
_08075B14:\n\
    movs r0, 0x80\n\
    ands r0, r4\n\
    cmp r0, 0\n\
    beq _08075B44\n\
    movs r0, 0x80\n\
    eors r4, r0\n\
    cmp r4, 0x3F\n\
    bls _08075B34\n\
    adds r0, r4, 0\n\
    subs r0, 0x40\n\
    b _08075B36\n\
    .align 2, 0\n\
_08075B2C: .4byte gBattleAnimScriptPtr\n\
_08075B30: .4byte gBattleAnimArgs\n\
_08075B34:\n\
    negs r0, r4\n\
_08075B36:\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    ldr r0, _08075B40 @ =gBattleAnimBankTarget\n\
    b _08075B56\n\
    .align 2, 0\n\
_08075B40: .4byte gBattleAnimBankTarget\n\
_08075B44:\n\
    cmp r4, 0x3F\n\
    bls _08075B4E\n\
    adds r0, r4, 0\n\
    subs r0, 0x40\n\
    b _08075B50\n\
_08075B4E:\n\
    negs r0, r4\n\
_08075B50:\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    ldr r0, _08075BAC @ =gBattleAnimBankAttacker\n\
_08075B56:\n\
    ldrb r0, [r0]\n\
    bl sub_8079E90\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    lsls r1, r4, 24\n\
    asrs r1, 24\n\
    adds r0, r1\n\
    lsls r0, 16\n\
    lsrs r6, r0, 16\n\
    lsls r0, r6, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x2\n\
    bgt _08075B74\n\
    movs r6, 0x3\n\
_08075B74:\n\
    ldr r5, _08075BB0 @ =gBattleAnimBankTarget\n\
    ldrb r0, [r5]\n\
    movs r1, 0x2\n\
    bl sub_8077ABC\n\
    adds r4, r0, 0\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    ldrb r0, [r5]\n\
    movs r1, 0x3\n\
    bl sub_8077ABC\n\
    adds r2, r0, 0\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    lsls r3, r6, 24\n\
    lsrs r3, 24\n\
    adds r0, r7, 0\n\
    adds r1, r4, 0\n\
    bl CreateSpriteAndAnimate\n\
    ldr r1, _08075BB4 @ =gAnimVisualTaskCount\n\
    ldrb r0, [r1]\n\
    adds r0, 0x1\n\
    strb r0, [r1]\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08075BAC: .4byte gBattleAnimBankAttacker\n\
_08075BB0: .4byte gBattleAnimBankTarget\n\
_08075BB4: .4byte gAnimVisualTaskCount\n\
    .syntax divided\n");
}
#endif

static void ScriptCmd_createtask(void)
{
    TaskFunc taskFunc;
    u8 taskPriority;
    u8 taskId;
    u8 numArgs;
    s32 i;

    gBattleAnimScriptPtr++;
    taskFunc = (TaskFunc)T2_READ_32(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr += 4;
    taskPriority = T1_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    numArgs = T1_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;

    for (i = 0; i < numArgs; i++)
    {
        gBattleAnimArgs[i] = T1_READ_16(gBattleAnimScriptPtr);
        gBattleAnimScriptPtr += 2;
    }

    taskId = CreateTask(taskFunc, taskPriority);
    taskFunc(taskId);
    gAnimVisualTaskCount++;
}

static void ScriptCmd_delay(void)
{
    gBattleAnimScriptPtr++;
    gAnimFramesToWait = T1_READ_8(gBattleAnimScriptPtr);
    if (gAnimFramesToWait == 0)
        gAnimFramesToWait = -1;
    gBattleAnimScriptPtr++;
    gAnimScriptCallback = WaitAnimFrameCount;
}

// wait for visual tasks to finish.
static void ScriptCmd_waitforvisualfinish(void)
{
    if (gAnimVisualTaskCount == 0)
    {
        gBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait = 1;
    }
}

static void ScriptCmd_hang1(void)
{
}

static void ScriptCmd_hang2(void)
{
}

static void ScriptCmd_end(void)
{
    s32 i;
    bool32 continuousAnim = FALSE;

    // keep waiting as long as there is animations to be done.
    if (gAnimVisualTaskCount != 0 || gAnimSoundTaskCount != 0
     || gMonAnimTaskIdArray[0] != 0xFF || gMonAnimTaskIdArray[1] != 0xFF)
    {
        gSoundAnimFramesToWait = 0;
        gAnimFramesToWait = 1;
        return;
    }

    // finish the sound effects.
    if (IsSEPlaying())
    {
        if (++gSoundAnimFramesToWait <= 90) // wait 90 frames, then halt the sound effect.
        {
            gAnimFramesToWait = 1;
            return;
        }
        else
        {
            m4aMPlayStop(&gMPlay_SE1);
            m4aMPlayStop(&gMPlay_SE2);
        }
    }

    // the SE has halted, so set the SE Frame Counter to 0 and continue.
    gSoundAnimFramesToWait = 0;

    for (i = 0; i < 8; i++)
    {
        if (gAnimSpriteIndexArray[i] != 0xFFFF)
        {
            FreeSpriteTilesByTag(gBattleAnimPicTable[gAnimSpriteIndexArray[i]].tag);
            FreeSpritePaletteByTag(gBattleAnimPicTable[gAnimSpriteIndexArray[i]].tag);
            gAnimSpriteIndexArray[i] |= 0xFFFF; // set terminator.
        }
    }

    if (continuousAnim == FALSE) // may have been used for debug?
    {
        m4aMPlayVolumeControl(&gMPlay_BGM, 0xFFFF, 256);
        if (NotInBattle() == 0)
        {
            sub_8079E24();
            sub_8043EB4(1);
        }
        gAnimScriptActive = FALSE;
    }
}

static void ScriptCmd_playse(void)
{
    gBattleAnimScriptPtr++;
    PlaySE(T1_READ_16(gBattleAnimScriptPtr));
    gBattleAnimScriptPtr += 2;
}

static void ScriptCmd_monbg(void)
{
    u8 r6;
    u8 r5;
    u8 r0;
    u8 r7;
    u16 r4;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r6 = T1_READ_8(gBattleAnimScriptPtr);
    if (r6 == 0)
        r6 = 2;
    else if (r6 == 1)
        r6 = 3;
    if (r6 == 0 || r6 == 2)
        r5 = gBattleAnimBankAttacker;
    else
        r5 = gBattleAnimBankTarget;
    if (IsAnimBankSpriteVisible(r5))
    {
        r0 = GetBankIdentity(r5);
        r0 += 0xFF;
        if (r0 <= 1 || NotInBattle() != 0)
            r7 = 0;
        else
            r7 = 1;
        sub_8076034(r5, r7);
        r4 = gObjectBankIDs[r5];
        taskId = CreateTask(task_pA_ma0A_obj_to_bg_pal, 10);
        gTasks[taskId].data[0] = r4;
        gTasks[taskId].data[1] = gSprites[r4].pos1.x + gSprites[r4].pos2.x;
        gTasks[taskId].data[2] = gSprites[r4].pos1.y + gSprites[r4].pos2.y;
        if (r7 == 0)
        {
            gTasks[taskId].data[3] = gUnknown_030042C0;
            gTasks[taskId].data[4] = gUnknown_030041B4;
        }
        else
        {
            gTasks[taskId].data[3] = gUnknown_03004288;
            gTasks[taskId].data[4] = gUnknown_03004280;
        }
        gTasks[taskId].data[5] = r7;
        gTasks[taskId].data[6] = r5;
        gMonAnimTaskIdArray[0] = taskId;

    }
    r5 ^= 2;
    if (r6 > 1 && IsAnimBankSpriteVisible(r5))
    {
        r0 = GetBankIdentity(r5);
        r0 += 0xFF;
        if (r0 <= 1 || NotInBattle() != 0)
            r7 = 0;
        else
            r7 = 1;
        sub_8076034(r5, r7);
        r4 = gObjectBankIDs[r5];
        taskId = CreateTask(task_pA_ma0A_obj_to_bg_pal, 10);
        gTasks[taskId].data[0] = r4;
        gTasks[taskId].data[1] = gSprites[r4].pos1.x + gSprites[r4].pos2.x;
        gTasks[taskId].data[2] = gSprites[r4].pos1.y + gSprites[r4].pos2.y;
        if (r7 == 0)
        {
            gTasks[taskId].data[3] = gUnknown_030042C0;
            gTasks[taskId].data[4] = gUnknown_030041B4;
        }
        else
        {
            gTasks[taskId].data[3] = gUnknown_03004288;
            gTasks[taskId].data[4] = gUnknown_03004280;
        }
        gTasks[taskId].data[5] = r7;
        gTasks[taskId].data[6] = r5;
        gMonAnimTaskIdArray[1] = taskId;
    }
    gBattleAnimScriptPtr++;
}

#ifdef NONMATCHING
bool8 IsAnimBankSpriteVisible(u8 a)
{
    if (NotInBattle())
    {
        if (a == gBattleAnimBankAttacker)
            return TRUE;
        else
            return FALSE;
    }
    if (!AnimBankSpriteExists(a))
        return FALSE;
    if (NotInBattle())
        return TRUE; // this line wont ever be reached.
    if (!(EWRAM_17800[a].unk0 & 1))
        return TRUE;
    if (gSprites[gObjectBankIDs[a]].invisible)
        return FALSE;
    return TRUE;
}
#else
__attribute__((naked))
bool8 IsAnimBankSpriteVisible(u8 a)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    adds r5, r4, 0\n\
    bl NotInBattle\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08075FDC\n\
    ldr r0, _08075FD8 @ =gBattleAnimBankAttacker\n\
    ldrb r0, [r0]\n\
    cmp r4, r0\n\
    beq _0807601C\n\
    b _0807602C\n\
    .align 2, 0\n\
_08075FD8: .4byte gBattleAnimBankAttacker\n\
_08075FDC:\n\
    adds r0, r4, 0\n\
    bl AnimBankSpriteExists\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _0807602C\n\
    bl NotInBattle\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0807601C\n\
    lsls r0, r5, 2\n\
    ldr r1, _08076020 @ =gSharedMem + 0x17800\n\
    adds r0, r1\n\
    ldrb r1, [r0]\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _0807601C\n\
    ldr r2, _08076024 @ =gSprites\n\
    ldr r0, _08076028 @ =gObjectBankIDs\n\
    adds r0, r5, r0\n\
    ldrb r1, [r0]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r2\n\
    adds r0, 0x3E\n\
    ldrb r0, [r0]\n\
    lsls r0, 29\n\
    cmp r0, 0\n\
    blt _0807602C\n\
_0807601C:\n\
    movs r0, 0x1\n\
    b _0807602E\n\
    .align 2, 0\n\
_08076020: .4byte gSharedMem + 0x17800\n\
_08076024: .4byte gSprites\n\
_08076028: .4byte gObjectBankIDs\n\
_0807602C:\n\
    movs r0, 0\n\
_0807602E:\n\
    pop {r4,r5}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}
#endif

void sub_8076034(u8 a, u8 b)
{
    volatile u8 pointlessZero;
    u16 *addr2;
    u8 spriteId;

    if (b == 0)
    {
        struct UnknownStruct2 s;
        u8 *addr;
        u32 size;
        u8 r2;
        u16 *addr3;

        sub_8078914(&s);
        addr = s.unk0;
        size = 0x2000;
        while (1)
        {
            DmaFill32(3, 0, addr, 0x1000);
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                DmaFill32(3, 0, addr, size);
                break;
            }
        }
        pointlessZero = 0;
        pointlessZero = 0;
        addr2 = (void *)s.unk4;
        DmaFill16(3, 0xFF, addr2, 0x1000);

        REG_BG1CNT_BITFIELD.priority = 2;
        REG_BG1CNT_BITFIELD.screenSize = 1;
        REG_BG1CNT_BITFIELD.areaOverflowMode = 0;

        spriteId = gObjectBankIDs[a];
        gUnknown_030042C0 = -(gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x) + 32;
        if (NotInBattle() != 0 && sub_80AEB1C(EWRAM_19348) != 0)
            gUnknown_030042C0--;
        gUnknown_030041B4 = -(gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) + 32;
        gSprites[gObjectBankIDs[a]].invisible = TRUE;

        REG_BG1HOFS = gUnknown_030042C0;
        REG_BG1VOFS = gUnknown_030041B4;

        LoadPalette(gPlttBufferUnfaded + 0x100 + a * 16, s.unk8 * 16, 32);
        addr3 = (u16 *)PLTT + s.unk8 * 16;
        DmaCopy32(3, gPlttBufferUnfaded + 0x100 + a * 16, addr3, 32);

        if (NotInBattle() != 0)
            r2 = 0;
        else
            r2 = GetBankIdentity(a);
        sub_80E4EF8(0, 0, r2, s.unk8, (u32)s.unk0, (((s32)s.unk4 - VRAM) / 2048), REG_BG1CNT_BITFIELD.charBaseBlock);
        if (NotInBattle() != 0)
            sub_8076380();
    }
    else
    {
        u8 *addr;
        u32 size;
        u16 *addr3;

        addr = (void *)(VRAM + 0x6000);
        size = 0x2000;
        while (1)
        {
            DmaFill32(3, 0, addr, 0x1000);
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                DmaFill32(3, 0, addr, size);
                break;
            }
        }
        pointlessZero = 0;
        pointlessZero = 0;
        addr2 = (void *)(VRAM + 0xF000);
        DmaFill32(3, 0, addr2, 0x800);

        REG_BG2CNT_BITFIELD.priority = 2;
        REG_BG2CNT_BITFIELD.screenSize = 1;
        REG_BG2CNT_BITFIELD.areaOverflowMode = 0;

        spriteId = gObjectBankIDs[a];
        gUnknown_03004288 = -(gSprites[spriteId].pos1.x + gSprites[spriteId].pos2.x) + 32;
        gUnknown_03004280 = -(gSprites[spriteId].pos1.y + gSprites[spriteId].pos2.y) + 32;
        gSprites[gObjectBankIDs[a]].invisible = TRUE;

        REG_BG2HOFS = gUnknown_03004288;
        REG_BG2VOFS = gUnknown_03004280;

        LoadPalette(gPlttBufferUnfaded + 0x100 + a * 16, 0x90, 32);
        addr3 = (void *)(PLTT + 0x120);
        DmaCopy32(3, gPlttBufferUnfaded + 0x100 + a * 16, addr3, 32);

        sub_80E4EF8(0, 0, GetBankIdentity(a), 9, 0x6000, 0x1E, REG_BG2CNT_BITFIELD.charBaseBlock);
    }
}

static void sub_8076380(void)
{
    int i;
    int j;
    struct UnknownStruct2 s;
    u16 *ptr;

    if (sub_80AEB1C(EWRAM_19348) != 0)
    {
        sub_8078914(&s);
        ptr = s.unk4;
        for (i = 0; i < 8; i++)
        {
            for (j = 0; j < 4; j++)
            {
                u16 temp = ptr[j + i * 32];

                ptr[j + i * 32] = ptr[7 - j + i * 32];
                ptr[7 - j + i * 32] = temp;
            }
        }
        for (i = 0; i < 8; i++)
        {
            for (j = 0; j < 8; j++)
                ptr[j + i * 32] ^= 0x400;
        }
    }
}

void sub_80763FC(u16 a, u16 *b, u32 c, u8 d)
{
    u8 i;
    u8 j;
    u32 r9;

    if (d == 0)
        r9 = 32;
    else
        r9 = 64;
    a <<= 12;
    for (i = 0; i < r9; i++)
    {
        for (j = 0; j < 32; j++)
            b[j + i * 32] = ((b[j + i * 32] & 0xFFF) | a) + c;
    }
}

void sub_8076464(u8 a)
{
    u8 *addr;
    u32 size;
    volatile u8 pointlessZero;
    struct UnknownStruct2 s;

    sub_8078914(&s);
    if (a == 0 || NotInBattle() != 0)
    {
        u16 *addr2;

        addr = s.unk0;
        size = 0x2000;
        while (1)
        {
            DmaFill32(3, 0, addr, 0x1000);
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                DmaFill32(3, 0, addr, size);
                break;
            }
        }
        pointlessZero = 0;
        pointlessZero = 0;
        addr2 = s.unk4;
        DmaFill32(3, 0, addr2, 0x800);
        gUnknown_030042C0 = 0;
        gUnknown_030041B4 = 0;
    }
    else
    {
        u16 *addr2;

        addr = (void *)(VRAM + 0x6000);
        size = 0x2000;
        while (1)
        {
            DmaFill32(3, 0, addr, 0x1000);
            addr += 0x1000;
            size -= 0x1000;
            if (size <= 0x1000)
            {
                DmaFill32(3, 0, addr, size);
                break;
            }
        }
        pointlessZero = 0;
        pointlessZero = 0;
        addr2 = (void *)(VRAM + 0xF000);
        DmaFill32(3, 0, addr2, 0x800);
        gUnknown_03004288 = 0;
        gUnknown_03004280 = 0;
    }
}

static void task_pA_ma0A_obj_to_bg_pal(u8 taskId)
{
    u8 r4;
    u8 r6;
    s16 r3;
    s16 r2;
    struct UnknownStruct2 s;

    r4 = gTasks[taskId].data[0];
    r6 = gTasks[taskId].data[6];
    sub_8078914(&s);
    r3 = gTasks[taskId].data[1] - (gSprites[r4].pos1.x + gSprites[r4].pos2.x);
    r2 = gTasks[taskId].data[2] - (gSprites[r4].pos1.y + gSprites[r4].pos2.y);
    if (gTasks[taskId].data[5] == 0)
    {
        u16 *src;
        u16 *dst;

        gUnknown_030042C0 = r3 + gTasks[taskId].data[3];
        gUnknown_030041B4 = r2 + gTasks[taskId].data[4];
        src = gPlttBufferFaded + 0x100 + r6 * 16;
        dst = gPlttBufferFaded + 0x100 + s.unk8 * 16 - 256;
        DmaCopy32(3, src, dst, 32);
    }
    else
    {
        u16 *src;
        u16 *dst;

        gUnknown_03004288 = r3 + gTasks[taskId].data[3];
        gUnknown_03004280 = r2 + gTasks[taskId].data[4];
        src = gPlttBufferFaded + 0x100 + r6 * 16;
        dst = gPlttBufferFaded + 0x100 - 112;
        DmaCopy32(3, src, dst, 32);
    }
}

static void ScriptCmd_clearmonbg(void)
{
    u8 r4;
    u8 r5;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r4 = T1_READ_8(gBattleAnimScriptPtr);
    if (r4 == 0)
        r4 = 2;
    else if (r4 == 1)
        r4 = 3;
    if (r4 == 0 || r4 == 2)
        r5 = gBattleAnimBankAttacker;
    else
        r5 = gBattleAnimBankTarget;
    if (gMonAnimTaskIdArray[0] != 0xFF)
        gSprites[gObjectBankIDs[r5]].invisible = FALSE;
    if (r4 > 1 && gMonAnimTaskIdArray[1] != 0xFF)
        gSprites[gObjectBankIDs[r5 ^ 2]].invisible = FALSE;
    else
        r4 = 0;
    taskId = CreateTask(sub_807672C, 5);
    gTasks[taskId].data[0] = r4;
    gTasks[taskId].data[2] = r5;
    gBattleAnimScriptPtr++;
}

static void sub_807672C(u8 taskId)
{
    u8 var;
    u8 r4;

    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] != 1)
    {
        var = GetBankIdentity(gTasks[taskId].data[2]);
        var += 0xFF;
        if (var <= 1 || NotInBattle() != 0)
            r4 = 0;
        else
            r4 = 1;
        if (gMonAnimTaskIdArray[0] != 0xFF)
        {
            sub_8076464(r4);
            DestroyTask(gMonAnimTaskIdArray[0]);
            gMonAnimTaskIdArray[0] = 0xFF;
        }
        if (gTasks[taskId].data[0] > 1)
        {
            sub_8076464(r4 ^ 1);
            DestroyTask(gMonAnimTaskIdArray[1]);
            gMonAnimTaskIdArray[1] = 0xFF;
        }
        DestroyTask(taskId);
    }
}

static void ScriptCmd_monbg_22(void)
{
    u8 r5;
    u8 r4;
    u8 r0;
    u8 r1;

    gBattleAnimScriptPtr++;
    r5 = T1_READ_8(gBattleAnimScriptPtr);
    if (r5 == 0)
        r5 = 2;
    else if (r5 == 1)
        r5 = 3;
    if (r5 == 0 || r5 == 2)
        r4 = gBattleAnimBankAttacker;
    else
        r4 = gBattleAnimBankTarget;
    if (IsAnimBankSpriteVisible(r4))
    {
        r0 = GetBankIdentity(r4);
        r0 += 0xFF;
        if (r0 <= 1 || NotInBattle() != 0)
            r1 = 0;
        else
            r1 = 1;
        sub_8076034(r4, r1);
        gSprites[gObjectBankIDs[r4]].invisible = FALSE;
    }
    r4 ^= 2;
    if (r5 > 1 && IsAnimBankSpriteVisible(r4))
    {
        r0 = GetBankIdentity(r4);
        r0 += 0xFF;
        if (r0 <= 1 || NotInBattle() != 0)
            r1 = 0;
        else
            r1 = 1;
        sub_8076034(r4, r1);
        gSprites[gObjectBankIDs[r4]].invisible = FALSE;
    }
    gBattleAnimScriptPtr++;
}

static void ScriptCmd_clearmonbg_23(void)
{
    u8 r5;
    u8 r6;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r5 = T1_READ_8(gBattleAnimScriptPtr);
    if (r5 == 0)
        r5 = 2;
    else if (r5 == 1)
        r5 = 3;
    if (r5 == 0 || r5 == 2)
        r6 = gBattleAnimBankAttacker;
    else
        r6 = gBattleAnimBankTarget;
    if (IsAnimBankSpriteVisible(r6))
        gSprites[gObjectBankIDs[r6]].invisible = FALSE;
    if (r5 > 1 && IsAnimBankSpriteVisible(r6 ^ 2))
        gSprites[gObjectBankIDs[r6 ^ 2]].invisible = FALSE;
    else
        r5 = 0;
    taskId = CreateTask(sub_80769A4, 5);
    gTasks[taskId].data[0] = r5;
    gTasks[taskId].data[2] = r6;
    gBattleAnimScriptPtr++;
}

static void sub_80769A4(u8 taskId)
{
    u8 r0;
    u8 r4;
    u8 r5;

    gTasks[taskId].data[1]++;
    if (gTasks[taskId].data[1] != 1)
    {
        r4 = gTasks[taskId].data[2];
        r0 = GetBankIdentity(r4);
        r0 += 0xFF;
        if (r0 <= 1 || NotInBattle() != 0)
            r5 = 0;
        else
            r5 = 1;
        if (IsAnimBankSpriteVisible(r4))
            sub_8076464(r5);
        if (gTasks[taskId].data[0] > 1 && IsAnimBankSpriteVisible(r4 ^ 2))
            sub_8076464(r5 ^ 1);
        DestroyTask(taskId);
    }
}

static void ScriptCmd_setalpha(void)
{
    u16 r3;
    u16 r1;

    gBattleAnimScriptPtr++;
    r3 = *(gBattleAnimScriptPtr++);
    r1 = *(gBattleAnimScriptPtr++) << 8;
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = r3 | r1;
}

static void ScriptCmd_setbldcnt(void)
{
    u16 r3;
    u16 r1;

    gBattleAnimScriptPtr++;
    r3 = *(gBattleAnimScriptPtr++);
    r1 = *(gBattleAnimScriptPtr++) << 8;
    REG_BLDCNT = r3 | r1;
}

static void ScriptCmd_blendoff(void)
{
    gBattleAnimScriptPtr++;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
}

static void ScriptCmd_call(void)
{
    gBattleAnimScriptPtr++;
    gBattleAnimScriptRetAddr = gBattleAnimScriptPtr + 4;
    gBattleAnimScriptPtr = T2_READ_PTR(gBattleAnimScriptPtr);
}

static void ScriptCmd_return(void)
{
    gBattleAnimScriptPtr = gBattleAnimScriptRetAddr;
}

static void ScriptCmd_setvar(void)
{
    const u8 *addr = gBattleAnimScriptPtr;
    u16 r4;
    u8 r2;

    gBattleAnimScriptPtr++;
    r2 = T1_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    r4 = T1_READ_16(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr = addr + 4;
    gBattleAnimArgs[r2] = r4;
}

static void ScriptCmd_ifelse(void)
{
    gBattleAnimScriptPtr++;
    if (gUnknown_0202F7C4 & 1)
        gBattleAnimScriptPtr += 4;
    gBattleAnimScriptPtr = T2_READ_PTR(gBattleAnimScriptPtr);
}

static void ScriptCmd_jumpif(void)
{
    u8 r1;

    gBattleAnimScriptPtr++;
    r1 = T1_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    if (r1 == gUnknown_0202F7C4)
    {
        gBattleAnimScriptPtr = T2_READ_PTR(gBattleAnimScriptPtr);
    }
    else
    {
        gBattleAnimScriptPtr += 4;
    }
}

static void ScriptCmd_jump(void)
{
    gBattleAnimScriptPtr++;
    gBattleAnimScriptPtr = T2_READ_PTR(gBattleAnimScriptPtr);
}

bool8 NotInBattle(void)
{
    if (!gMain.inBattle)
        return TRUE;
    else
        return FALSE;
}

static void ScriptCmd_fadetobg(void)
{
    u8 r4;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r4 = T1_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    taskId = CreateTask(task_p5_load_battle_screen_elements, 5);
    gTasks[taskId].data[0] = r4;
    gUnknown_0202F7C5 = 1;
}

static void ScriptCmd_fadetobg_25(void)
{
    u8 r8;
    u8 r7;
    u8 r6;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r8 = gBattleAnimScriptPtr[0];
    r7 = gBattleAnimScriptPtr[1];
    r6 = gBattleAnimScriptPtr[2];
    gBattleAnimScriptPtr += 3;
    taskId = CreateTask(task_p5_load_battle_screen_elements, 5);
    if (NotInBattle() != 0)
        gTasks[taskId].data[0] = r6;
    else if (GetBankSide(gBattleAnimBankTarget) == 0)
        gTasks[taskId].data[0] = r7;
    else
        gTasks[taskId].data[0] = r8;
    gUnknown_0202F7C5 = 1;
}

static void task_p5_load_battle_screen_elements(u8 taskId)
{
    if (gTasks[taskId].data[10] == 0)
    {
        BeginHardwarePaletteFade(0xE8, 0, 0, 16, 0);
        gTasks[taskId].data[10]++;
        return;
    }
    if (gPaletteFade.active)
        return;
    if (gTasks[taskId].data[10] == 1)
    {
        gTasks[taskId].data[10]++;
        gUnknown_0202F7C5 = 2;
    }
    else if (gTasks[taskId].data[10] == 2)
    {
        s16 data0 = (u16)gTasks[taskId].data[0];

        if (data0 == -1)
            dp01t_11_3_message_for_player_only();
        else
            sub_8076DB8(data0);
        BeginHardwarePaletteFade(0xE8, 0, 16, 0, 1);
        gTasks[taskId].data[10]++;
        return;
    }
    if (gPaletteFade.active)
        return;
    if (gTasks[taskId].data[10] == 3)
    {
        DestroyTask(taskId);
        gUnknown_0202F7C5 = 0;
    }
}

static void sub_8076DB8(u16 a)
{
    if (NotInBattle())
    {
        void *tilemap = gBattleAnimBackgroundTable[a].tilemap;
        void *dmaSrc;
        void *dmaDest;

        LZDecompressWram(tilemap, NotInBattle() ? EWRAM_14800 : EWRAM_18000);
        sub_80763FC(sub_80789BC(), NotInBattle() ? EWRAM_14800 : EWRAM_18000, 0x100, 0);
        dmaSrc = NotInBattle() ? EWRAM_14800 : EWRAM_18000;
        dmaDest = (void *)(VRAM + 0xD000);
        DmaCopy32(3, dmaSrc, dmaDest, 0x800);
        LZDecompressVram(gBattleAnimBackgroundTable[a].image, (void *)(VRAM + 0x2000));
        LoadCompressedPalette(gBattleAnimBackgroundTable[a].palette, sub_80789BC() * 16, 32);
    }
    else
    {
        LZDecompressVram(gBattleAnimBackgroundTable[a].tilemap, (void *)(VRAM + 0xD000));
        LZDecompressVram(gBattleAnimBackgroundTable[a].image, (void *)(VRAM + 0x8000));
        LoadCompressedPalette(gBattleAnimBackgroundTable[a].palette, 32, 32);
    }
}

static void dp01t_11_3_message_for_player_only(void)
{
    if (NotInBattle())
        sub_80AB2AC();
    else
        sub_800D7B8();
}

static void ScriptCmd_restorebg(void)
{
    u8 taskId;

    gBattleAnimScriptPtr++;
    taskId = CreateTask(task_p5_load_battle_screen_elements, 5);
    gTasks[taskId].data[0] = 0xFFFF;
    gUnknown_0202F7C5 = 1;
}

static void ScriptCmd_waitbgfadeout(void)
{
    if (gUnknown_0202F7C5 == 2)
    {
        gBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait = 1;
    }
}

static void ScriptCmd_waitbgfadein(void)
{
    if (gUnknown_0202F7C5 == 0)
    {
        gBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
    else
    {
        gAnimFramesToWait = 1;
    }
}

static void ScriptCmd_changebg(void)
{
    gBattleAnimScriptPtr++;
    sub_8076DB8(T1_READ_8(gBattleAnimScriptPtr));
    gBattleAnimScriptPtr++;
}

//Weird control flow
/*
s8 sub_8076F98(s8 a)
{
    if (!NotInBattle() && (EWRAM_17810[gBattleAnimBankAttacker].unk0 & 0x10))
    {
        a = GetBankSide(gBattleAnimBankAttacker) ? 0xC0 : 0x3F;
    }
    //_08076FDC
    else
    {
        if (NotInBattle())
        {
            if (gBattleAnimBankAttacker == gBattleAnimBankTarget && gBattleAnimBankAttacker == 2
             && a == 0x3F)
            {
                //jump to _0807707A
                if (a < -0x40)
                    a = 0xC0;
                return a;
            }
        }
        //_08077004
        else
        {
            if (GetBankSide(gBattleAnimBankAttacker) == 0)
            {
                if (GetBankSide(gBattleAnimBankTarget) == 0)
            }
            //_08077042
            else
            {

            }
            //_0807706C
        }
    }
    //_0807706E
}
*/
__attribute__((naked))
s8 sub_8076F98(s8 a)
{
    asm(".syntax unified\n\
    push {r4,lr}\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    bl NotInBattle\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08076FDC\n\
    ldr r0, _08076FD4 @ =gBattleAnimBankAttacker\n\
    ldrb r2, [r0]\n\
    lsls r0, r2, 1\n\
    adds r0, r2\n\
    lsls r0, 2\n\
    ldr r1, _08076FD8 @ =gSharedMem + 0x17810\n\
    adds r0, r1\n\
    ldrb r1, [r0]\n\
    movs r0, 0x10\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08076FDC\n\
    adds r0, r2, 0\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    movs r4, 0xC0\n\
    cmp r0, 0\n\
    beq _0807706E\n\
    movs r4, 0x3F\n\
    b _0807706E\n\
    .align 2, 0\n\
_08076FD4: .4byte gBattleAnimBankAttacker\n\
_08076FD8: .4byte gSharedMem + 0x17810\n\
_08076FDC:\n\
    bl NotInBattle\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08077004\n\
    ldr r0, _08076FFC @ =gBattleAnimBankAttacker\n\
    ldr r1, _08077000 @ =gBattleAnimBankTarget\n\
    ldrb r0, [r0]\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    bne _08077068\n\
    cmp r0, 0x2\n\
    bne _08077068\n\
    cmp r4, 0x3F\n\
    beq _0807707A\n\
    b _08077068\n\
    .align 2, 0\n\
_08076FFC: .4byte gBattleAnimBankAttacker\n\
_08077000: .4byte gBattleAnimBankTarget\n\
_08077004:\n\
    ldr r0, _0807702C @ =gBattleAnimBankAttacker\n\
    ldrb r0, [r0]\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08077042\n\
    ldr r0, _08077030 @ =gBattleAnimBankTarget\n\
    ldrb r0, [r0]\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0807706E\n\
    lsls r0, r4, 24\n\
    asrs r1, r0, 24\n\
    cmp r1, 0x3F\n\
    bne _08077034\n\
    movs r4, 0xC0\n\
    b _0807706E\n\
    .align 2, 0\n\
_0807702C: .4byte gBattleAnimBankAttacker\n\
_08077030: .4byte gBattleAnimBankTarget\n\
_08077034:\n\
    movs r0, 0x40\n\
    negs r0, r0\n\
    cmp r1, r0\n\
    beq _0807706E\n\
    negs r0, r1\n\
    lsls r0, 24\n\
    b _0807706C\n\
_08077042:\n\
    ldr r0, _08077064 @ =gBattleAnimBankTarget\n\
    ldrb r0, [r0]\n\
    bl GetBankSide\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x1\n\
    bne _08077068\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    movs r1, 0x40\n\
    negs r1, r1\n\
    cmp r0, r1\n\
    bne _0807706E\n\
    movs r4, 0x3F\n\
    b _0807706E\n\
    .align 2, 0\n\
_08077064: .4byte gBattleAnimBankTarget\n\
_08077068:\n\
    lsls r0, r4, 24\n\
    negs r0, r0\n\
_0807706C:\n\
    lsrs r4, r0, 24\n\
_0807706E:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    cmp r0, 0x3F\n\
    ble _0807707A\n\
    movs r4, 0x3F\n\
    b _08077088\n\
_0807707A:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    movs r1, 0x40\n\
    negs r1, r1\n\
    cmp r0, r1\n\
    bge _08077088\n\
    movs r4, 0xC0\n\
_08077088:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    pop {r4}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}

s8 sub_8077094(s8 a)
{
    if (!NotInBattle() && (EWRAM_17810[gBattleAnimBankAttacker].unk0 & 0x10))
    {
        if (GetBankSide(gBattleAnimBankAttacker) != 0)
            a = 0x3F;
        else
            a = 0xC0;
    }
    else
    {
        if (GetBankSide(gBattleAnimBankAttacker) != 0 || NotInBattle() != 0)
            a = -a;
    }
    return a;
}

s16 sub_8077104(s16 a)
{
    s16 var = a;

    if (var > 63)
        var = 63;
    else if (var < -64)
        var = -64;
    return var;
}

s16 sub_807712C(s16 a, s16 b, s16 c)
{
    u16 var;

    if (a < b)
        var = ((c < 0) ? -c : c);
    else if (a > b)
        var = -((c < 0) ? -c : c);
    else
        var = 0;
    return var;
}

static void ScriptCmd_panse_19(void)
{
    u16 r4;
    s8 r0;

    gBattleAnimScriptPtr++;
    r4 = T1_READ_16(gBattleAnimScriptPtr);
    r0 = T1_READ_8(gBattleAnimScriptPtr + 2);
    PlaySE12WithPanning(r4, sub_8076F98(r0));
    gBattleAnimScriptPtr += 3;
}

static void ScriptCmd_setpan(void)
{
    s8 r0;

    gBattleAnimScriptPtr++;
    r0 = T1_READ_8(gBattleAnimScriptPtr);
    SE12PanpotControl(sub_8076F98(r0));
    gBattleAnimScriptPtr++;
}

static void ScriptCmd_panse_1B(void)
{
    u16 songNum;
    s8 r0;
    s8 r4;
    s8 r6;
    u8 r7;
    s8 panning;
    s8 r8;
    u8 taskId;

    gBattleAnimScriptPtr++;
    songNum = T1_READ_16(gBattleAnimScriptPtr);
    r0 = T1_READ_8(gBattleAnimScriptPtr + 2);
    r4 = T1_READ_8(gBattleAnimScriptPtr + 3);
    r6 = T1_READ_8(gBattleAnimScriptPtr + 4);
    r7 = T1_READ_8(gBattleAnimScriptPtr + 5);
    panning = sub_8076F98(r0);
    r8 = sub_8076F98(r4);
    r4 = sub_807712C(panning, r8, r6);
    taskId = CreateTask(c3_08073CEC, 1);
    gTasks[taskId].data[0] = panning;
    gTasks[taskId].data[1] = r8;
    gTasks[taskId].data[2] = r4;
    gTasks[taskId].data[3] = r7;
    gTasks[taskId].data[4] = panning;
    PlaySE12WithPanning(songNum, panning);
    gAnimSoundTaskCount++;
    gBattleAnimScriptPtr += 6;
}

#ifdef NONMATCHING
static void c3_08073CEC(u8 taskId)
{
    u16 r7 = 0;
    s16 r0;
    s16 r6;
    s16 r3;
    s16 r4;
    int foo;

    r0 = gTasks[taskId].data[8];
    gTasks[taskId].data[8]++;
    if (r0 >= gTasks[taskId].data[3])
    {
        gTasks[taskId].data[8] = r7;
        r6 = gTasks[taskId].data[0];
        r3 = gTasks[taskId].data[1];
        foo = gTasks[taskId].data[4] + gTasks[taskId].data[2];
        r4 = foo;
        gTasks[taskId].data[4] = r4;
        if (gTasks[taskId].data[2] == 0)
        {
            r4 = r3;
            DestroyTask(taskId);
            gAnimSoundTaskCount--;
        }
        //_080772D8
        else
        {
            if (r6 < r3)
            {
                if (r4 < r3)
                    goto check;
                DestroyTask(taskId);
                gAnimSoundTaskCount--;
            }
            else
            {
                if (r4 <= r3)
                    r7 = 1;
              check:
                if (r7 != 0)
                {
                    DestroyTask(taskId);
                    gAnimSoundTaskCount--;
                }
            }
        }
        //_080772F8
        SE12PanpotControl(r4);
    }
    //_08077314
}
#else
__attribute__((naked))
static void c3_08073CEC(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    movs r7, 0\n\
    ldr r1, _080772D4 @ =gTasks\n\
    lsls r0, r5, 2\n\
    adds r0, r5\n\
    lsls r0, 3\n\
    adds r2, r0, r1\n\
    ldrh r0, [r2, 0x18]\n\
    adds r1, r0, 0x1\n\
    strh r1, [r2, 0x18]\n\
    lsls r0, 16\n\
    asrs r0, 16\n\
    movs r3, 0xE\n\
    ldrsh r1, [r2, r3]\n\
    cmp r0, r1\n\
    blt _08077314\n\
    strh r7, [r2, 0x18]\n\
    ldrh r6, [r2, 0x8]\n\
    ldrh r3, [r2, 0xA]\n\
    movs r4, 0x10\n\
    ldrsh r0, [r2, r4]\n\
    movs r4, 0xC\n\
    ldrsh r1, [r2, r4]\n\
    adds r0, r1\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    strh r4, [r2, 0x10]\n\
    cmp r1, 0\n\
    bne _080772D8\n\
    lsls r2, r3, 16\n\
    b _080772FC\n\
    .align 2, 0\n\
_080772D4: .4byte gTasks\n\
_080772D8:\n\
    lsls r1, r6, 16\n\
    lsls r0, r3, 16\n\
    asrs r3, r0, 16\n\
    adds r2, r0, 0\n\
    cmp r1, r2\n\
    bge _080772EE\n\
    lsls r0, r4, 16\n\
    asrs r0, 16\n\
    cmp r0, r3\n\
    blt _080772F8\n\
    b _080772FC\n\
_080772EE:\n\
    lsls r0, r4, 16\n\
    asrs r0, 16\n\
    cmp r0, r3\n\
    bgt _080772F8\n\
    movs r7, 0x1\n\
_080772F8:\n\
    cmp r7, 0\n\
    beq _0807730C\n\
_080772FC:\n\
    lsrs r4, r2, 16\n\
    adds r0, r5, 0\n\
    bl DestroyTask\n\
    ldr r1, _0807731C @ =gAnimSoundTaskCount\n\
    ldrb r0, [r1]\n\
    subs r0, 0x1\n\
    strb r0, [r1]\n\
_0807730C:\n\
    lsls r0, r4, 24\n\
    asrs r0, 24\n\
    bl SE12PanpotControl\n\
_08077314:\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_0807731C: .4byte gAnimSoundTaskCount\n\
    .syntax divided\n");
}
#endif

static void ScriptCmd_panse_26(void)
{
    u16 r8;
    s8 r4;
    s8 r5;
    s8 r6;
    u8 r10;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r8 = T1_READ_16(gBattleAnimScriptPtr);
    r4 = T1_READ_8(gBattleAnimScriptPtr + 2);
    r5 = T1_READ_8(gBattleAnimScriptPtr + 3);
    r6 = T1_READ_8(gBattleAnimScriptPtr + 4);
    r10 = T1_READ_8(gBattleAnimScriptPtr + 5);
    taskId = CreateTask(c3_08073CEC, 1);
    gTasks[taskId].data[0] = r4;
    gTasks[taskId].data[1] = r5;
    gTasks[taskId].data[2] = r6;
    gTasks[taskId].data[3] = r10;
    gTasks[taskId].data[4] = r4;
    PlaySE12WithPanning(r8, r4);
    gAnimSoundTaskCount++;
    gBattleAnimScriptPtr += 6;
}

static void ScriptCmd_panse_27(void)
{
    u16 r9;
    u8 r4;
    u8 r8;
    u8 r7;
    u8 r0;
    s8 r6;
    s8 r5;
    s8 r4_2;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r9 = T1_READ_16(gBattleAnimScriptPtr);
    r0 = T1_READ_8(gBattleAnimScriptPtr + 2);
    r4 = T1_READ_8(gBattleAnimScriptPtr + 3);
    r8 = T1_READ_8(gBattleAnimScriptPtr + 4);
    r7 = T1_READ_8(gBattleAnimScriptPtr + 5);
    r6 = sub_8077094(r0);
    r5 = sub_8077094(r4);
    r4_2 = sub_8077094(r8);
    taskId = CreateTask(c3_08073CEC, 1);
    gTasks[taskId].data[0] = r6;
    gTasks[taskId].data[1] = r5;
    gTasks[taskId].data[2] = r4_2;
    gTasks[taskId].data[3] = r7;
    gTasks[taskId].data[4] = r6;
    PlaySE12WithPanning(r9, r6);
    gAnimSoundTaskCount++;
    gBattleAnimScriptPtr += 6;
}

static void ScriptCmd_panse_1C(void)
{
    u16 r5;
    u8 r0;
    u8 r8;
    u8 r9;
    s8 r4;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r5 = T1_READ_16(gBattleAnimScriptPtr);
    r0 = T1_READ_8(gBattleAnimScriptPtr + 2);
    r8 = T1_READ_8(gBattleAnimScriptPtr + 3);
    r9 = T1_READ_8(gBattleAnimScriptPtr + 4);
    r4 = sub_8076F98(r0);
    taskId = CreateTask(sub_80774FC, 1);
    gTasks[taskId].data[0] = r5;
    gTasks[taskId].data[1] = r4;
    gTasks[taskId].data[2] = r8;
    gTasks[taskId].data[3] = r9;
    gTasks[taskId].data[8] = r8;
    gTasks[taskId].func(taskId);
    gAnimSoundTaskCount++;
    gBattleAnimScriptPtr += 5;
}

static void sub_80774FC(u8 taskId)
{
    s16 data8;
    u16 r0;
    s8 r1;
    u8 r4;

    data8 = gTasks[taskId].data[8];
    gTasks[taskId].data[8]++;
    if (data8 >= gTasks[taskId].data[2])
    {
        gTasks[taskId].data[8] = 0;
        r0 = gTasks[taskId].data[0];
        r1 = gTasks[taskId].data[1];
        gTasks[taskId].data[3]--;
        r4 = gTasks[taskId].data[3];
        PlaySE12WithPanning(r0, r1);
        if (r4 == 0)
        {
            DestroyTask(taskId);
            gAnimSoundTaskCount--;
        }
    }
}

static void ScriptCmd_panse_1D(void)
{
    u16 r5;
    u8 r0;
    u8 r8;
    s8 r4;
    u8 taskId;

    gBattleAnimScriptPtr++;
    r5 = T1_READ_16(gBattleAnimScriptPtr);
    r0 = T1_READ_8(gBattleAnimScriptPtr + 2);
    r8 = T1_READ_8(gBattleAnimScriptPtr + 3);
    r4 = sub_8076F98(r0);
    taskId = CreateTask(sub_80775CC, 1);
    gTasks[taskId].data[0] = r5;
    gTasks[taskId].data[1] = r4;
    gTasks[taskId].data[2] = r8;
    gAnimSoundTaskCount++;
    gBattleAnimScriptPtr += 4;
}

static void sub_80775CC(u8 taskId)
{
    s16 r0;

    r0 = gTasks[taskId].data[2];
    gTasks[taskId].data[2]--;
    if (r0 <= 0)
    {
        PlaySE12WithPanning(gTasks[taskId].data[0], gTasks[taskId].data[1]);
        DestroyTask(taskId);
        gAnimSoundTaskCount--;
    }
}

static void ScriptCmd_createtask_1F(void)
{
    TaskFunc func;
    u8 numArgs;
    int i;
    u8 taskId;

    gBattleAnimScriptPtr++;
    func = (TaskFunc)T2_READ_32(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr += 4;
    numArgs = T1_READ_8(gBattleAnimScriptPtr);
    gBattleAnimScriptPtr++;
    for (i = 0; i < numArgs; i++)
    {
        gBattleAnimArgs[i] = T1_READ_16(gBattleAnimScriptPtr);
        gBattleAnimScriptPtr += 2;
    }
    taskId = CreateTask(func, 1);
    func(taskId);
    gAnimSoundTaskCount++;
}

static void ScriptCmd_waitsound(void)
{
    if (gAnimSoundTaskCount != 0)
    {
        gSoundAnimFramesToWait = 0;
        gAnimFramesToWait = 1;
    }
    else if (IsSEPlaying())
    {
        if (++gSoundAnimFramesToWait > 90)
        {
            m4aMPlayStop(&gMPlay_SE1);
            m4aMPlayStop(&gMPlay_SE2);
            gSoundAnimFramesToWait = 0;
        }
        else
        {
            gAnimFramesToWait = 1;
        }
    }
    else
    {
        gSoundAnimFramesToWait = 0;
        gBattleAnimScriptPtr++;
        gAnimFramesToWait = 0;
    }
}

static void ScriptCmd_jumpvareq(void)
{
    u8 r2;
    s16 r1;
    u8 *addr;

    gBattleAnimScriptPtr++;
    r2 = T1_READ_8(gBattleAnimScriptPtr);
    r1 = T1_READ_16(gBattleAnimScriptPtr + 1);
    if (r1 == gBattleAnimArgs[r2])
    {
        addr = T2_READ_PTR(gBattleAnimScriptPtr + 3);
        gBattleAnimScriptPtr = addr;
    }
    else
    {
        gBattleAnimScriptPtr += 7;
    }
}

static void ScriptCmd_jumpunkcond(void)
{
    u8 *addr;

    gBattleAnimScriptPtr++;
    if (NotInBattle())
    {
        addr = T2_READ_PTR(gBattleAnimScriptPtr);
        gBattleAnimScriptPtr = addr;
    }
    else
    {
        gBattleAnimScriptPtr += 4;
    }
}

static void ScriptCmd_monbgprio_28(void)
{
    u8 r2;
    u8 r0;
    u8 r4;

    r2 = T1_READ_8(gBattleAnimScriptPtr + 1);
    gBattleAnimScriptPtr += 2;
    if (r2 != 0)
        r0 = gBattleAnimBankTarget;
    else
        r0 = gBattleAnimBankAttacker;
    r4 = GetBankIdentity(r0);
    if (!NotInBattle() && (r4 == 0 || r4 == 3))
    {
        REG_BG1CNT_BITFIELD.priority = 1;
        REG_BG2CNT_BITFIELD.priority = 2;
    }
}

static void ScriptCmd_monbgprio_29(void)
{
    gBattleAnimScriptPtr++;
    if (!NotInBattle())
    {
        REG_BG1CNT_BITFIELD.priority = 1;
        REG_BG2CNT_BITFIELD.priority = 2;
    }
}

static void ScriptCmd_monbgprio_2A(void)
{
    u8 r6;
    u8 r4;
    u8 r0;

    r6 = T1_READ_8(gBattleAnimScriptPtr + 1);
    gBattleAnimScriptPtr += 2;
    if (GetBankSide(gBattleAnimBankAttacker) != GetBankSide(gBattleAnimBankTarget))
    {
        if (r6 != 0)
            r0 = gBattleAnimBankTarget;
        else
            r0 = gBattleAnimBankAttacker;
        r4 = GetBankIdentity(r0);
        if (!NotInBattle() && (r4 == 0 || r4 == 3))
        {
            REG_BG1CNT_BITFIELD.priority = 1;
            REG_BG2CNT_BITFIELD.priority = 2;
        }
    }
}

static void ScriptCmd_invisible(void)
{
    u8 r0;
    u8 spriteId;

    r0 = T1_READ_8(gBattleAnimScriptPtr + 1);
    spriteId = GetAnimBankSpriteId(r0);
    if (spriteId != 0xFF)
    {
        gSprites[spriteId].invisible = TRUE;
    }
    gBattleAnimScriptPtr += 2;
}

static void ScriptCmd_visible(void)
{
    u8 r0;
    u8 spriteId;

    r0 = T1_READ_8(gBattleAnimScriptPtr + 1);
    spriteId = GetAnimBankSpriteId(r0);
    if (spriteId != 0xFF)
    {
        gSprites[spriteId].invisible = FALSE;
    }
    gBattleAnimScriptPtr += 2;
}

static void ScriptCmd_doublebattle_2D(void)
{
    u8 r7;
    u8 r4;
    u8 spriteId;

    r7 = T1_READ_8(gBattleAnimScriptPtr + 1);
    gBattleAnimScriptPtr += 2;
    if (!NotInBattle() && IsDoubleBattle()
     && GetBankSide(gBattleAnimBankAttacker) == GetBankSide(gBattleAnimBankTarget))
    {
        if (r7 == 0)
        {
            r4 = GetBankIdentity_permutated(gBattleAnimBankAttacker);
            spriteId = GetAnimBankSpriteId(0);
        }
        else
        {
            r4 = GetBankIdentity_permutated(gBattleAnimBankTarget);
            spriteId = GetAnimBankSpriteId(1);
        }
        if (spriteId != 0xFF)
        {
            gSprites[spriteId].invisible = FALSE;
            if (r4 == 2)
                gSprites[spriteId].oam.priority = 3;
            if (r4 == 1)
                sub_8076464(0);
            else
                sub_8076464(1);
        }
    }
}

static void ScriptCmd_doublebattle_2E(void)
{
    u8 r7;
    u8 r4;
    u8 spriteId;

    r7 = T1_READ_8(gBattleAnimScriptPtr  + 1);
    gBattleAnimScriptPtr += 2;
    if (!NotInBattle() && IsDoubleBattle()
     && GetBankSide(gBattleAnimBankAttacker) == GetBankSide(gBattleAnimBankTarget))
    {
        if (r7 == 0)
        {
            r4 = GetBankIdentity_permutated(gBattleAnimBankAttacker);
            spriteId = GetAnimBankSpriteId(0);
        }
        else
        {
            r4 = GetBankIdentity_permutated(gBattleAnimBankTarget);
            spriteId = GetAnimBankSpriteId(1);
        }
        if (spriteId != 0xFF && r4 == 2)
        {
            gSprites[spriteId].oam.priority = 2;
        }
    }
}

static void ScriptCmd_stopsound(void)
{
    m4aMPlayStop(&gMPlay_SE1);
    m4aMPlayStop(&gMPlay_SE2);
    gBattleAnimScriptPtr++;
}
