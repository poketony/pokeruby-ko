#include "global.h"
#include "battle.h"
#include "battle_setup.h"
#include "battle_tower.h"
#include "battle_transition.h"
#include "data2.h"
#include "easy_chat.h"
#include "event_data.h"
#include "item.h"
#include "items.h"
#include "main.h"
#include "map_object_constants.h"
#include "moves.h"
#include "new_game.h"
#include "overworld.h"
#include "pokedex.h"
#include "rng.h"
#include "save.h"
#include "script_pokemon_80C4.h"
#include "species.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "trainer.h"
#include "tv.h"
#include "vars.h"
#include "ewram.h"

#include "../data/battle_tower/trainers.h"

static const u16 sBattleTowerHeldItems[] = {
    ITEM_NONE,
    ITEM_KINGS_ROCK,
    ITEM_SITRUS_BERRY,
    ITEM_ORAN_BERRY,
    ITEM_CHESTO_BERRY,
    ITEM_HARD_STONE,
    ITEM_FOCUS_BAND,
    ITEM_PERSIM_BERRY,
    ITEM_MIRACLE_SEED,
    ITEM_BERRY_JUICE,
    ITEM_MACHO_BRACE,
    ITEM_SILVER_POWDER,
    ITEM_CHERI_BERRY,
    ITEM_BLACK_GLASSES,
    ITEM_BLACK_BELT,
    ITEM_SOUL_DEW,
    ITEM_CHOICE_BAND,
    ITEM_MAGNET,
    ITEM_SILK_SCARF,
    ITEM_WHITE_HERB,
    ITEM_DEEP_SEA_SCALE,
    ITEM_DEEP_SEA_TOOTH,
    ITEM_MYSTIC_WATER,
    ITEM_SHARP_BEAK,
    ITEM_QUICK_CLAW,
    ITEM_LEFTOVERS,
    ITEM_RAWST_BERRY,
    ITEM_LIGHT_BALL,
    ITEM_POISON_BARB,
    ITEM_NEVER_MELT_ICE,
    ITEM_ASPEAR_BERRY,
    ITEM_SPELL_TAG,
    ITEM_BRIGHT_POWDER,
    ITEM_LEPPA_BERRY,
    ITEM_SCOPE_LENS,
    ITEM_TWISTED_SPOON,
    ITEM_METAL_COAT,
    ITEM_MENTAL_HERB,
    ITEM_CHARCOAL,
    ITEM_PECHA_BERRY,
    ITEM_SOFT_SAND,
    ITEM_LUM_BERRY,
    ITEM_DRAGON_SCALE,
    ITEM_DRAGON_FANG,
    ITEM_IAPAPA_BERRY,
    ITEM_WIKI_BERRY,
    ITEM_SEA_INCENSE,
    ITEM_SHELL_BELL,
    ITEM_SALAC_BERRY,
    ITEM_LANSAT_BERRY,
    ITEM_APICOT_BERRY,
    ITEM_STARF_BERRY,
    ITEM_LIECHI_BERRY,
    ITEM_STICK,
    ITEM_LAX_INCENSE,
    ITEM_AGUAV_BERRY,
    ITEM_FIGY_BERRY,
    ITEM_THICK_CLUB,
    ITEM_MAGO_BERRY,
    ITEM_METAL_POWDER,
    ITEM_PETAYA_BERRY,
    ITEM_LUCKY_PUNCH,
    ITEM_GANLON_BERRY,
};

#include "../data/battle_tower/level_50_mons.h"
#include "../data/battle_tower/level_100_mons.h"

static const u8 sMaleTrainerClasses[] = {
    TRAINER_CLASS_RUIN_MANIAC,
    TRAINER_CLASS_TUBER_M,
    TRAINER_CLASS_COOL_TRAINER_M,
    TRAINER_CLASS_RICH_BOY,
    TRAINER_CLASS_POKEMANIAC,
    TRAINER_CLASS_SWIMMER_M,
    TRAINER_CLASS_BLACK_BELT,
    TRAINER_CLASS_GUITARIST,
    TRAINER_CLASS_KINDLER,
    TRAINER_CLASS_CAMPER,
    TRAINER_CLASS_BUG_MANIAC,
    TRAINER_CLASS_PSYCHIC_M,
    TRAINER_CLASS_GENTLEMAN,
    TRAINER_CLASS_SCHOOL_KID_M,
    TRAINER_CLASS_POKEFAN_M,
    TRAINER_CLASS_EXPERT_M,
    TRAINER_CLASS_YOUNGSTER,
    TRAINER_CLASS_FISHERMAN,
    TRAINER_CLASS_CYCLING_TRIATHLETE_M,
    TRAINER_CLASS_RUNNING_TRIATHLETE_M,
    TRAINER_CLASS_SWIMMING_TRIATHLETE_M,
    TRAINER_CLASS_DRAGON_TAMER,
    TRAINER_CLASS_BIRD_KEEPER,
    TRAINER_CLASS_NINJA_BOY,
    TRAINER_CLASS_SAILOR,
    TRAINER_CLASS_COLLECTOR,
    TRAINER_CLASS_POKEMON_BREEDER_M,
    TRAINER_CLASS_POKEMON_RANGER_M,
    TRAINER_CLASS_BUG_CATCHER,
    TRAINER_CLASS_HIKER, 
};

static const u8 sFemaleTrainerClasses[] = {
    TRAINER_CLASS_AROMA_LADY,
    TRAINER_CLASS_TUBER_F,
    TRAINER_CLASS_COOL_TRAINER_F,
    TRAINER_CLASS_HEX_MANIAC,
    TRAINER_CLASS_LADY,
    TRAINER_CLASS_BEAUTY,
    TRAINER_CLASS_PSYCHIC_F,
    TRAINER_CLASS_SCHOOL_KID_F,
    TRAINER_CLASS_POKEFAN_F,
    TRAINER_CLASS_EXPERT_F,
    TRAINER_CLASS_CYCLING_TRIATHLETE_F,
    TRAINER_CLASS_RUNNING_TRIATHLETE_F,
    TRAINER_CLASS_SWIMMING_TRIATHLETE_F,
    TRAINER_CLASS_BATTLE_GIRL,
    TRAINER_CLASS_PARASOL_LADY,
    TRAINER_CLASS_SWIMMER_F,
    TRAINER_CLASS_PICNICKER,
    TRAINER_CLASS_POKEMON_BREEDER_F,
    TRAINER_CLASS_POKEMON_RANGER_F,
    TRAINER_CLASS_LASS,
};

static const u8 sMaleTrainerGfxIds[] = {
    MAP_OBJ_GFX_HIKER,
    MAP_OBJ_GFX_TUBER_M,
    MAP_OBJ_GFX_MAN_4,
    MAP_OBJ_GFX_BOY_4,
    MAP_OBJ_GFX_MANIAC,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_M,
    MAP_OBJ_GFX_BLACK_BELT,
    MAP_OBJ_GFX_MAN_6,
    MAP_OBJ_GFX_MAN_6,
    MAP_OBJ_GFX_CAMPER,
    MAP_OBJ_GFX_MANIAC,
    MAP_OBJ_GFX_PSYCHIC_M,
    MAP_OBJ_GFX_GENTLEMAN,
    MAP_OBJ_GFX_SCHOOL_KID_M,
    MAP_OBJ_GFX_MAN_3,
    MAP_OBJ_GFX_OLD_MAN_1,
    MAP_OBJ_GFX_YOUNGSTER,
    MAP_OBJ_GFX_FISHERMAN,
    MAP_OBJ_GFX_CYCLING_TRIATHLETE_M,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_M,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_M,
    MAP_OBJ_GFX_MAN_4,
    MAP_OBJ_GFX_MAN_6,
    MAP_OBJ_GFX_LITTLE_BOY_1,
    MAP_OBJ_GFX_SAILOR,
    MAP_OBJ_GFX_MANIAC,
    MAP_OBJ_GFX_MAN_5,
    MAP_OBJ_GFX_CAMPER,
    MAP_OBJ_GFX_BUG_CATCHER,
    MAP_OBJ_GFX_HIKER,
};

static const u8 sFemaleTrainerGfxIds[] = {
    MAP_OBJ_GFX_WOMAN_3,
    MAP_OBJ_GFX_TUBER_F,
    MAP_OBJ_GFX_WOMAN_7,
    MAP_OBJ_GFX_WOMAN_1,
    MAP_OBJ_GFX_WOMAN_3,
    MAP_OBJ_GFX_BEAUTY,
    MAP_OBJ_GFX_LASS,
    MAP_OBJ_GFX_GIRL_3,
    MAP_OBJ_GFX_WOMAN_2,
    MAP_OBJ_GFX_OLD_WOMAN_1,
    MAP_OBJ_GFX_CYCLING_TRIATHLETE_F,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_F,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_F,
    MAP_OBJ_GFX_GIRL_3,
    MAP_OBJ_GFX_WOMAN_7,
    MAP_OBJ_GFX_RUNNING_TRIATHLETE_F,
    MAP_OBJ_GFX_PICNICKER,
    MAP_OBJ_GFX_WOMAN_3,
    MAP_OBJ_GFX_PICNICKER,
    MAP_OBJ_GFX_LASS,
};

const u16 gBattleTowerBannedSpecies[] = {
    SPECIES_MEW,
    SPECIES_MEWTWO,
    SPECIES_HO_OH,
    SPECIES_LUGIA,
    SPECIES_CELEBI,
    SPECIES_KYOGRE,
    SPECIES_GROUDON,
    SPECIES_RAYQUAZA,
    SPECIES_JIRACHI,
    SPECIES_DEOXYS,
    0xFFFF,
};

// Item prizes for battle tower streaks of 5 or fewer sets.
/*static*/ const u16 sShortStreakPrizes[] = {
    ITEM_HP_UP,
    ITEM_PROTEIN,
    ITEM_IRON,
    ITEM_CALCIUM,
    ITEM_CARBOS,
    ITEM_ZINC,
};

// Item prizes for battle tower streaks of greater than 5 sets.
/*static*/ const u16 sLongStreakPrizes[] = {
    ITEM_BRIGHT_POWDER,
    ITEM_WHITE_HERB,
    ITEM_QUICK_CLAW,
    ITEM_LEFTOVERS,
    ITEM_MENTAL_HERB,
    ITEM_KINGS_ROCK,
    ITEM_FOCUS_BAND,
    ITEM_SCOPE_LENS,
    ITEM_CHOICE_BAND,
};

static void ResetBattleTowerStreak(u8 levelType);
static void ValidateBattleTowerRecordChecksums(void);
static void PrintEReaderTrainerFarewellMessage(void);
extern void SetBattleTowerTrainerGfxId(u8);
extern void sub_8135A3C(void);
static void sub_8135CFC(void);
static void CheckMonBattleTowerBanlist(u16, u16, u16, u8, u8, u16 *, u16 *, u8 *);
static void ClearEReaderTrainer(struct BattleTowerEReaderTrainer *);
static void SetEReaderTrainerChecksum(struct BattleTowerEReaderTrainer *ereaderTrainer);
static void SetBattleTowerRecordChecksum(struct BattleTowerRecord *);
static void ClearBattleTowerRecord(struct BattleTowerRecord *);

extern const u8 BattleText_Format3[];
extern const u8 BattleText_Format4[];
extern const u8 BattleText_Format5[];
extern const u8 BattleText_Format6[];
extern const u8 BattleText_Format7[];
extern const u8 BattleText_Format8[];
extern const u8 BattleText_Format9[];
extern u16 gSpecialVar_0x8004;
extern u8 gTrainerClassToPicIndex[];
extern u8 gTrainerClassToNameIndex[];
extern u16 gTrainerBattleOpponent;
extern u16 gBattleTypeFlags;
extern u8 gSelectedOrderFromParty[];
extern u8 gBattleOutcome;
extern struct Pokemon gUnknown_030042FC[];
extern struct BattlePokemon gBattleMons[];

void sub_8134548(void)
{
    u8 var1 = 0;
    s32 levelType;

    for (levelType = 0; levelType < 2; levelType++)
    {
        switch (gSaveBlock2.battleTower.var_4AE[levelType])
        {
        case 0:
        default:
            ResetBattleTowerStreak(levelType);
            if (!var1)
            {
                VarSet(VAR_0x4000, 5);
            }
            break;
        case 1:
            ResetBattleTowerStreak(levelType);
            VarSet(VAR_0x4000, 1);
            var1++;
            break;
        case 4:
            VarSet(VAR_0x4000, 2);
            var1++;
            break;
        case 5:
            VarSet(VAR_0x4000, 3);
            var1++;
            break;
        case 2:
            VarSet(VAR_0x4000, 4);
            var1++;
            break;
        case 3:
        case 6:
            break;
        }
    }

    if ((gSaveBlock2.battleTower.var_4AE[0] == 3 || gSaveBlock2.battleTower.var_4AE[0] == 6)
        && (gSaveBlock2.battleTower.var_4AE[1] == 3 || gSaveBlock2.battleTower.var_4AE[1] == 6))
    {
        VarSet(VAR_0x4000, 5);
    }

    ValidateBattleTowerRecordChecksums();
}

void ResetBattleTowerStreak(u8 levelType)
{
    gSaveBlock2.battleTower.var_4AE[levelType] = 0;
    gSaveBlock2.battleTower.curChallengeBattleNum[levelType] = 1;
    gSaveBlock2.battleTower.curStreakChallengesNum[levelType] = 1;
}

// Checks if the next trainer in Battle Tower should be the E-Reader trainer.
bool8 ShouldBattleEReaderTrainer(u8 levelType, u16 winStreak)
{
    u8 trainerTeamLevel;
    u8 monLevel;
    s32 i;
    u16 validPartySpecies[6];
    u16 validPartyHeldItems[6];
    u8 numValid;

    numValid = 0;

    ValidateEReaderTrainer();

    if (gScriptResult != 0 || gSaveBlock2.battleTower.ereaderTrainer.winStreak != winStreak)
    {
        return FALSE;
    }

    trainerTeamLevel = 50;
    if (levelType != 0)
    {
        trainerTeamLevel = 100;
    }

    for (i = 0; i < 3; i++)
    {
        monLevel = gSaveBlock2.battleTower.ereaderTrainer.party[i].level;
        if (gSaveBlock2.battleTower.ereaderTrainer.party[i].level != trainerTeamLevel)
        {
            return FALSE;
        }

        CheckMonBattleTowerBanlist(
            gSaveBlock2.battleTower.ereaderTrainer.party[i].species,
            gSaveBlock2.battleTower.ereaderTrainer.party[i].heldItem,
            1,
            levelType,
            monLevel,
            validPartySpecies,
            validPartyHeldItems,
            &numValid);
    }

    return numValid == 3;
}

bool8 sub_81346F4(void)
{
    s32 recordIndex, i;
    u8 battleTowerLevelType;
    u16 winStreak;
    bool8 retVal;
    s32 numCandidates;
    u32 trainerIds[5];

    numCandidates = 0;
    battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    winStreak = GetCurrentBattleTowerWinStreak(battleTowerLevelType);
    if (ShouldBattleEReaderTrainer(battleTowerLevelType, winStreak))
    {
        gSaveBlock2.battleTower.battleTowerTrainerId = BATTLE_TOWER_EREADER_TRAINER_ID;
        retVal = TRUE;
    }
    else
    {
        // Check if one of the battle tower trainers from record mixing should be the next trainer.
        for (recordIndex = 0; recordIndex < 5; recordIndex++)
        {
            struct BattleTowerRecord *record = &gSaveBlock2.battleTower.records[recordIndex];
            u32 recordHasData = 0;
            u32 checksum = 0;
            for (i = 0; i < sizeof(struct BattleTowerRecord) / sizeof(u32) - 1; i++)
            {
                recordHasData |= ((u32 *)record)[i];
                checksum += ((u32 *)record)[i];
            }

            if (gSaveBlock2.battleTower.records[recordIndex].winStreak == winStreak
                && gSaveBlock2.battleTower.records[recordIndex].battleTowerLevelType == battleTowerLevelType
                && recordHasData
                && gSaveBlock2.battleTower.records[recordIndex].checksum == checksum)
            {
                trainerIds[numCandidates] = recordIndex;
                numCandidates++;
            }
        }

        if (numCandidates == 0)
        {
            retVal = FALSE;
        }
        else
        {
            gSaveBlock2.battleTower.battleTowerTrainerId = trainerIds[Random() % numCandidates] + BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID;
            retVal = TRUE;
        }
    }

    return retVal;
}

// void sub_81347F8(void)
// {
//     bool8 levelType = gSaveBlock2.battleTower.battleTowerLevelType;
//     if (sub_81346F4())
//     {
//         SetBattleTowerTrainerGfxId(gSaveBlock2.battleTower.battleTowerTrainerId);
//         gSaveBlock2.battleTower.var_4C1[gSaveBlock2.battleTower.curChallengeBattleNum[levelType]] = gSaveBlock2.battleTower.battleTowerTrainerId;
//     }
//     else
//     {
//         u16 var1;

//         if (gSaveBlock2.battleTower.curStreakChallengesNum[levelType] > 7)
//         {
//             while (1)
//             {
//                 s32 i;
//                 u32 temp = ((Random() & 0xFF) * 30) >> 8;
//                 var1 = temp + 70;
//                 for (i = 0; i < gSaveBlock2.battleTower.curChallengeBattleNum[levelType] - 1 && var1 != gSaveBlock2.battleTower.var_4C1[i]; i++) // TODO: [i + 1]???
//                 { }

//                 if (i == gSaveBlock2.battleTower.curChallengeBattleNum[levelType] - 1)
//                 {
//                     break;
//                 }
//             }
//         }
//         else
//         {
//             if (gSaveBlock2.battleTower.curChallengeBattleNum[levelType] == 7)
//             {
//                 while (1)
//                 {
//                     s32 i;
//                     u32 temp = ((Random() & 0xFF) * 5);
//                     u32 temp2 = (((gSaveBlock2.battleTower.curStreakChallengesNum[levelType] - 1) * 10) + 20);
//                     var1 = temp / 128 + temp2;
//                     for (i = 0; i < gSaveBlock2.battleTower.curChallengeBattleNum[levelType] - 1 && gSaveBlock2.battleTower.var_4C1[i] != var1; i++) // TODO: [i + 1]????
//                     { }

//                     if (i == gSaveBlock2.battleTower.curChallengeBattleNum[levelType] - 1)
//                     {
//                         break;
//                     }
//                 }
//             }
//             else
//             {
//                 while (1)
//                 {
//                     s32 i;
//                     u32 temp = ((Random() & 0xFF) * 320);
//                     u32 temp2 = ((gSaveBlock2.battleTower.curStreakChallengesNum[levelType] - 1) * 10);
//                     var1 = temp + temp2;
//                     for (i = 0; i < gSaveBlock2.battleTower.curChallengeBattleNum[levelType] - 1 && gSaveBlock2.battleTower.var_4C1[i] != var1; i++)
//                     { }

//                     if (i == gSaveBlock2.battleTower.curChallengeBattleNum[levelType] - 1)
//                     {
//                         break;
//                     }
//                 }
//             }
//         }

//         gSaveBlock2.battleTower.battleTowerTrainerId = var1;
//         SetBattleTowerTrainerGfxId(gSaveBlock2.battleTower.battleTowerTrainerId);

//         if (gSaveBlock2.battleTower.curChallengeBattleNum[levelType] < 7)
//         {
//             gSaveBlock2.battleTower.var_4C1[gSaveBlock2.battleTower.curChallengeBattleNum[levelType]] = gSaveBlock2.battleTower.battleTowerTrainerId;
//         }
//     }
// }

__attribute__((naked))
void sub_81347F8(void)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    ldr r5, _08134838 @ =gSaveBlock2\n\
    ldr r1, _0813483C @ =0x00000554\n\
    adds r0, r5, r1\n\
    ldrb r0, [r0]\n\
    lsls r0, 31\n\
    lsrs r6, r0, 31\n\
    bl sub_81346F4\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    beq _08134848\n\
    ldr r2, _08134840 @ =0x00000564\n\
    adds r4, r5, r2\n\
    ldrb r0, [r4]\n\
    bl SetBattleTowerTrainerGfxId\n\
    lsls r0, r6, 1\n\
    movs r3, 0xAB\n\
    lsls r3, 3\n\
    adds r1, r5, r3\n\
    adds r0, r1\n\
    ldrh r0, [r0]\n\
    adds r0, r5, r0\n\
    ldr r1, _08134844 @ =0x00000569\n\
    adds r0, r1\n\
    ldrb r1, [r4]\n\
    b _081349DC\n\
    .align 2, 0\n\
_08134838: .4byte gSaveBlock2\n\
_0813483C: .4byte 0x00000554\n\
_08134840: .4byte 0x00000564\n\
_08134844: .4byte 0x00000569\n\
_08134848:\n\
    lsls r0, r6, 1\n\
    ldr r2, _081348D8 @ =0x0000055c\n\
    adds r1, r5, r2\n\
    adds r1, r0, r1\n\
    ldrh r1, [r1]\n\
    adds r7, r0, 0\n\
    cmp r1, 0x7\n\
    bls _0813485A\n\
    b _0813495C\n\
_0813485A:\n\
    movs r3, 0xAB\n\
    lsls r3, 3\n\
    adds r0, r5, r3\n\
    adds r1, r7, r0\n\
    ldrh r0, [r1]\n\
    cmp r0, 0x7\n\
    bne _081348E4\n\
    adds r6, r5, 0\n\
    mov r9, r7\n\
    adds r5, r1, 0\n\
    ldr r0, _081348DC @ =0x0000056a\n\
    adds r0, r6\n\
    mov r10, r0\n\
    mov r8, r5\n\
_08134876:\n\
    bl Random\n\
    movs r1, 0xFF\n\
    ands r1, r0\n\
    lsls r2, r1, 2\n\
    adds r2, r1\n\
    ldr r1, _081348D8 @ =0x0000055c\n\
    adds r4, r6, r1\n\
    mov r3, r9\n\
    adds r0, r3, r4\n\
    ldrh r1, [r0]\n\
    subs r1, 0x1\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 1\n\
    adds r0, 0x14\n\
    lsrs r2, 7\n\
    adds r2, r0\n\
    lsls r2, 16\n\
    lsrs r2, 16\n\
    movs r1, 0\n\
    ldrh r0, [r5]\n\
    subs r0, 0x1\n\
    cmp r1, r0\n\
    bge _081348C8\n\
    mov r3, r10\n\
    ldrb r0, [r3]\n\
    cmp r0, r2\n\
    beq _081348C8\n\
    subs r0, r4, 0x4\n\
    adds r0, r7, r0\n\
    ldrh r0, [r0]\n\
    subs r3, r0, 0x1\n\
    adds r4, 0xE\n\
_081348BA:\n\
    adds r1, 0x1\n\
    cmp r1, r3\n\
    bge _081348C8\n\
    adds r0, r1, r4\n\
    ldrb r0, [r0]\n\
    cmp r0, r2\n\
    bne _081348BA\n\
_081348C8:\n\
    mov r3, r8\n\
    ldrh r0, [r3]\n\
    subs r0, 0x1\n\
    ldr r4, _081348E0 @ =gSaveBlock2\n\
    cmp r1, r0\n\
    bne _08134876\n\
    b _081349B6\n\
    .align 2, 0\n\
_081348D8: .4byte 0x0000055c\n\
_081348DC: .4byte 0x0000056a\n\
_081348E0: .4byte gSaveBlock2\n\
_081348E4:\n\
    adds r6, r5, 0\n\
    mov r9, r7\n\
    adds r5, r1, 0\n\
    ldr r2, _08134950 @ =0x0000056a\n\
    adds r2, r6\n\
    mov r10, r2\n\
    mov r8, r5\n\
_081348F2:\n\
    bl Random\n\
    movs r1, 0xFF\n\
    ands r1, r0\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsrs r2, r0, 6\n\
    ldr r3, _08134954 @ =0x0000055c\n\
    adds r4, r6, r3\n\
    mov r1, r9\n\
    adds r0, r1, r4\n\
    ldrh r1, [r0]\n\
    subs r1, 0x1\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 1\n\
    adds r0, r2, r0\n\
    lsls r0, 16\n\
    lsrs r2, r0, 16\n\
    movs r1, 0\n\
    ldrh r0, [r5]\n\
    subs r0, 0x1\n\
    cmp r1, r0\n\
    bge _08134942\n\
    mov r3, r10\n\
    ldrb r0, [r3]\n\
    cmp r0, r2\n\
    beq _08134942\n\
    subs r0, r4, 0x4\n\
    adds r0, r7, r0\n\
    ldrh r0, [r0]\n\
    subs r3, r0, 0x1\n\
    adds r4, 0xE\n\
_08134934:\n\
    adds r1, 0x1\n\
    cmp r1, r3\n\
    bge _08134942\n\
    adds r0, r1, r4\n\
    ldrb r0, [r0]\n\
    cmp r0, r2\n\
    bne _08134934\n\
_08134942:\n\
    mov r3, r8\n\
    ldrh r0, [r3]\n\
    subs r0, 0x1\n\
    ldr r4, _08134958 @ =gSaveBlock2\n\
    cmp r1, r0\n\
    bne _081348F2\n\
    b _081349B6\n\
    .align 2, 0\n\
_08134950: .4byte 0x0000056a\n\
_08134954: .4byte 0x0000055c\n\
_08134958: .4byte gSaveBlock2\n\
_0813495C:\n\
    movs r2, 0xAB\n\
    lsls r2, 3\n\
    adds r0, r5, r2\n\
    adds r6, r7, r0\n\
    ldr r3, _081349EC @ =0x0000056a\n\
    adds r3, r5\n\
    mov r8, r3\n\
    adds r5, r6, 0\n\
_0813496C:\n\
    bl Random\n\
    movs r1, 0xFF\n\
    ands r1, r0\n\
    lsls r0, r1, 4\n\
    subs r0, r1\n\
    lsls r0, 1\n\
    asrs r0, 8\n\
    adds r0, 0x46\n\
    lsls r0, 16\n\
    lsrs r2, r0, 16\n\
    movs r1, 0\n\
    ldrh r0, [r6]\n\
    subs r0, 0x1\n\
    cmp r1, r0\n\
    bge _081349AC\n\
    mov r3, r8\n\
    ldrb r0, [r3]\n\
    ldr r4, _081349F0 @ =gSaveBlock2\n\
    cmp r0, r2\n\
    beq _081349AC\n\
    ldrh r0, [r5]\n\
    subs r3, r0, 0x1\n\
    ldr r0, _081349EC @ =0x0000056a\n\
    adds r4, r0\n\
_0813499E:\n\
    adds r1, 0x1\n\
    cmp r1, r3\n\
    bge _081349AC\n\
    adds r0, r1, r4\n\
    ldrb r0, [r0]\n\
    cmp r0, r2\n\
    bne _0813499E\n\
_081349AC:\n\
    ldrh r0, [r6]\n\
    subs r0, 0x1\n\
    ldr r4, _081349F0 @ =gSaveBlock2\n\
    cmp r1, r0\n\
    bne _0813496C\n\
_081349B6:\n\
    ldr r1, _081349F4 @ =0x00000564\n\
    adds r0, r4, r1\n\
    strb r2, [r0]\n\
    ldr r2, _081349F4 @ =0x00000564\n\
    adds r5, r4, r2\n\
    ldrb r0, [r5]\n\
    bl SetBattleTowerTrainerGfxId\n\
    movs r3, 0xAB\n\
    lsls r3, 3\n\
    adds r0, r4, r3\n\
    adds r1, r7, r0\n\
    ldrh r0, [r1]\n\
    cmp r0, 0x6\n\
    bhi _081349DE\n\
    adds r0, r4, r0\n\
    ldr r1, _081349F8 @ =0x00000569\n\
    adds r0, r1\n\
    ldrb r1, [r5]\n\
_081349DC:\n\
    strb r1, [r0]\n\
_081349DE:\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_081349EC: .4byte 0x0000056a\n\
_081349F0: .4byte gSaveBlock2\n\
_081349F4: .4byte 0x00000564\n\
_081349F8: .4byte 0x00000569\n\
.syntax divided\n");
}

void SetBattleTowerTrainerGfxId(u8 trainerIndex)
{
    u32 i;
    u8 trainerClass;

    if (trainerIndex < BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
    {
        trainerClass = gBattleTowerTrainers[trainerIndex].trainerClass;
    }
    else if (trainerIndex < BATTLE_TOWER_EREADER_TRAINER_ID)
    {
        trainerClass = gSaveBlock2.battleTower.records[trainerIndex - BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID].trainerClass;
    }
    else
    {
        trainerClass = gSaveBlock2.battleTower.ereaderTrainer.trainerClass;
    }

    for (i = 0; i < 30 && sMaleTrainerClasses[i] != trainerClass; i++);
    if (i != 30)
    {
        u8 trainerObjectGfxId = sMaleTrainerGfxIds[i];
        VarSet(0x4010, trainerObjectGfxId);
        return;
    }

    for (i = 0; i < 20 && sFemaleTrainerClasses[i] != trainerClass; i++);
    if (i != 20)
    {
        u8 trainerObjectGfxId = sFemaleTrainerGfxIds[i];
        VarSet(0x4010, trainerObjectGfxId);
        return;
    }

    VarSet(0x4010, MAP_OBJ_GFX_BOY_1);
}

void SetEReaderTrainerGfxId(void)
{
    SetBattleTowerTrainerGfxId(BATTLE_TOWER_EREADER_TRAINER_ID);
}

// void sub_8134AC0(struct BattleTowerRecord *record)
// {
//     u16 var1[6];
//     u16 var2[6];
//     s32 i, j, k;
//     s16 l = 0;

//     for (i = 0; i < 5; i++)
//     {
//         k = 0;
//         for (j = 0; j < 4 && gSaveBlock2.battleTower.records[i].trainerId[j] == record->trainerId[j]; j++);
//         if (j == 4)
//         {
//             for (; k < 7 && gSaveBlock2.battleTower.records[i].name[4] == record->name[4]; k++)
//             {
//                 if (record->name[4] == 0xFF)
//                 {
//                     k = 7;
//                     break;
//                 }
//             }
//         }

//         if (k == 7)
//         {
//             break;
//         }
//     }

//     if (i < 5)
//     {
//         gSaveBlock2.battleTower.records[i] = *record;
//         return;
//     }

//     i = 0;
//     while (i < 5)
//     {
//         if (gSaveBlock2.battleTower.records[i].winStreak == 0)
//         {
//             if (i > 4)
//             {
//                 break;
//             }

//             gSaveBlock2.battleTower.records[i] = *record;
//             return;
//         }

//         i++;
//     }

//     var1[0] = gSaveBlock2.battleTower.records[0].winStreak;
//     var2[0] = 0;
//     l++;

//     for (i = 1; i < 5; i++)
//     {
//         j = 0;
//         if (j < l)
//         {
//             for (; gSaveBlock2.battleTower.records[i].winStreak <= var1[j]; j++)
//             {
//                 if (gSaveBlock2.battleTower.records[i].winStreak < var1[j])
//                 {
//                     j = 0;
//                     l = 1;
//                     var1[0] = gSaveBlock2.battleTower.records[i].winStreak;
//                     var2[0] = i;
//                     break;
//                 }
//             }
//         }

//         if (j == l)
//         {
//             var1[l] = gSaveBlock2.battleTower.records[i].winStreak;
//             var2[l] = i;
//             l++;
//         }
//     }

//     gSaveBlock2.battleTower.records[var2[(Random() % l)]] = *record;
// }
__attribute__((naked))
void sub_8134AC0(struct BattleTowerRecord *record)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x1C\n\
    movs r7, 0\n\
    mov r8, r0\n\
    movs r5, 0\n\
    ldr r0, _08134B3C @ =gSaveBlock2\n\
    mov r12, r0\n\
    mov r1, r8\n\
    ldrb r1, [r1, 0xC]\n\
    str r1, [sp, 0x18]\n\
    movs r2, 0xAA\n\
    lsls r2, 1\n\
    add r2, r12\n\
    mov r10, r2\n\
    mov r9, r5\n\
_08134AE6:\n\
    movs r6, 0\n\
    movs r3, 0\n\
    ldr r0, _08134B40 @ =gSaveBlock2 + 0x158\n\
    add r0, r9\n\
    ldrb r0, [r0]\n\
    ldr r1, [sp, 0x18]\n\
    cmp r0, r1\n\
    bne _08134B14\n\
    movs r0, 0xA4\n\
    muls r0, r5\n\
    ldr r1, _08134B40 @ =gSaveBlock2 + 0x158\n\
    adds r2, r0, r1\n\
    mov r4, r8\n\
    adds r4, 0xC\n\
_08134B02:\n\
    adds r2, 0x1\n\
    adds r3, 0x1\n\
    cmp r3, 0x3\n\
    bgt _08134B14\n\
    adds r1, r4, r3\n\
    ldrb r0, [r2]\n\
    ldrb r1, [r1]\n\
    cmp r0, r1\n\
    beq _08134B02\n\
_08134B14:\n\
    cmp r3, 0x4\n\
    bne _08134B54\n\
    movs r6, 0\n\
    mov r2, r10\n\
    ldrb r0, [r2]\n\
    mov r3, r8\n\
    ldrb r3, [r3, 0x8]\n\
    cmp r0, r3\n\
    bne _08134B54\n\
    adds r1, r0, 0\n\
    movs r0, 0xA4\n\
    muls r0, r5\n\
    adds r0, 0x4\n\
    ldr r3, _08134B44 @ =gSaveBlock2 + 0x150\n\
    adds r2, r0, r3\n\
_08134B32:\n\
    cmp r1, 0xFF\n\
    bne _08134B48\n\
    movs r6, 0x7\n\
    b _08134B54\n\
    .align 2, 0\n\
_08134B3C: .4byte gSaveBlock2\n\
_08134B40: .4byte gSaveBlock2 + 0x158\n\
_08134B44: .4byte gSaveBlock2 + 0x150\n\
_08134B48:\n\
    adds r6, 0x1\n\
    cmp r6, 0x6\n\
    bgt _08134B54\n\
    ldrb r0, [r2]\n\
    cmp r0, r1\n\
    beq _08134B32\n\
_08134B54:\n\
    cmp r6, 0x7\n\
    beq _08134B64\n\
    movs r0, 0xA4\n\
    add r10, r0\n\
    add r9, r0\n\
    adds r5, 0x1\n\
    cmp r5, 0x4\n\
    ble _08134AE6\n\
\n\
_08134B64:\n\
    cmp r5, 0x4\n\
    bgt _08134B76\n\
    movs r0, 0xA4\n\
    muls r0, r5\n\
    add r0, r12\n\
    movs r1, 0xA6\n\
    lsls r1, 1\n\
    adds r0, r1\n\
    b _08134B9E\n\
_08134B76:\n\
    movs r5, 0\n\
    movs r1, 0xA7\n\
    lsls r1, 1\n\
    add r1, r12\n\
    b _08134B88\n\
_08134B80:\n\
    adds r1, 0xA4\n\
    adds r5, 0x1\n\
    cmp r5, 0x4\n\
    bgt _08134BA8\n\
_08134B88:\n\
    ldrh r0, [r1]\n\
    cmp r0, 0\n\
    bne _08134B80\n\
    cmp r5, 0x4\n\
    bgt _08134BA8\n\
    movs r0, 0xA4\n\
    muls r0, r5\n\
    add r0, r12\n\
    movs r2, 0xA6\n\
    lsls r2, 1\n\
    adds r0, r2\n\
_08134B9E:\n\
    mov r1, r8\n\
    movs r2, 0xA4\n\
    bl memcpy\n\
    b _08134C5E\n\
\n\
_08134BA8:\n\
    mov r2, sp\n\
    movs r3, 0xA7\n\
    lsls r3, 1\n\
    mov r1, r12\n\
    adds r0, r1, r3\n\
    ldrh r0, [r0]\n\
    movs r1, 0\n\
    strh r0, [r2]\n\
    add r0, sp, 0xC\n\
    strh r1, [r0]\n\
    adds r7, 0x1\n\
    movs r5, 0x1\n\
    add r2, sp, 0xC  @var2 = r2\n\
    mov r9, r2\n\
    mov r10, r3\n\
_08134BC6:\n\
    movs r3, 0\n\
    adds r0, r5, 0x1\n\
    mov r12, r0\n\
    cmp r3, r7\n\
    bge _08134C0A  @ j < l\n\
    movs r1, 0xA4\n\
    adds r0, r5, 0\n\
    muls r0, r1\n\
    ldr r2, _08134BFC @ =gSaveBlock2\n\
    adds r0, r2\n\
    mov r1, r10\n\
    adds r4, r0, r1\n\
    mov r6, sp\n\
_08134BE0:\n\
    lsls r0, r3, 1\n\
    add r0, sp\n\
    ldrh r2, [r4]\n\
    adds r1, r2, 0\n\
    ldrh r0, [r0]\n\
    cmp r1, r0\n\
    bcs _08134C00\n\
    movs r3, 0\n\
    movs r7, 0x1\n\
    strh r2, [r6]\n\
    mov r2, r9\n\
    strh r5, [r2]\n\
    b _08134C0A\n\
    .align 2, 0\n\
_08134BFC: .4byte gSaveBlock2\n\
_08134C00:\n\
    cmp r1, r0\n\
    bhi _08134C0A\n\
    adds r3, 0x1\n\
    cmp r3, r7\n\
    blt _08134BE0\n\
_08134C0A:\n\
    cmp r3, r7\n\
    bne _08134C2A\n\
    lsls r1, r7, 1\n\
    mov r3, sp\n\
    adds r2, r3, r1\n\
    movs r3, 0xA4\n\
    adds r0, r5, 0\n\
    muls r0, r3\n\
    ldr r3, _08134C70 @ =gSaveBlock2\n\
    adds r0, r3\n\
    add r0, r10\n\
    ldrh r0, [r0]\n\
    strh r0, [r2]\n\
    add r1, r9\n\
    strh r5, [r1]\n\
    adds r7, 0x1\n\
_08134C2A:\n\
    mov r5, r12\n\
    cmp r5, 0x4\n\
    ble _08134BC6\n\
    bl Random\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    adds r1, r7, 0\n\
    bl __modsi3\n\
    adds r5, r0, 0\n\
    ldr r2, _08134C70 @ =gSaveBlock2\n\
    lsls r0, r5, 1\n\
    add r0, sp\n\
    adds r0, 0xC\n\
    ldrh r1, [r0]\n\
    movs r0, 0xA4\n\
    muls r0, r1\n\
    adds r0, r2\n\
    movs r1, 0xA6\n\
    lsls r1, 1\n\
    adds r0, r1\n\
    mov r1, r8\n\
    movs r2, 0xA4\n\
    bl memcpy\n\
_08134C5E:\n\
    add sp, 0x1C\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08134C70: .4byte gSaveBlock2\n\
    .syntax divided\n");
}

u8 get_trainer_class_pic_index(void)
{
    if (gSaveBlock2.battleTower.battleTowerTrainerId == BATTLE_TOWER_EREADER_TRAINER_ID)
    {
        return gTrainerClassToPicIndex[gSaveBlock2.battleTower.ereaderTrainer.trainerClass];
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
    {
        return gTrainerClassToPicIndex[gBattleTowerTrainers[gSaveBlock2.battleTower.battleTowerTrainerId].trainerClass];
    }
    else
    {
        return gTrainerClassToPicIndex[gSaveBlock2.battleTower.records[gSaveBlock2.battleTower.battleTowerTrainerId - BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID].trainerClass];
    }
}

u8 get_trainer_class_name_index(void)
{
    if (gSaveBlock2.battleTower.battleTowerTrainerId == BATTLE_TOWER_EREADER_TRAINER_ID)
    {
        return gTrainerClassToNameIndex[gSaveBlock2.battleTower.ereaderTrainer.trainerClass];
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId >= BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
    {
        return gTrainerClassToNameIndex[gSaveBlock2.battleTower.records[gSaveBlock2.battleTower.battleTowerTrainerId - BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID].trainerClass];
    }
    else
    {
        return gTrainerClassToNameIndex[gBattleTowerTrainers[gSaveBlock2.battleTower.battleTowerTrainerId].trainerClass];
    }
}

void get_trainer_name(u8* dest)
{
    s32 i;

    if (gSaveBlock2.battleTower.battleTowerTrainerId == BATTLE_TOWER_EREADER_TRAINER_ID)
    {
        for (i = 0; i < 7; i++)
        {
            dest[i] = gSaveBlock2.battleTower.ereaderTrainer.name[i];
        }
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
    {
        for (i = 0; i < 7; i++)
        {
            dest[i] = gBattleTowerTrainers[gSaveBlock2.battleTower.battleTowerTrainerId].name[i];
        }
    }
    else
    {
        for (i = 0; i < 7; i++)
        {
            dest[i] = gSaveBlock2.battleTower.records[gSaveBlock2.battleTower.battleTowerTrainerId - BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID].name[i];
        }
    }

    dest[i] = 0xFF;
}

void FillBattleTowerTrainerParty(void)
{
    s32 partyIndex, i;
    u16 chosenMonIndices[3];
    u8 friendship;
    u8 level;
    u8 fixedIV;
    u8 battleMonsOffset;
    u8 monPoolSize;
    u8 teamFlags;
    const struct BattleTowerPokemon *battleTowerMons;

    battleMonsOffset = 0;
    monPoolSize = 60;
    friendship = 255;

    ZeroEnemyPartyMons();

    // Different trainers have access to different sets of pokemon to use in battle.
    // The pokemon later in gBattleTowerLevel100Mons or gBattleTowerLevel50Mons are
    // stronger. Additionally, the later trainers' pokemon are granted higher IVs.
    if (gSaveBlock2.battleTower.battleTowerTrainerId < 20)
    {
        fixedIV = 6;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 30)
    {
        fixedIV = 9;
        battleMonsOffset = 30;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 40)
    {
        fixedIV = 12;
        battleMonsOffset = 60;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 50)
    {
        fixedIV = 15;
        battleMonsOffset = 90;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 60)
    {
        fixedIV = 18;
        battleMonsOffset = 120;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 70)
    {
        fixedIV = 21;
        battleMonsOffset = 150;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < 80)
    {
        fixedIV = 31;
        battleMonsOffset = 180;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
    {
        fixedIV = 31;
        battleMonsOffset = 200;
        monPoolSize = 100;
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId == BATTLE_TOWER_EREADER_TRAINER_ID)
    {
        // Load E-Reader trainer's party.
        for (partyIndex = 0; partyIndex < 3; partyIndex++)
        {
            sub_803ADE8(&gEnemyParty[partyIndex], &gSaveBlock2.battleTower.ereaderTrainer.party[partyIndex]);
        }

        return;
    }
    else
    {
        // Load a battle tower record's party. (From record mixing)
        for (partyIndex = 0; partyIndex < 3; partyIndex++)
        {
            sub_803ADE8(
                &gEnemyParty[partyIndex],
                &gSaveBlock2.battleTower.records[gSaveBlock2.battleTower.battleTowerTrainerId - BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID].party[partyIndex]);
        }

        return;
    }

    // Use the appropriate list of pokemon and level depending on the
    // current challenge type. (level 50 or level 100 challenge)
    if (gSaveBlock2.battleTower.battleTowerLevelType != 0)
    {
        battleTowerMons = gBattleTowerLevel100Mons;
        level = 100;
    }
    else
    {
        battleTowerMons = gBattleTowerLevel50Mons;
        level = 50;
    }

    teamFlags = gBattleTowerTrainers[gSaveBlock2.battleTower.battleTowerTrainerId].teamFlags;

    // Attempt to fill the trainer's party with random Pokemon until 3 have been
    // successfully chosen. The trainer's party may not have duplicate pokemon species
    // or duplicate held items. Each pokemon must have all of the trainer's team flags
    // set, as well.  If any of those conditions are not met, then the loop starts over
    // and another pokemon is chosen at random.
    partyIndex = 0;
    while (partyIndex != 3)
    {
        // Pick a random pokemon index based on the number of pokemon available to choose from
        // and the starting offset in the battle tower pokemon array.
        s32 battleMonIndex = ((Random() & 0xFF) * monPoolSize) / 256 + battleMonsOffset;

        // Ensure the chosen pokemon has compatible team flags with the trainer.
        if (teamFlags == 0 || (battleTowerMons[battleMonIndex].teamFlags & teamFlags) == teamFlags)
        {
            // Ensure this pokemon species isn't a duplicate.
            for (i = 0; i < partyIndex; i++)
            {
                if (GetMonData(&gEnemyParty[i], MON_DATA_SPECIES, NULL) == battleTowerMons[battleMonIndex].species)
                    break;
            }

            if (i != partyIndex)
                continue;

            // Ensure this pokemon's held item isn't a duplicate.
            for (i = 0; i < partyIndex; i++)
            {
                if (GetMonData(&gEnemyParty[i], MON_DATA_HELD_ITEM, NULL) != 0
                    && GetMonData(&gEnemyParty[i], MON_DATA_HELD_ITEM, NULL) == sBattleTowerHeldItems[battleTowerMons[battleMonIndex].heldItem])
                {
                    break;
                }
            }

            if (i != partyIndex)
                continue;

            // Ensure this exact pokemon index isn't a duplicate. This check doesn't seem necessary
            // because the species and held items were already checked directly above. Perhaps this
            // is leftover code before the logic for duplicate species and held items was added.
            for (i = 0; i < partyIndex && chosenMonIndices[i] != battleMonIndex; i++);

            if (i != partyIndex)
                continue;

            chosenMonIndices[partyIndex] = battleMonIndex;

            // Place the chosen pokemon into the trainer's party.
            CreateMonWithEVSpread(
                &gEnemyParty[partyIndex],
                battleTowerMons[battleMonIndex].species,
                level,
                fixedIV,
                battleTowerMons[battleMonIndex].evSpread);

            // Give the chosen pokemon its specified moves.
            for (i = 0; i < 4; i++)
            {
                SetMonMoveSlot(&gEnemyParty[partyIndex], battleTowerMons[battleMonIndex].moves[i], i);
                if (battleTowerMons[battleMonIndex].moves[i] == MOVE_FRUSTRATION)
                {
                    // MOVE_FRUSTRATION is more powerful the lower the pokemon's friendship is.
                    friendship = 0;
                }
            }

            SetMonData(&gEnemyParty[partyIndex], MON_DATA_FRIENDSHIP, &friendship);
            SetMonData(&gEnemyParty[partyIndex], MON_DATA_HELD_ITEM, &sBattleTowerHeldItems[battleTowerMons[battleMonIndex].heldItem]);

            // The pokemon was successfully added to the trainer's party, so it's safe to move on to
            // the next party slot.
            partyIndex++;
        }
    }
}

u32 CountBattleTowerBanlistCaught(void)
{
    s32 i;
    u32 numCaught = 0;

    for (i = 0; gBattleTowerBannedSpecies[i] != 0xFFFF; i++)
    {
        if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(gBattleTowerBannedSpecies[i]), FLAG_GET_CAUGHT))
        {
            numCaught++;
        }
    }

    return numCaught;
}

u8 AppendBattleTowerBannedSpeciesName(u16 species, u8 curIndexToAppend, s32 numToAppend)
{
    if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), FLAG_GET_CAUGHT))
    {
        curIndexToAppend++;

        switch (curIndexToAppend - 1)
        {
        case 0:
        case 2:
        case 4:
        case 6:
        case 8:
        case 10:
            if (numToAppend == curIndexToAppend)
            {
                //StringAppend(gStringVar1, BattleText_Format3);
            }
            else if (numToAppend > curIndexToAppend)
            {
                StringAppend(gStringVar1, BattleText_Format4);
            }
            break;
        case 1:
            if (curIndexToAppend == numToAppend)
            {
                //StringAppend(gStringVar1, BattleText_Format3);
            }
            else
            {
                StringAppend(gStringVar1, BattleText_Format4);
            }

            StringAppend(gStringVar1, BattleText_Format7);
            break;
        case 3:
        case 5:
        case 7:
        case 9:
        default:
            if (curIndexToAppend == numToAppend)
            {
                //StringAppend(gStringVar1, BattleText_Format3);
            }
            else
            {
                StringAppend(gStringVar1, BattleText_Format4);
            }

            StringAppend(gStringVar1, BattleText_Format6);
            break;
        }

        StringAppend(gStringVar1, gSpeciesNames[species]);
    }

    return curIndexToAppend;
}

void CheckMonBattleTowerBanlist(u16 species, u16 heldItem, u16 hp, u8 battleTowerLevelType, u8 monLevel, u16 *validPartySpecies, u16 *validPartyHeldItems, u8 *numValid)
{
    s32 i;
    u32 counter = 0;

    if (species == SPECIES_EGG || species == SPECIES_NONE)
        return;

    while (1)
    {
        if (gBattleTowerBannedSpecies[counter] == 0xFFFF)
            goto EXIT2; // Couldn't get the code to match without this GOTO

        if (gBattleTowerBannedSpecies[counter] == species)
            break;

        counter++;
    }

    if (gBattleTowerBannedSpecies[counter] != 0xFFFF)
        return;

    EXIT2:
    if (battleTowerLevelType == 0 && monLevel > 50)
        return;

    for (i = 0; i < *numValid && validPartySpecies[i] != species ; i++);
    if (i != *numValid)
        return;

    if (heldItem != 0)
    {
        for (i = 0; i < *numValid && validPartyHeldItems[i] != heldItem ; i++);
        if (i != *numValid)
            return;
    }

    validPartySpecies[*numValid] = species;
    validPartyHeldItems[*numValid] = heldItem;
    *numValid = *numValid + 1;
}

void CheckPartyBattleTowerBanlist(void)
{
    s32 i;
    u16 species2;
    u16 heldItem;
    u8 level;
    u16 hp;
    u32 numBanlistCaught;
    u16 validPartySpecies[6];
    u16 validPartyHeldItems[6];
    u8 counter;

    counter = 0;

    for (i = 0; i < PARTY_SIZE; i++)
    {
        species2 = GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2);
        heldItem = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
        level = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);
        hp = GetMonData(&gPlayerParty[i], MON_DATA_HP);

        CheckMonBattleTowerBanlist(species2, heldItem, hp, gScriptResult, level, validPartySpecies, validPartyHeldItems, &counter);
    }

    if (counter < 3)
    {
        gStringVar1[0] = 0xFF;
        gSpecialVar_0x8004 = 1;
        counter = 0;

        numBanlistCaught = CountBattleTowerBanlistCaught();

        for (i = 0; gBattleTowerBannedSpecies[i] != 0xFFFF; i++)
        {
            counter = AppendBattleTowerBannedSpeciesName(gBattleTowerBannedSpecies[i], counter, numBanlistCaught);
        }

        if (counter == 0)
        {
            //StringAppend(gStringVar1, BattleText_Format5);
            //StringAppend(gStringVar1, BattleText_Format8);
            return;
        }
        
        if (1 & counter)
            StringAppend(gStringVar1, BattleText_Format6);
        //else
        //    StringAppend(gStringVar1, BattleText_Format5);

        //StringAppend(gStringVar1, BattleText_Format9);
    }
    else
    {
        gSpecialVar_0x8004 = 0;
        gSaveBlock2.battleTower.battleTowerLevelType = gScriptResult;
    }
}

void PrintBattleTowerTrainerMessage(u16 *easyChat)
{
    sub_80EB544(gStringVar4, easyChat, 2, 3);
}

void PrintBattleTowerTrainerGreeting(void)
{
    if (gSaveBlock2.battleTower.battleTowerTrainerId == BATTLE_TOWER_EREADER_TRAINER_ID)
    {
        PrintBattleTowerTrainerMessage(gSaveBlock2.battleTower.ereaderTrainer.greeting.easyChat);
    }
    else if (gSaveBlock2.battleTower.battleTowerTrainerId < BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID)
    {
        PrintBattleTowerTrainerMessage((u16 *)gBattleTowerTrainers[gSaveBlock2.battleTower.battleTowerTrainerId].greeting.easyChat);
    }
    else
    {
        PrintBattleTowerTrainerMessage(gSaveBlock2.battleTower.records[gSaveBlock2.battleTower.battleTowerTrainerId - BATTLE_TOWER_RECORD_MIXING_TRAINER_BASE_ID].greeting.easyChat);
    }
}

void sub_81354CC(void)
{
    s32 i;
    u16 heldItem;

    switch (gSpecialVar_0x8004)
    {
    case 0:
        break;
    case 1:
        for (i = 0; i < PARTY_SIZE; i++)
        {
            heldItem = GetMonData(&gSaveBlock1.playerParty[i], MON_DATA_HELD_ITEM);
            SetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM, &heldItem);
        }
        break;
    case 2:
        PrintEReaderTrainerFarewellMessage();
        break;
    }

    SetMainCallback2(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

void sub_8135534(u8 taskId)
{
    if (IsBattleTransitionDone() == TRUE)
    {
        gMain.savedCallback = sub_81354CC;
        SetMainCallback2(sub_800E7C4);
        DestroyTask(taskId);
    }
}

void sub_813556C(void)
{
    s32 i;
    u16 heldItem;
    u8 transition;

    switch (gSpecialVar_0x8004)
    {
    case 0:
        gBattleTypeFlags = (BATTLE_TYPE_BATTLE_TOWER | BATTLE_TYPE_TRAINER);
        gTrainerBattleOpponent = 0;

        FillBattleTowerTrainerParty();

        CreateTask(sub_8135534, 1);
        current_map_music_set__default_for_battle(0);
        transition = BattleSetup_GetBattleTowerBattleTransition();
        BattleTransition_StartOnField(transition);
        break;
    case 1:
        for (i = 0; i < PARTY_SIZE; i++)
        {
            heldItem = GetMonData(&gPlayerParty[i], MON_DATA_HELD_ITEM);
            SetMonData(&gSaveBlock1.playerParty[i], MON_DATA_HELD_ITEM, &heldItem);
        }

        CreateTask(sub_8135534, 1);
        current_map_music_set__default_for_battle(0);
        transition = BattleSetup_GetBattleTowerBattleTransition();
        BattleTransition_StartOnField(transition);
        break;
    case 2:
        ZeroEnemyPartyMons();

        for (i = 0; i < 3; i++)
        {
            sub_803ADE8(&gEnemyParty[i], &gSaveBlock2.battleTower.ereaderTrainer.party[i]);
        }

        gBattleTypeFlags = (BATTLE_TYPE_EREADER_TRAINER | BATTLE_TYPE_TRAINER);
        gTrainerBattleOpponent = 0;

        CreateTask(sub_8135534, 1);
        current_map_music_set__default_for_battle(0);
        transition = BattleSetup_GetBattleTowerBattleTransition();
        BattleTransition_StartOnField(transition);
        break;
    }
}

void sub_8135668(void)
{
    s32 i;
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    switch (gSpecialVar_0x8004)
    {
    case 0:
        ewram160FB = gSaveBlock2.battleTower.var_4AE[battleTowerLevelType];
        gSaveBlock2.battleTower.var_4AE[battleTowerLevelType] = gSpecialVar_0x8005;
        break;
    case 1:
        gSaveBlock2.battleTower.battleTowerLevelType = gSpecialVar_0x8005;
        break;
    case 2:
        gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType] = gSpecialVar_0x8005;
        break;
    case 3:
        gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType] = gSpecialVar_0x8005;
        break;
    case 4:
        gSaveBlock2.battleTower.battleTowerTrainerId = gSpecialVar_0x8005;
        break;
    case 5:
        for (i = 0; i < 3; i++)
        {
            gSaveBlock2.battleTower.selectedPartyMons[i] = gSelectedOrderFromParty[i];
        }
        break;
    case 6:
        if (gSaveBlock2.battleTower.battleTowerTrainerId == BATTLE_TOWER_EREADER_TRAINER_ID)
        {
            ClearEReaderTrainer(&gSaveBlock2.battleTower.ereaderTrainer);
        }

        if (gSaveBlock2.battleTower.totalBattleTowerWins < 9999)
        {
            gSaveBlock2.battleTower.totalBattleTowerWins++;
        }

        gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType]++;
        sub_8135A3C();
        gScriptResult = gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType];

        gStringVar1[0] = gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType] + 0xA1;
        gStringVar1[1] = 0xFF;
        break;
    case 7:
        if (gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType] < 1430)
        {
            gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType]++;
        }

        sub_8135A3C();
        gScriptResult = gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType];
        break;
    case 8:
        gSaveBlock2.battleTower.unk_554 = gSpecialVar_0x8005;
        break;
    case 9:
        break;
    case 10:
        SetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK, gSaveBlock2.battleTower.bestBattleTowerWinStreak);
        break;
    case 11:
        if (gSaveBlock2.battleTower.var_4AE[battleTowerLevelType] != 3)
        {
            ResetBattleTowerStreak(battleTowerLevelType);
        }
        break;
    case 12:
        gSaveBlock2.battleTower.var_4AE[battleTowerLevelType] = ewram160FB;
        break;
    case 13:
        gSaveBlock2.battleTower.currentWinStreaks[battleTowerLevelType] = GetCurrentBattleTowerWinStreak(battleTowerLevelType);
        break;
    case 14:
        gSaveBlock2.battleTower.lastStreakLevelType = gSaveBlock2.battleTower.battleTowerLevelType;
        break;
    }
}

void sub_81358A4(void)
{
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    switch (gSpecialVar_0x8004)
    {
    case 0:
        gScriptResult = gSaveBlock2.battleTower.var_4AE[battleTowerLevelType];
        break;
    case 1:
        gScriptResult = gSaveBlock2.battleTower.battleTowerLevelType;
        break;
    case 2:
        gScriptResult = gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType];
        break;
    case 3:
        gScriptResult = gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType];
        break;
    case 4:
        gScriptResult = gSaveBlock2.battleTower.battleTowerTrainerId;
        break;
    case 5:
    case 6:
    case 7:
        break;
    case 8:
        gScriptResult = gSaveBlock2.battleTower.unk_554;
        break;
    case 9:
        gScriptResult = GetCurrentBattleTowerWinStreak(battleTowerLevelType);
        break;
    case 10:
        SetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK, gSaveBlock2.battleTower.bestBattleTowerWinStreak);
        break;
    case 11:
        ResetBattleTowerStreak(battleTowerLevelType);
        break;
    case 12:
        gSaveBlock2.battleTower.var_4AE[battleTowerLevelType] = ewram160FB;
        break;
    case 13:
        gSaveBlock2.battleTower.currentWinStreaks[battleTowerLevelType] = GetCurrentBattleTowerWinStreak(battleTowerLevelType);
        break;
    case 14:
        gSaveBlock2.battleTower.lastStreakLevelType = gSaveBlock2.battleTower.battleTowerLevelType;
        break;
    }
}

void sub_8135A14(void)
{
    s32 i;

    for (i = 0; i < 3; i++)
    {
        gSelectedOrderFromParty[i] = gSaveBlock2.battleTower.selectedPartyMons[i];
    }

    ReducePlayerPartyToThree();
}

#ifdef NONMATCHING
void sub_8135A3C(void)
{
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;
    u16 winStreak = GetCurrentBattleTowerWinStreak(battleTowerLevelType);

    if (gSaveBlock2.battleTower.recordWinStreaks[battleTowerLevelType] < winStreak)
    {
        gSaveBlock2.battleTower.recordWinStreaks[battleTowerLevelType] = winStreak;
    }

    if (gSaveBlock2.battleTower.recordWinStreaks[0] > gSaveBlock2.battleTower.recordWinStreaks[1])
    {
        u16 streak = gSaveBlock2.battleTower.recordWinStreaks[0];
        SetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK, streak);
        if (streak > 9999)
        {
            gSaveBlock2.battleTower.bestBattleTowerWinStreak = 9999;
        }
        else
        {
            gSaveBlock2.battleTower.bestBattleTowerWinStreak = streak;
        }
    }
    else
    {
        u16 streak = gSaveBlock2.battleTower.recordWinStreaks[1];
        SetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK, streak);
        if (streak > 9999)
        {
            gSaveBlock2.battleTower.bestBattleTowerWinStreak = 9999;
        }
        else
        {
            gSaveBlock2.battleTower.bestBattleTowerWinStreak = streak;
        }
    }
}
#else
__attribute__((naked))
void sub_8135A3C(void)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    ldr r6, _08135A84 @ =gSaveBlock2\n\
    ldr r1, _08135A88 @ =0x00000554\n\
    adds r0, r6, r1\n\
    ldrb r4, [r0]\n\
    lsls r4, 31\n\
    lsrs r4, 31\n\
    adds r0, r4, 0\n\
    bl GetCurrentBattleTowerWinStreak\n\
    lsls r0, 16\n\
    lsrs r5, r0, 16\n\
    lsls r4, 1\n\
    movs r3, 0xAC\n\
    lsls r3, 3\n\
    adds r2, r6, r3\n\
    adds r4, r2\n\
    ldrh r0, [r4]\n\
    cmp r0, r5\n\
    bcs _08135A66\n\
    strh r5, [r4]\n\
_08135A66:\n\
    ldr r0, _08135A8C @ =0x00000562\n\
    adds r1, r6, r0\n\
    ldrh r0, [r2]\n\
    ldrh r3, [r1]\n\
    cmp r0, r3\n\
    bls _08135A94\n\
    adds r5, r0, 0\n\
    movs r0, 0x20\n\
    adds r1, r5, 0\n\
    bl SetGameStat\n\
    ldr r1, _08135A90 @ =0x0000270f\n\
    cmp r5, r1\n\
    bhi _08135AA4\n\
    b _08135AB4\n\
    .align 2, 0\n\
_08135A84: .4byte gSaveBlock2\n\
_08135A88: .4byte 0x00000554\n\
_08135A8C: .4byte 0x00000562\n\
_08135A90: .4byte 0x0000270f\n\
_08135A94:\n\
    ldrh r5, [r1]\n\
    movs r0, 0x20\n\
    adds r1, r5, 0\n\
    bl SetGameStat\n\
    ldr r1, _08135AAC @ =0x0000270f\n\
    cmp r5, r1\n\
    bls _08135AB4\n\
_08135AA4:\n\
    ldr r2, _08135AB0 @ =0x00000572\n\
    adds r0, r6, r2\n\
    strh r1, [r0]\n\
    b _08135ABA\n\
    .align 2, 0\n\
_08135AAC: .4byte 0x0000270f\n\
_08135AB0: .4byte 0x00000572\n\
_08135AB4:\n\
    ldr r3, _08135AC0 @ =0x00000572\n\
    adds r0, r6, r3\n\
    strh r5, [r0]\n\
_08135ABA:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08135AC0: .4byte 0x00000572\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void sub_8135AC4(void)
{
    s32 i;
    u8 trainerClass;
    struct BattleTowerRecord *playerRecord = &gSaveBlock2.battleTower.playerRecord;
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    if (gSaveBlock2.playerGender != MALE)
    {
        trainerClass = sFemaleTrainerClasses[(gSaveBlock2.playerTrainerId[0] + gSaveBlock2.playerTrainerId[1]
                                    + gSaveBlock2.playerTrainerId[2] + gSaveBlock2.playerTrainerId[3]) % 20u];
    }
    else
    {
        trainerClass = sMaleTrainerClasses[(gSaveBlock2.playerTrainerId[0] + gSaveBlock2.playerTrainerId[1]
                                    + gSaveBlock2.playerTrainerId[2] + gSaveBlock2.playerTrainerId[3]) % 30u];
    }

    playerRecord->battleTowerLevelType = battleTowerLevelType;
    playerRecord->trainerClass = trainerClass;

    copy_word_to_mem(playerRecord->trainerId, gSaveBlock2.playerTrainerId);
    StringCopy8(playerRecord->name, gSaveBlock2.playerName);

    playerRecord->winStreak = GetCurrentBattleTowerWinStreak(battleTowerLevelType);

    for (i = 0; i < 6; i++)
    {
        playerRecord->greeting.easyChat[i] = gSaveBlock1.easyChats.unk2B28[i];
    }

    for (i = 0; i < 3; i++)
    {
        sub_803AF78(&gUnknown_030042FC[gSaveBlock2.battleTower.selectedPartyMons[i]], &playerRecord->party[i]);
    }

    SetBattleTowerRecordChecksum(&gSaveBlock2.battleTower.playerRecord);
    sub_8135A3C();
}

void sub_8135BA0(void)
{
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    if (gSpecialVar_0x8004 == 3 || gSpecialVar_0x8004 == 0)
    {
        if (gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType] > 1
            || gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType] > 1)
        {
            sub_8135AC4();
        }
    }

    sub_8135CFC();

    gSaveBlock2.battleTower.battleOutcome = gBattleOutcome;

    if (gSpecialVar_0x8004 != 3)
    {
        gSaveBlock2.battleTower.var_4AE[battleTowerLevelType] = gSpecialVar_0x8004;
    }

    VarSet(VAR_0x4000, 0);
    gSaveBlock2.battleTower.unk_554 = 1;
    TrySavingData(EREADER_SAVE);
}

void BattleTower_SoftReset(void)
{
    DoSoftReset();
}

void ValidateBattleTowerRecordChecksums(void)
{
    u32 i;
    s32 recordIndex;
    struct BattleTowerRecord *record;
    u32 checksum;

    checksum = 0;
    for (i = 0; i < (sizeof(struct BattleTowerRecord) / sizeof(u32)) - 1; i++)
    {
        checksum += ((u32 *)&gSaveBlock2.battleTower.playerRecord)[i];
    }

    if (gSaveBlock2.battleTower.playerRecord.checksum != checksum)
    {
        ClearBattleTowerRecord(&gSaveBlock2.battleTower.playerRecord);
    }

    for (recordIndex = 0; recordIndex < 5; recordIndex++)
    {
        record = &gSaveBlock2.battleTower.records[recordIndex];
        checksum = 0;
        for (i = 0; i < (sizeof(struct BattleTowerRecord) / sizeof(u32)) - 1; i++)
        {
            checksum += ((u32 *)record)[i];
        }

        if (gSaveBlock2.battleTower.records[recordIndex].checksum != checksum)
        {
            ClearBattleTowerRecord(&gSaveBlock2.battleTower.records[recordIndex]);
        }
    }
}

void SetBattleTowerRecordChecksum(struct BattleTowerRecord *record)
{
    u32 i;

    record->checksum = 0;
    for (i = 0; i < (sizeof(struct BattleTowerRecord) / sizeof(u32)) - 1; i++)
    {
        record->checksum += ((u32 *)record)[i];
    }
}

void ClearBattleTowerRecord(struct BattleTowerRecord *record)
{
    u32 i;

    for (i = 0; i < sizeof(struct BattleTowerRecord) / sizeof(u32); i++)
    {
        ((u32 *)record)[i] = 0;
    }
}

void sub_8135CFC(void)
{
    s32 i;

    get_trainer_name(gSaveBlock2.battleTower.defeatedByTrainerName);
    gSaveBlock2.battleTower.defeatedBySpecies = gBattleMons[1].species;
    gSaveBlock2.battleTower.firstMonSpecies = gBattleMons[0].species;

    for (i = 0; i < POKEMON_NAME_LENGTH; i++)
    {
        gSaveBlock2.battleTower.firstMonNickname[i] = gBattleMons[0].nickname[i];
    }
}

u16 GetCurrentBattleTowerWinStreak(u8 battleTowerLevelType)
{
    u16 winStreak = ((gSaveBlock2.battleTower.curStreakChallengesNum[battleTowerLevelType] - 1) * 7 - 1)
                    + gSaveBlock2.battleTower.curChallengeBattleNum[battleTowerLevelType];

    if (winStreak > 9999)
    {
        return 9999;
    }

    return winStreak;
}

#ifdef NONMATCHING
void DetermineBattleTowerPrize(void)
{
    u16 prizeItem;
    struct SaveBlock2 *saveBlock = &gSaveBlock2;
    u8 battleTowerLevelType = saveBlock->battleTower.battleTowerLevelType;

    if (saveBlock->battleTower.curStreakChallengesNum[battleTowerLevelType] - 1 > 5)
    {
        prizeItem = sLongStreakPrizes[Random() % ARRAY_COUNT(sLongStreakPrizes)];
    }
    else
    {
        prizeItem = sShortStreakPrizes[Random() % ARRAY_COUNT(sShortStreakPrizes)];
    }

    saveBlock->battleTower.prizeItem = prizeItem;
}
#else
__attribute__((naked))
void DetermineBattleTowerPrize(void)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    ldr r5, _08135DB0 @ =gSaveBlock2\n\
    ldr r1, _08135DB4 @ =0x00000554\n\
    adds r0, r5, r1\n\
    ldrb r0, [r0]\n\
    lsls r0, 31\n\
    lsrs r0, 31\n\
    lsls r0, 1\n\
    ldr r2, _08135DB8 @ =0x0000055c\n\
    adds r1, r5, r2\n\
    adds r0, r1\n\
    ldrh r0, [r0]\n\
    subs r0, 0x1\n\
    cmp r0, 0x5\n\
    ble _08135DC0\n\
    bl Random\n\
    ldr r4, _08135DBC @ =sLongStreakPrizes\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0x9\n\
    b _08135DCC\n\
    .align 2, 0\n\
_08135DB0: .4byte gSaveBlock2\n\
_08135DB4: .4byte 0x00000554\n\
_08135DB8: .4byte 0x0000055c\n\
_08135DBC: .4byte sLongStreakPrizes\n\
_08135DC0:\n\
    bl Random\n\
    ldr r4, _08135DE8 @ =sShortStreakPrizes\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    movs r1, 0x6\n\
_08135DCC:\n\
    bl __umodsi3\n\
    lsls r0, 16\n\
    lsrs r0, 15\n\
    adds r0, r4\n\
    ldrh r1, [r0]\n\
    movs r2, 0xAD\n\
    lsls r2, 3\n\
    adds r0, r5, r2\n\
    strh r1, [r0]\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08135DE8: .4byte sShortStreakPrizes\n\
    .syntax divided\n");
}
#endif // NONMATCHING

void GiveBattleTowerPrize(void)
{
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    if (AddBagItem(gSaveBlock2.battleTower.prizeItem, 1) == TRUE)
    {
        CopyItemName(gSaveBlock2.battleTower.prizeItem, gStringVar1);
        gScriptResult = 1;
    }
    else
    {
        gScriptResult = 0;
        gSaveBlock2.battleTower.var_4AE[battleTowerLevelType] = 6;
    }
}

void AwardBattleTowerRibbons(void)
{
    s32 i;
    u32 partyIndex;
    struct Pokemon *pokemon;
    u8 ribbonType;
    u8 battleTowerLevelType = gSaveBlock2.battleTower.battleTowerLevelType;

    ribbonType = MON_DATA_WINNING_RIBBON;
    if (battleTowerLevelType != 0)
    {
        ribbonType = MON_DATA_VICTORY_RIBBON;
    }

    gScriptResult = 0;

    if (GetCurrentBattleTowerWinStreak(battleTowerLevelType) > 55)
    {
        for (i = 0; i < 3; i++)
        {
            partyIndex = gSaveBlock2.battleTower.selectedPartyMons[i] - 1;
            pokemon = &gPlayerParty[partyIndex];
            if (!GetMonData(pokemon, ribbonType))
            {
                gScriptResult = 1;
                SetMonData(pokemon, ribbonType, &gScriptResult);
            }
        }
    }

    if (gScriptResult != 0)
    {
        IncrementGameStat(GAME_STAT_RECEIVED_RIBBONS);
    }
}

// This is a leftover debugging function that is used to populate the E-Reader
// trainer with the player's current data.
void Debug_FillEReaderTrainerWithPlayerData(void)
{
    struct BattleTowerEReaderTrainer *ereaderTrainer;
    s32 i;
    s32 j;

    ereaderTrainer = &gSaveBlock2.battleTower.ereaderTrainer;

    if (gSaveBlock2.playerGender != MALE)
    {
        ereaderTrainer->trainerClass = sFemaleTrainerClasses[(gSaveBlock2.playerTrainerId[0] + gSaveBlock2.playerTrainerId[1]
                                                        + gSaveBlock2.playerTrainerId[2] + gSaveBlock2.playerTrainerId[3]) % 20u];
    }
    else
    {
        ereaderTrainer->trainerClass = sMaleTrainerClasses[(gSaveBlock2.playerTrainerId[0] + gSaveBlock2.playerTrainerId[1]
                                                        + gSaveBlock2.playerTrainerId[2] + gSaveBlock2.playerTrainerId[3]) % 30u];
    }

    copy_word_to_mem(ereaderTrainer->trainerId, gSaveBlock2.playerTrainerId);
    StringCopy8(ereaderTrainer->name, gSaveBlock2.playerName);

    ereaderTrainer->winStreak = 1;

    j = 7;
    for (i = 0; i < 6; i++)
    {
        ereaderTrainer->greeting.easyChat[i] = gSaveBlock1.easyChats.unk2B28[i];
        ereaderTrainer->farewellPlayerLost.easyChat[i] = j;
        ereaderTrainer->farewellPlayerWon.easyChat[i] = j + 6;
        j++;
    }

    for (i = 0; i < 3; i++)
    {
        sub_803AF78(&gPlayerParty[i], &ereaderTrainer->party[i]);
    }

    SetEReaderTrainerChecksum(ereaderTrainer);
}

u8 GetEReaderTrainerPicIndex(void)
{
    return gTrainerClassToPicIndex[gSaveBlock2.battleTower.ereaderTrainer.trainerClass];
}

u8 GetEReaderTrainerClassNameIndex(void)
{
    return gTrainerClassToNameIndex[gSaveBlock2.battleTower.ereaderTrainer.trainerClass];
}

void SetEReaderTrainerName(u8 *trainerName)
{
    s32 i;

    for (i = 0; i < 7; i++)
    {
        trainerName[i] = gSaveBlock2.battleTower.ereaderTrainer.name[i];
    }

    trainerName[i] = 0xFF;
}

// Checks if the saved E-Reader trainer is valid.
void ValidateEReaderTrainer(void)
{
    u32 i;
    u32 checksum;
    struct BattleTowerEReaderTrainer *ereaderTrainer;

    gScriptResult = 0;
    ereaderTrainer = &gSaveBlock2.battleTower.ereaderTrainer;

    checksum = 0;
    for (i = 0; i < sizeof(struct BattleTowerEReaderTrainer) / sizeof(u32) - 1; i++)
    {
        checksum |= ((u32 *)ereaderTrainer)[i];
    }

    if (checksum == 0)
    {
        gScriptResult = 1;
        return;
    }

    checksum = 0;
    for (i = 0; i < sizeof(struct BattleTowerEReaderTrainer) / sizeof(u32) - 1; i++)
    {
        checksum += ((u32 *)ereaderTrainer)[i];
    }

    if (gSaveBlock2.battleTower.ereaderTrainer.checksum != checksum)
    {
        ClearEReaderTrainer(&gSaveBlock2.battleTower.ereaderTrainer);
        gScriptResult = 1;
    }
}

void SetEReaderTrainerChecksum(struct BattleTowerEReaderTrainer *ereaderTrainer)
{
    s32 i;

    ereaderTrainer->checksum = 0;
    for (i = 0; i < sizeof(struct BattleTowerEReaderTrainer) / sizeof(u32) - 1; i++)
    {
        ereaderTrainer->checksum += ((u32 *)ereaderTrainer)[i];
    }
}

void ClearEReaderTrainer(struct BattleTowerEReaderTrainer *ereaderTrainer)
{
    u32 i;

    for (i = 0; i < sizeof(struct BattleTowerEReaderTrainer) / sizeof(u32); i++)
    {
        ((u32 *)ereaderTrainer)[i] = 0;
    }
}

void PrintEReaderTrainerGreeting(void)
{
    PrintBattleTowerTrainerMessage(gSaveBlock2.battleTower.ereaderTrainer.greeting.easyChat);
}

void PrintEReaderTrainerFarewellMessage(void)
{
    if (gBattleOutcome == BATTLE_DREW)
    {
        gStringVar4[0] = 0xFF;
    }
    else if (gBattleOutcome == BATTLE_WON)
    {
        PrintBattleTowerTrainerMessage(gSaveBlock2.battleTower.ereaderTrainer.farewellPlayerWon.easyChat);
    }
    else
    {
        PrintBattleTowerTrainerMessage(gSaveBlock2.battleTower.ereaderTrainer.farewellPlayerLost.easyChat);
    }
}

void sub_813610C(void)
{
    s32 i;

    for (i = 0; i < 2; i++)
    {
        if (gSaveBlock2.battleTower.var_4AE[i] == 1)
        {
            sub_80BFD20();
        }
    }
}
