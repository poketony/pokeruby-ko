#include "moves.h"

enum
{
    BATTLE_TEXT_UnknownString = 12,
    BATTLE_TEXT_GainExpPoints,
    BATTLE_TEXT_GrewLevel,
    BATTLE_TEXT_LearnedMove,
    BATTLE_TEXT_TryingToLearnMove,
    BATTLE_TEXT_CantLearnMore,
    BATTLE_TEXT_DeleteMove,
    BATTLE_TEXT_DeletedMove,
    BATTLE_TEXT_StopLearning,
    BATTLE_TEXT_DidNotLearn,
    BATTLE_TEXT_LearnedMove2,
    BATTLE_TEXT_AttackMissed,
    BATTLE_TEXT_ProtectedItself,
    BATTLE_TEXT_StatNoHigher,
    BATTLE_TEXT_AvoidedDamage,
    BATTLE_TEXT_DoesntAffect,
    BATTLE_TEXT_AttackingFainted,
    BATTLE_TEXT_DefendingFainted,
    BATTLE_TEXT_WinningPrize,
    BATTLE_TEXT_OutOfUsablePoke,
    BATTLE_TEXT_WhitedOut,
    BATTLE_TEXT_PreventEscape,
    BATTLE_TEXT_HitMulti,
    BATTLE_TEXT_FellAsleep,
    BATTLE_TEXT_MadeAsleep,
    BATTLE_TEXT_DefendingAsleep,
    BATTLE_TEXT_AttackingAsleep,
    BATTLE_TEXT_WasntAffected,
    BATTLE_TEXT_Poisoned,
    BATTLE_TEXT_Poisoned2,
    BATTLE_TEXT_PoisonHurt,
    BATTLE_TEXT_AlreadyPoisoned,
    BATTLE_TEXT_BadlyPoisoned,
    BATTLE_TEXT_EnergyDrained,
    BATTLE_TEXT_Burned,
    BATTLE_TEXT_Burned2,
    BATTLE_TEXT_BurnHurt,
    BATTLE_TEXT_Frozen,
    BATTLE_TEXT_Frozen2,
    BATTLE_TEXT_FrozenSolid,
    BATTLE_TEXT_DefendingDefrosted,
    BATTLE_TEXT_AttackingDefrosted,
    BATTLE_TEXT_Defrosted,
    BATTLE_TEXT_Paralyzed,
    BATTLE_TEXT_Paralyzed2,
    BATTLE_TEXT_Paralyzed3,
    BATTLE_TEXT_AlreadyParalyzed,
    BATTLE_TEXT_ParalysisHealed,
    BATTLE_TEXT_DreamEaten,
    BATTLE_TEXT_AttackingStatNoHigher,
    BATTLE_TEXT_DefendingStatNoHigher,
    BATTLE_TEXT_StoppedWorking,
    BATTLE_TEXT_StoppedWorking2,
    BATTLE_TEXT_Confused,
    BATTLE_TEXT_ConfusionSnapOut,
    BATTLE_TEXT_BecameConfused,
    BATTLE_TEXT_AlreadyConfused,
    BATTLE_TEXT_FellLove,
    BATTLE_TEXT_InLoveWith,
    BATTLE_TEXT_ImmobilizedBy,
    BATTLE_TEXT_BlownAway,
    BATTLE_TEXT_TypeTransform,
    BATTLE_TEXT_Flinched,
    BATTLE_TEXT_RegainedHealth,
    BATTLE_TEXT_HPFull,
    BATTLE_TEXT_RaisedSpDef,
    BATTLE_TEXT_RaisedDefense,
    BATTLE_TEXT_CoveredVeil,
    BATTLE_TEXT_SafeguardActive,
    BATTLE_TEXT_SafeguardFaded,
    BATTLE_TEXT_WentToSleep,
    BATTLE_TEXT_SpeltHealthy,
    BATTLE_TEXT_WhipWhirlwind,
    BATTLE_TEXT_TookSunlight,
    BATTLE_TEXT_LoweredHead,
    BATTLE_TEXT_IsGlowing,
    BATTLE_TEXT_FlewHigh,
    BATTLE_TEXT_DugHole,
    BATTLE_TEXT_SqueezedBind,
    BATTLE_TEXT_TrappedVortex,
    BATTLE_TEXT_Wrapped,
    BATTLE_TEXT_Clamped,
    BATTLE_TEXT_HurtBy,
    BATTLE_TEXT_FreedFrom,
    BATTLE_TEXT_KeptGoingCrash,
    BATTLE_TEXT_MistShroud,
    BATTLE_TEXT_MistProtect,
    BATTLE_TEXT_GetPumped,
    BATTLE_TEXT_HitRecoil,
    BATTLE_TEXT_ProtectedItself2,
    BATTLE_TEXT_SandBuffeted,
    BATTLE_TEXT_HailStricken,
    BATTLE_TEXT_WasSeeded,
    BATTLE_TEXT_EvadedAttack,
    BATTLE_TEXT_HealthSapped,
    BATTLE_TEXT_FastAsleep,
    BATTLE_TEXT_WokeUp,
    BATTLE_TEXT_UproarAwake,
    BATTLE_TEXT_UproarWoke,
    BATTLE_TEXT_UproarCaused,
    BATTLE_TEXT_UproarMaking,
    BATTLE_TEXT_CalmedDown,
    BATTLE_TEXT_UproarCantSleep,
    BATTLE_TEXT_Stockpiled,
    BATTLE_TEXT_StockpiledCant,
    BATTLE_TEXT_UproarCantSleep2,
    BATTLE_TEXT_UproarKeptAwake,
    BATTLE_TEXT_StayedAwake,
    BATTLE_TEXT_StoringEnergy,
    BATTLE_TEXT_UnleashedEnergy,
    BATTLE_TEXT_FatigueConfuse,
    BATTLE_TEXT_PickedUpYen,
    BATTLE_TEXT_Unaffected,
    BATTLE_TEXT_Transformed,
    BATTLE_TEXT_SubMade,
    BATTLE_TEXT_SubAlready,
    BATTLE_TEXT_SubTookDamage,
    BATTLE_TEXT_SubFaded,
    BATTLE_TEXT_MustRecharge,
    BATTLE_TEXT_RageBuilding,
    BATTLE_TEXT_MoveWasDisabled,
    BATTLE_TEXT_MoveIsDisabled,
    BATTLE_TEXT_DisabledNoMore,
    BATTLE_TEXT_EncoreGot,
    BATTLE_TEXT_EncoreEnded,
    BATTLE_TEXT_TookAim,
    BATTLE_TEXT_SketchedMove,
    BATTLE_TEXT_DestinyBondTake,
    BATTLE_TEXT_DestinyBondTaken,
    BATTLE_TEXT_ReducedBy,
    BATTLE_TEXT_StoleSomething,
    BATTLE_TEXT_CantEscapeNow,
    BATTLE_TEXT_NightmareStart,
    BATTLE_TEXT_NightmareLock,
    BATTLE_TEXT_CurseLay,
    BATTLE_TEXT_CurseAfflict,
    BATTLE_TEXT_SpikesScattered,
    BATTLE_TEXT_SpikesHurt,
    BATTLE_TEXT_IdentifiedPoke,
    BATTLE_TEXT_PerishSongFell,
    BATTLE_TEXT_BracedItself,
    BATTLE_TEXT_EnduredHit,
    BATTLE_TEXT_MagnitudeCount,
    BATTLE_TEXT_CutHPMaxATK,
    BATTLE_TEXT_CopyStatChanges,
    BATTLE_TEXT_GotFreeFrom,
    BATTLE_TEXT_LeechShed,
    BATTLE_TEXT_SpikesBlownAway,
    BATTLE_TEXT_FledBattle,
    BATTLE_TEXT_ForesawAttack,
    BATTLE_TEXT_TookAttack,
    BATTLE_TEXT_PokeAttack,
    BATTLE_TEXT_CenterAttention,
    BATTLE_TEXT_ChargingPower,
    BATTLE_TEXT_NaturePower,
    BATTLE_TEXT_StatusNormal,
    BATTLE_TEXT_NoMovesLeft,
    BATTLE_TEXT_TormentSubject,
    BATTLE_TEXT_TormentNoUse,
    BATTLE_TEXT_TightenFocus,
    BATTLE_TEXT_TauntFell,
    BATTLE_TEXT_TauntNoUse,
    BATTLE_TEXT_ReadyToHelp,
    BATTLE_TEXT_SwitchedItems,
    BATTLE_TEXT_CopiedObject,
    BATTLE_TEXT_WishMade,
    BATTLE_TEXT_WishTrue,
    BATTLE_TEXT_PlantedRoots,
    BATTLE_TEXT_AbsorbNutrients,
    BATTLE_TEXT_AnchoredItself,
    BATTLE_TEXT_DrowsyMade,
    BATTLE_TEXT_KnockedOffItem,
    BATTLE_TEXT_AbilitySwap,
    BATTLE_TEXT_SealedMove,
    BATTLE_TEXT_SealedNoUse,
    BATTLE_TEXT_GrudgeBear,
    BATTLE_TEXT_GrudgeLosePP,
    BATTLE_TEXT_ShroudedItself,
    BATTLE_TEXT_MagicCoatBounce,
    BATTLE_TEXT_AwaitMove,
    BATTLE_TEXT_SnatchedMove,
    BATTLE_TEXT_RainMade,
    BATTLE_TEXT_SpeedRisen,
    BATTLE_TEXT_ProtectedBy,
    BATTLE_TEXT_PreventedBy,
    BATTLE_TEXT_HPRestoredUsing,
    BATTLE_TEXT_MadeType,
    BATTLE_TEXT_PreventedPara,
    BATTLE_TEXT_PreventedRomance,
    BATTLE_TEXT_PreventedPoison,
    BATTLE_TEXT_PreventedConfusion,
    BATTLE_TEXT_RaisedFirePower,
    BATTLE_TEXT_AnchorsItself,
    BATTLE_TEXT_CutsAttack,
    BATTLE_TEXT_PreventedStatLoss,
    BATTLE_TEXT_HurtOther,
    BATTLE_TEXT_Traced,
    BATTLE_TEXT_Sharply,
    BATTLE_TEXT_Rose,
    BATTLE_TEXT_Harshly,
    BATTLE_TEXT_Fell,
    BATTLE_TEXT_UnknownString7,
    BATTLE_TEXT_UnknownString3,
    BATTLE_TEXT_UnknownString5,
    BATTLE_TEXT_UnknownString6,
    BATTLE_TEXT_Critical,
    BATTLE_TEXT_GrandSlam,
    BATTLE_TEXT_MoveForget123,
    BATTLE_TEXT_MoveForgetAnd,
    BATTLE_TEXT_NotEffective,
    BATTLE_TEXT_SuperEffective,
    BATTLE_TEXT_GotAwaySafely,
    BATTLE_TEXT_FledWild,
    BATTLE_TEXT_NoRunning,
    BATTLE_TEXT_CantEscape2,
    BATTLE_TEXT_BirchDontLeaveMe,
    BATTLE_TEXT_Nothing,
    BATTLE_TEXT_Failed,
    BATTLE_TEXT_HurtItself,
    BATTLE_TEXT_MirrorFail,
    BATTLE_TEXT_RainStart,
    BATTLE_TEXT_PourStart,
    BATTLE_TEXT_RainCont1,
    BATTLE_TEXT_PourCont,
    BATTLE_TEXT_RainStop,
    BATTLE_TEXT_SandBrewed,
    BATTLE_TEXT_SandRages,
    BATTLE_TEXT_SandSubsided,
    BATTLE_TEXT_SunBright,
    BATTLE_TEXT_SunStrong,
    BATTLE_TEXT_SunFaded,
    BATTLE_TEXT_HailStart,
    BATTLE_TEXT_HailCont,
    BATTLE_TEXT_HailStop,
    BATTLE_TEXT_SpitUpFail,
    BATTLE_TEXT_SwallowFail,
    BATTLE_TEXT_WindHeatWave,
    BATTLE_TEXT_StatElim,
    BATTLE_TEXT_CoinScatter,
    BATTLE_TEXT_SubWeak,
    BATTLE_TEXT_PainSplit,
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_PerishSong,
    BATTLE_TEXT_NoPP1,
    BATTLE_TEXT_NoPP2,
    BATTLE_TEXT_Used1,
    BATTLE_TEXT_TutorialUsed,
    BATTLE_TEXT_BlockBall,
    BATTLE_TEXT_DontBeAThief,
    BATTLE_TEXT_DodgeBall,
    BATTLE_TEXT_MissPoke,
    BATTLE_TEXT_BallBrokeOhNo,
    BATTLE_TEXT_BallBrokeAppeared,
    BATTLE_TEXT_BallBrokeAlmost,
    BATTLE_TEXT_BallBrokeSoClose,
    BATTLE_TEXT_BallCaught1,
    BATTLE_TEXT_BallCaught2,
    BATTLE_TEXT_GiveNickname,
    BATTLE_TEXT_SentToPC,
    BATTLE_TEXT_AddedToDex,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Sandstorm,
    BATTLE_TEXT_CantEscape,
    BATTLE_TEXT_IgnoredOrdersSLP,
    BATTLE_TEXT_IgnoredOrders,
    BATTLE_TEXT_BeganNap,
    BATTLE_TEXT_LoafingAround,
    BATTLE_TEXT_WontObey,
    BATTLE_TEXT_TurnedAway,
    BATTLE_TEXT_NotNotice,
    BATTLE_TEXT_WillSwitch,
    BATTLE_TEXT_CreptCloser,
    BATTLE_TEXT_CantGetCloser,
    BATTLE_TEXT_WatchingCarefully,
    BATTLE_TEXT_CuriousAbout,
    BATTLE_TEXT_EnthralledBy,
    BATTLE_TEXT_IgnoredThing,
    BATTLE_TEXT_ThrewBlock,
    BATTLE_TEXT_SafariOver,
    BATTLE_TEXT_CuredParalysis,
    BATTLE_TEXT_CuredPoison,
    BATTLE_TEXT_CuredBurn,
    BATTLE_TEXT_CuredFreeze,
    BATTLE_TEXT_CuredSleep,
    BATTLE_TEXT_CuredConfusion,
    BATTLE_TEXT_CuredStatus,
    BATTLE_TEXT_RestoredHealth,
    BATTLE_TEXT_RestoredPP,
    BATTLE_TEXT_RestoredStatus,
    BATTLE_TEXT_RestoredHPLittle,
    BATTLE_TEXT_ChoiceBand,
    BATTLE_TEXT_FocusSash,
    BATTLE_TEXT_Terminator2,
    BATTLE_TEXT_PreventedBurn,
    BATTLE_TEXT_BlocksOther,
    BATTLE_TEXT_RestoredHPByItem,
    BATTLE_TEXT_WhipSandstorm,
    BATTLE_TEXT_PreventedLoss,
    BATTLE_TEXT_InfatuatedPoke,
    BATTLE_TEXT_MadeIneffective,
    BATTLE_TEXT_CuredProblem,
    BATTLE_TEXT_OozeSuckup,
    BATTLE_TEXT_Transformed2,
    BATTLE_TEXT_ElecWeakened,
    BATTLE_TEXT_FireWeakened,
    BATTLE_TEXT_HidUnderwater,
    BATTLE_TEXT_SprangUp,
    BATTLE_TEXT_CantForgetHM,
    BATTLE_TEXT_FoundOne,
    BATTLE_TEXT_PlayerDefeatedTrainer2,
    BATTLE_TEXT_SoothingAroma,
    BATTLE_TEXT_CantUseItems,
    BATTLE_TEXT_UnknownString2,
    BATTLE_TEXT_UnknownString4,
    BATTLE_TEXT_HustleUse,
    BATTLE_TEXT_MadeUseless,
    BATTLE_TEXT_SandTombTrapped,
    BATTLE_TEXT_Terminator,
    BATTLE_TEXT_BoostedExp,
    BATTLE_TEXT_SunIntensified,
    BATTLE_TEXT_GroundMoveNegate,
    BATTLE_TEXT_WallyBall,
    BATTLE_TEXT_TookAttack2,
    BATTLE_TEXT_ChoseDestiny,
    BATTLE_TEXT_LostFocus,
    BATTLE_TEXT_UseNext,
    BATTLE_TEXT_FledUsingItem,
    BATTLE_TEXT_FledUsingOther,
    BATTLE_TEXT_DraggedOut,
    BATTLE_TEXT_PreventedOther,
    BATTLE_TEXT_NormalizedStatus,
    BATTLE_TEXT_Used2,
    BATTLE_TEXT_BoxFull,
    BATTLE_TEXT_AvoidedAttack,
    BATTLE_TEXT_MadeIneffective2,
    BATTLE_TEXT_PreventedFlinching,
    BATTLE_TEXT_AlreadyBurned,
    BATTLE_TEXT_StatNoLower,
    BATTLE_TEXT_BlocksOther2,
    BATTLE_TEXT_WoreOff,
    BATTLE_TEXT_RaisedDefenseLittle,
    BATTLE_TEXT_RaisedSpDefLittle,
    BATTLE_TEXT_BrokeWall,
    BATTLE_TEXT_PreventedOther2,
    BATTLE_TEXT_CuredOfProblem,
    BATTLE_TEXT_AttackingCantEscape,
    BATTLE_TEXT_Obtained1,
    BATTLE_TEXT_Obtained2,
    BATTLE_TEXT_Obtained3,
    BATTLE_TEXT_NoEffect,
    BATTLE_TEXT_NoEffectOn,
};

const u8 BattleText_UnknownString[] = _("{STRING 33}"); // {FD 21}
const u8 BattleText_GainExpPoints[] = _("{STRING 0}{STRING 1}{STRING 42} 경험치를 얻었다!\p"); // {FD 00}{FD 01} けいけんちを もらった!
const u8 BattleText_Terminator[] = _("{K_EUNNEUN}\n"); // は
const u8 BattleText_BoostedExp[] = _("{K_EUNNEUN} 많은 양의\n"); // は おおめにｎ
const u8 BattleText_GrewLevel[] = _("{STRING 0}{K_EUNNEUN}\n레벨{STRING 1}{K_EU}로 올랐다!{UNKNOWN_A}\p");
const u8 BattleText_LearnedMove[] = _("{STRING 0}{K_EUNNEUN}\n{STRING 1}{K_EULREUL} 배웠다!{UNKNOWN_A}\p");
const u8 BattleText_TryingToLearnMove[] = _("{STRING 0}{K_EUNNEUN} 새로\n{STRING 1}{K_EULREUL} 배우고 싶다...\p");
const u8 BattleText_CantLearnMore[] = _("그러나 {STRING 0}{K_EUNNEUN} 기술을 4개\n알고 있으므로 더 이상 배울 수 없다!\p");
const u8 BattleText_DeleteMove[] = _("{STRING 1} 대신\n다른 기술을 잊게 하겠습니까?");
const u8 BattleText_DeletedMove[] = _("{STRING 0}{K_EUNNEUN} {STRING 1}{K_EULREUL}\n깨끗이 잊었다!\p");
const u8 BattleText_StopLearning[] = _("{PAUSE 32}그럼... {STRING 1}{K_EULREUL}\n배우는 것을 포기하겠습니까?");
const u8 BattleText_DidNotLearn[] = _("{STRING 0}{K_EUNNEUN} {STRING 1}{K_EULREUL}\n결국 배우지 않았다!\p");
const u8 BattleText_UseNext[] = _("다음 포켓몬을 쓰겠습니까?");
const u8 BattleText_AttackMissed[] = _("그러나 {ATTACKING_MON}의\n공격은 빗나갔다!");
const u8 BattleText_ProtectedItself[] = _("{DEFENDING_MON}{K_EUNNEUN}\n공격으로부터 몸을 지켰다!");
const u8 BattleText_AvoidedDamage[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n데미지를 입지 않는다!");
const u8 BattleText_GroundMoveNegate[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n땅타입 기술에 당하지 않는다!");
const u8 BattleText_AvoidedAttack[] = _("{DEFENDING_MON}에게는\n맞지 않았다!");
const u8 BattleText_DoesntAffect[] = _("{DEFENDING_MON}에게는\n효과가 없는 것 같다...");
const u8 BattleText_AttackingFainted[] = _("{ATTACKING_MON}{K_EUNNEUN} 쓰러졌다!\p");
const u8 BattleText_DefendingFainted[] = _("{DEFENDING_MON}{K_EUNNEUN} 쓰러졌다!\p");
const u8 BattleText_WinningPrize[] = _("{STRING 32}{K_EUNNEUN} 상금으로\n{STRING 0}원을 손에 넣었다!\p");
const u8 BattleText_OutOfUsablePoke[] = _("{STRING 32}에게는\n싸울 수 있는 포켓몬이 없다!\p");
const u8 BattleText_WhitedOut[] = _("{STRING 32}{K_EUNNEUN}\n눈앞이 캄캄해졌다!{PAUSE_UNTIL_PRESS}");
const u8 BattleText_PreventEscape[] = _("{STRING 16}의\n{STRING 23} 때문에 도망칠 수 없다!\p");
const u8 BattleText_CantEscape[] = _("도망칠 수 없다!\p");
const u8 BattleText_AttackingCantEscape[] = _("{ATTACKING_MON}{K_EUNNEUN}\n도망칠 수 없다!");
const u8 BattleText_HitMulti[] = _("{STRING 0}번 맞았다!");
const u8 BattleText_FellAsleep[] = _("{STRING 14}{K_EUNNEUN}\n잠들어 버렸다!");
const u8 BattleText_MadeAsleep[] = _("{STRING 16}의 {STRING 23} 때문에\n{STRING 14}{K_EUNNEUN} 잠들어 버렸다!");
const u8 BattleText_DefendingAsleep[] = _("{DEFENDING_MON}{K_EUNNEUN}\n이미 잠들어 있다");
const u8 BattleText_AttackingAsleep[] = _("{ATTACKING_MON}{K_EUNNEUN}\n이미 잠들어 있다");
const u8 BattleText_WasntAffected[] = _("{DEFENDING_MON}에게는\n전혀 효과가 없다!");
const u8 BattleText_Poisoned[] = _("{STRING 14}의\n몸에 독이 퍼졌다!");
const u8 BattleText_Poisoned2[] = _("{STRING 16}의 {STRING 23} 때문에\n{STRING 14}의 몸에 독이 퍼졌다!");
const u8 BattleText_PoisonHurt[] = _("{ATTACKING_MON}{K_EUNNEUN}\n독에 의한 데미지를 입고 있다!");
const u8 BattleText_AlreadyPoisoned[] = _("{DEFENDING_MON}{K_EUNNEUN} 이미\n몸에 독이 퍼진 상태다");
const u8 BattleText_BadlyPoisoned[] = _("{STRING 14}의\n몸에 맹독이 퍼졌다!");
const u8 BattleText_EnergyDrained[] = _("{DEFENDING_MON}{K_EU}로부터\n체력을 흡수했다!");
const u8 BattleText_Burned[] = _("{STRING 14}{K_EUNNEUN}\n화상을 입었다!");
const u8 BattleText_Burned2[] = _("{STRING 16}의 {STRING 23} 때문에\n{STRING 14}{K_EUNNEUN} 화상을 입었다!");
const u8 BattleText_BurnHurt[] = _("{ATTACKING_MON}{K_EUNNEUN}\n화상 데미지를 입고 있다!");
const u8 BattleText_AlreadyBurned[] = _("{DEFENDING_MON}{K_EUNNEUN} 이미\n화상을 입은 상태다");
const u8 BattleText_Frozen[] = _("{STRING 14}{K_EUNNEUN}\n얼어붙었다!");
const u8 BattleText_Frozen2[] = _("{STRING 16}의 {STRING 23} 때문에\n{STRING 14}{K_EUNNEUN} 얼어붙었다!");
const u8 BattleText_FrozenSolid[] = _("{ATTACKING_MON}{K_EUNNEUN}\n얼어버려서 움직이지 않는다!");
const u8 BattleText_DefendingDefrosted[] = _("{DEFENDING_MON}의\n얼음이 녹았다!");
const u8 BattleText_AttackingDefrosted[] = _("{ATTACKING_MON}의\n얼음이 녹았다!");
const u8 BattleText_Defrosted[] = _("{ATTACKING_MON}의\n{STRING 17} 때문에 얼음이 녹았다!");
const u8 BattleText_Paralyzed[] = _("{STRING 14}{K_EUNNEUN} 마비되어\n기술이 나오기 어려워졌다!");
const u8 BattleText_Paralyzed2[] = _("{STRING 16}의 {STRING 23} 때문에\n{STRING 14}{K_EUNNEUN} 마비되어\l기술이 나오기 어려워졌다!");
const u8 BattleText_Paralyzed3[] = _("{ATTACKING_MON}{K_EUNNEUN}\n몸이 저려서 움직일 수 없다");
const u8 BattleText_AlreadyParalyzed[] = _("{DEFENDING_MON}{K_EUNNEUN}\n이미 마비되어 있다");
const u8 BattleText_ParalysisHealed[] = _("{DEFENDING_MON}의\n마비가 풀렸다!");
const u8 BattleText_DreamEaten[] = _("{DEFENDING_MON}의\n꿈을 먹었다!");
const u8 BattleText_AttackingStatNoHigher[] = _("{ATTACKING_MON}의\n{STRING 0}{K_EUNNEUN} 더 올라가지 않는다!");
const u8 BattleText_DefendingStatNoHigher[] = _("{DEFENDING_MON}의\n{STRING 0}{K_EUNNEUN} 더 떨어지지 않는다!");
const u8 BattleText_StoppedWorking[] = _("우리 편 {STRING 0}의\n효과가 떨어졌다!");
const u8 BattleText_StoppedWorking2[] = _("상대 {STRING 0}의\n효과가 떨어졌다!");
const u8 BattleText_Confused[] = _("{ATTACKING_MON}{K_EUNNEUN}\n혼란에 빠져 있다!");
const u8 BattleText_ConfusionSnapOut[] = _("{ATTACKING_MON}의\n혼란이 풀렸다!");
const u8 BattleText_BecameConfused[] = _("{STRING 14}{K_EUNNEUN}\n혼란에 빠졌다!");
const u8 BattleText_AlreadyConfused[] = _("{DEFENDING_MON}{K_EUNNEUN} 이미\n혼란에 빠져 있다");
const u8 BattleText_FellLove[] = _("{DEFENDING_MON}{K_EUNNEUN}\n헤롱헤롱해졌다!");
const u8 BattleText_InLoveWith[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 16}에게 헤롱헤롱해 있다!");
const u8 BattleText_ImmobilizedBy[] = _("{ATTACKING_MON}{K_EUNNEUN} 헤롱헤롱해서\n기술을 쓸 수 없었다!");
const u8 BattleText_BlownAway[] = _("{DEFENDING_MON}{K_EUNNEUN}\n날려가 버렸다!");
const u8 BattleText_TypeTransform[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}타입이 됐다!");
const u8 BattleText_Flinched[] = _("{ATTACKING_MON}{K_EUNNEUN}\n풀이 죽어 움직일 수 없었다!");
const u8 BattleText_RegainedHealth[] = _("{DEFENDING_MON}{K_EUNNEUN}체력을\n회복했다!");
const u8 BattleText_HPFull[] = _("그러나 {DEFENDING_MON}의\n체력은 가득찬 상태다!");
const u8 BattleText_RaisedSpDef[] = _("{STRING 38}의 {STRING 17} 때문에\n특수방어가 올랐다!");
const u8 BattleText_RaisedSpDefLittle[] = _("{STRING 38}의 {STRING 17} 때문에\n특수방어가 조금 올랐다!");
const u8 BattleText_RaisedDefense[] = _("{STRING 38}의 {STRING 17} 때문에\n방어가 올랐다!");
const u8 BattleText_RaisedDefenseLittle[] = _("{STRING 38}의 {STRING 17} 때문에\n방어가 조금 올랐다!");
const u8 BattleText_CoveredVeil[] = _("{STRING 38}{K_EUNNEUN}\n신비의 베일에 둘러싸였다!");
const u8 BattleText_SafeguardActive[] = _("{DEFENDING_MON}{K_EUNNEUN}\n신비의 베일이 지켜주고 있다!");
const u8 BattleText_SafeguardFaded[] = _("{STRING 40}{K_EULREUL} 감싸던\n신비의 베일이 없어졌다!");
const u8 BattleText_WentToSleep[] = _("{ATTACKING_MON}{K_EUNNEUN}\n잠을 자기 시작했다!");
const u8 BattleText_SpeltHealthy[] = _("{ATTACKING_MON}{K_EUNNEUN}\n건강한 상태로 잠을 자기 시작했다!");
const u8 BattleText_WhipWhirlwind[] = _("{ATTACKING_MON}의 주위에서\n공기가 소용돌이친다!");
const u8 BattleText_TookSunlight[] = _("{ATTACKING_MON}{K_EUNNEUN}\n빛을 흡수했다!");
const u8 BattleText_LoweredHead[] = _("{ATTACKING_MON}{K_EUNNEUN}\n목을 움츠렸다!");
const u8 BattleText_IsGlowing[] = _("{ATTACKING_MON}{K_EULREUL}\n세찬 빛이 감쌌다!");
const u8 BattleText_FlewHigh[] = _("{ATTACKING_MON}{K_EUNNEUN}\n하늘 높이 날아올랐다!");
const u8 BattleText_DugHole[] = _("{ATTACKING_MON}{K_EUNNEUN}\n구멍을 파서 땅속에 파고들었다!");
const u8 BattleText_HidUnderwater[] = _("{ATTACKING_MON}{K_EUNNEUN}\n물속에 몸을 숨겼다!");
const u8 BattleText_SprangUp[] = _("{ATTACKING_MON}{K_EUNNEUN}\n뛰어올랐다!");
const u8 BattleText_SqueezedBind[] = _("{DEFENDING_MON}{K_EUNNEUN}\n{ATTACKING_MON}에게 조이기를 당했다!");
const u8 BattleText_TrappedVortex[] = _("{DEFENDING_MON}{K_EUNNEUN}\n소용돌이 속에 갇혔다!");
const u8 BattleText_SandTombTrapped[] = _("{DEFENDING_MON}{K_EUNNEUN}\n모래지옥에 붙잡혔다!");
const u8 BattleText_Wrapped[] = _("{DEFENDING_MON}{K_EUNNEUN} {ATTACKING_MON}에게\n휘감겼다!");
const u8 BattleText_Clamped[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n껍질에 꼈다!");
const u8 BattleText_HurtBy[] = _("{ATTACKING_MON}{K_EUNNEUN} {STRING 0}의\n데미지를 입고 있다");
const u8 BattleText_FreedFrom[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}{K_EU}로부터 풀려났다!");
const u8 BattleText_KeptGoingCrash[] = _("의욕이 넘쳐서\n{ATTACKING_MON}{K_EUNNEUN} 땅에 부딪혔다!");
const u8 BattleText_MistShroud[] = _("{STRING 38}{K_EUNNEUN}\n흰안개에 둘러싸였다!");
const u8 BattleText_MistProtect[] = _("{STRING 16}{K_EULREUL}\n흰안개가 지켜주고 있다");
const u8 BattleText_GetPumped[] = _("{ATTACKING_MON}{K_EUNNEUN}\n의욕이 넘치고 있다!");
const u8 BattleText_HitRecoil[] = _("{ATTACKING_MON}{K_EUNNEUN}\n공격의 반동을 입었다!");
const u8 BattleText_ProtectedItself2[] = _("{ATTACKING_MON}{K_EUNNEUN}\n방어 태세에 들어갔다!");
const u8 BattleText_SandBuffeted[] = _("모래바람이\n{ATTACKING_MON}{K_EULREUL} 덮쳤다!");
const u8 BattleText_HailStricken[] = _("싸라기눈이\n{ATTACKING_MON}{K_EULREUL} 덮쳤다!");
const u8 BattleText_WoreOff[] = _("{STRING 36} {STRING 0}의\n효과가 떨어졌다!");
const u8 BattleText_WasSeeded[] = _("{DEFENDING_MON}에게\n씨앗을 심었다!");
const u8 BattleText_EvadedAttack[] = _("{DEFENDING_MON}{K_EUNNEUN}\n공격을 피했다!");
const u8 BattleText_HealthSapped[] = _("씨뿌리기가 {ATTACKING_MON}의\n체력을 빼앗는다!");
const u8 BattleText_FastAsleep[] = _("{ATTACKING_MON}{K_EUNNEUN}\n쿨쿨 잠들어 있다");
const u8 BattleText_WokeUp[] = _("{ATTACKING_MON}{K_EUNNEUN}\n눈을 떴다!");
const u8 BattleText_UproarAwake[] = _("그러나 {STRING 16}{K_EUNNEUN}\n소란스러워서 잠들 수 없다!");
const u8 BattleText_UproarWoke[] = _("{ATTACKING_MON}{K_EUNNEUN}\n소란스러워서 눈을 떴다!");
const u8 BattleText_UproarCaused[] = _("{ATTACKING_MON}{K_EUNNEUN}\n소란피기 시작했다!");
const u8 BattleText_UproarMaking[] = _("{ATTACKING_MON}{K_EUNNEUN}\n소란피우고 있다!");
const u8 BattleText_CalmedDown[] = _("{ATTACKING_MON}{K_EUNNEUN}\n얌전해졌다");
const u8 BattleText_UproarCantSleep[] = _("그러나 {DEFENDING_MON}{K_EUNNEUN}\n소란스러워서 잠들 수 없다!");
const u8 BattleText_Stockpiled[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}개 비축했다!");
const u8 BattleText_StockpiledCant[] = _("{ATTACKING_MON}{K_EUNNEUN}\n더 이상 비축할 수 었다!");
const u8 BattleText_UproarCantSleep2[] = _("그러나 {DEFENDING_MON}{K_EUNNEUN}\n소란피고 있어서 잠들지 않는다!");
const u8 BattleText_UproarKeptAwake[] = _("그러나 {DEFENDING_MON}{K_EUNNEUN}\n소란스러워서 잠들 수 없다!");
const u8 BattleText_StayedAwake[] = _("{DEFENDING_MON}{K_EUNNEUN}\n{STRING 22} 때문에 잠들지 않는다");
const u8 BattleText_StoringEnergy[] = _("{ATTACKING_MON}{K_EUNNEUN} 참고 있다");
const u8 BattleText_UnleashedEnergy[] = _("{ATTACKING_MON}의\n참기가 풀렸다!");
const u8 BattleText_FatigueConfuse[] = _("{ATTACKING_MON}{K_EUNNEUN}\n몹시 지쳐서 혼란에 빠졌다!");
const u8 BattleText_PickedUpYen[] = _("{STRING 32}{K_EUNNEUN}\n{STRING 0}원을 주웠다!\p");
const u8 BattleText_Unaffected[] = _("{DEFENDING_MON}에게는\n전혀 효과가 없다!");
const u8 BattleText_Transformed[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}{K_EU}로 변신했다!");
const u8 BattleText_SubMade[] = _("{ATTACKING_MON}의\n분신이 나타났다");
const u8 BattleText_SubAlready[] = _("{ATTACKING_MON}의\n대타는 이미 나와있다!");
const u8 BattleText_SubTookDamage[] = _("{DEFENDING_MON}{K_EULREUL} 대신하여\n분신이 공격을 받았다!\p");
const u8 BattleText_SubFaded[] = _("{DEFENDING_MON}의 분신은\n사라져 버렸다...\p");
const u8 BattleText_MustRecharge[] = _("공격의 반동으로\n{ATTACKING_MON}{K_EUNNEUN} 움직일 수 없다!");
const u8 BattleText_RageBuilding[] = _("{DEFENDING_MON}의 분노\n볼티지가 올라가고 있다!");
const u8 BattleText_MoveWasDisabled[] = _("{DEFENDING_MON}의\n{STRING 0}{K_EULREUL} 봉인했다!");
const u8 BattleText_DisabledNoMore[] = _("{ATTACKING_MON}의\n사슬묶기가 풀렸다!");
const u8 BattleText_EncoreGot[] = _("{DEFENDING_MON}{K_EUNNEUN}\n앵콜을 받았다!");
const u8 BattleText_EncoreEnded[] = _("{ATTACKING_MON}의\n앵콜 상태가 풀렸다!");
const u8 BattleText_TookAim[] = _("{ATTACKING_MON}{K_EUNNEUN} 목표를\n{DEFENDING_MON}{K_EU}로 결정했다!");
const u8 BattleText_SketchedMove[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 스케치했다!");
const u8 BattleText_DestinyBondTake[] = _("{ATTACKING_MON}{K_EUNNEUN} 상대를\n길동무로 삼으려 하고 있다");
const u8 BattleText_DestinyBondTaken[] = _("{DEFENDING_MON}{K_EUNNEUN} {ATTACKING_MON}{K_EULREUL}\n길동무로 삼았다!");
const u8 BattleText_ReducedBy[] = _("{DEFENDING_MON}의\n{STRING 0}{K_EULREUL} {STRING 1} 깎았다!");
const u8 BattleText_StoleSomething[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}로부터\n{STRING 19}{K_EULREUL} 빼앗았다!");
const u8 BattleText_CantEscapeNow[] = _("{DEFENDING_MON}{K_EUNNEUN}\n이제 도망칠 수 없다!");
const u8 BattleText_NightmareStart[] = _("{DEFENDING_MON}{K_EUNNEUN}\n악몽을 꾸기 시작했다!");
const u8 BattleText_NightmareLock[] = _("{ATTACKING_MON}{K_EUNNEUN}\n악몽에 시달리고 있다!");
const u8 BattleText_CurseLay[] = _("{ATTACKING_MON}{K_EUNNEUN}\n자신의 체력을 깎아서\l{DEFENDING_MON}에게 저주를 걸었다!");
const u8 BattleText_CurseAfflict[] = _("{ATTACKING_MON}{K_EUNNEUN}\n저주받고 있다!");
const u8 BattleText_SpikesScattered[] = _("{STRING 37}의 발밑에\n압정이 뿌려졌다!");
const u8 BattleText_SpikesHurt[] = _("{STRING 16}{K_EUNNEUN} 압정뿌리기의\n데미지를 입었다!");
const u8 BattleText_IdentifiedPoke[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n정체를 꿰뚫어 보았다!");
const u8 BattleText_PerishSongFell[] = _("{ATTACKING_MON}의 멸망의\n카운트가 {STRING 0}{K_IGA} 되었다!");
const u8 BattleText_BracedItself[] = _("{ATTACKING_MON}{K_EUNNEUN}\n버티기 태세에 들어갔다!");
const u8 BattleText_EnduredHit[] = _("{DEFENDING_MON}{K_EUNNEUN}\n공격을 버텼다!");
const u8 BattleText_MagnitudeCount[] = _("매그니튜드 {STRING 0}!!");
const u8 BattleText_CutHPMaxATK[] = _("{ATTACKING_MON}{K_EUNNEUN} 체력을 깎아서\n풀파워로 만들었다!");
const u8 BattleText_CopyStatChanges[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n능력 변화를 복사했다!");
const u8 BattleText_GotFreeFrom[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n{STRING 0}{K_EU}로부터 풀려났다!");
const u8 BattleText_LeechShed[] = _("{ATTACKING_MON}에게\n씨앗을 심었다!");
const u8 BattleText_SpikesBlownAway[] = _("{ATTACKING_MON}의\n압정이 사라졌다!");
const u8 BattleText_FledBattle[] = _("{ATTACKING_MON}{K_EUNNEUN}\n배틀에서 이탈했다!");
const u8 BattleText_ForesawAttack[] = _("{ATTACKING_MON}{K_EUNNEUN} 미래의\n공격을 예지했다!");
const u8 BattleText_TookAttack[] = _("{DEFENDING_MON}{K_EUNNEUN}\n{STRING 0} 공격을 받았다!");
const u8 BattleText_ChoseDestiny[] = _("{ATTACKING_MON}{K_EUNNEUN} {STRING 17}{K_EULREUL}\n미래에 맡겼다!");
const u8 BattleText_PokeAttack[] = _("{STRING 0}의 공격!");
const u8 BattleText_CenterAttention[] = _("{ATTACKING_MON}{K_EUNNEUN}\n주목의 대상이 되었다!");
const u8 BattleText_ChargingPower[] = _("{ATTACKING_MON}{K_EUNNEUN}\n충전을 시작했다!");
const u8 BattleText_NaturePower[] = _("자연의힘은\n{STRING 17}{K_IGA} 되었다!");
const u8 BattleText_StatusNormal[] = _("{ATTACKING_MON}의 상태이상이\n나았다!");
const u8 BattleText_TormentSubject[] = _("{DEFENDING_MON}{K_EUNNEUN}\n트집을 잡혔다!");
const u8 BattleText_TightenFocus[] = _("{ATTACKING_MON}{K_EUNNEUN}\n집중력을 높이고 있다!");
const u8 BattleText_TauntFell[] = _("{DEFENDING_MON}{K_EUNNEUN}\n도발에 넘어가 버렸다!");
const u8 BattleText_ReadyToHelp[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}에게\n도우미가 되어주려 한다!");
const u8 BattleText_SwitchedItems[] = _("{ATTACKING_MON}{K_EUNNEUN} 서로의\n도구를 교체했다!");
const u8 BattleText_Obtained1[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 손에 넣었다!");
const u8 BattleText_Obtained2[] = _("{DEFENDING_MON}{K_EUNNEUN}\n{STRING 1}{K_EULREUL} 손에 넣었다!");
const u8 BattleText_Obtained3[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 손에 넣었다!\p{DEFENDING_MON}{K_EUNNEUN}\n{STRING 1}{K_EULREUL} 손에 넣었다!");
const u8 BattleText_CopiedObject[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n{STRING 22}{K_EULREUL} 복사했다!");
const u8 BattleText_WishMade[] = _("{ATTACKING_MON}{K_EUNNEUN}\n희망사항을 썼다!");
const u8 BattleText_WishTrue[] = _("{STRING 0}의\n희망사항이 이루어졌다!");
const u8 BattleText_PlantedRoots[] = _("{ATTACKING_MON}{K_EUNNEUN} 뿌리를 뻗었다!");
const u8 BattleText_AbsorbNutrients[] = _("{ATTACKING_MON}{K_EUNNEUN} 뿌리로부터\n양분을 흡수했다!");
const u8 BattleText_AnchoredItself[] = _("{DEFENDING_MON}{K_EUNNEUN} 뿌리를 뻗어서\n움직이지 않는다!");
const u8 BattleText_DrowsyMade[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n졸음을 유도했다!");
const u8 BattleText_KnockedOffItem[] = _("{ATTACKING_MON}{K_EUNNEUN} {DEFENDING_MON}의\n{STRING 19}{K_EULREUL} 탁쳐서 떨구었다!");
const u8 BattleText_AbilitySwap[] = _("{ATTACKING_MON}{K_EUNNEUN} 서로의\n특성을 교체했다!");
const u8 BattleText_SealedMove[] = _("{ATTACKING_MON}{K_EUNNEUN} 상대의\n기술을 봉인했다!");
const u8 BattleText_GrudgeBear[] = _("{ATTACKING_MON}{K_EUNNEUN} 상대에게\n원념을 걸려 하고 있다!");
const u8 BattleText_GrudgeLosePP[] = _("{ATTACKING_MON}의 {STRING 0}{K_EUNNEUN}\n원념으로 PP가 0이 되었다!");
const u8 BattleText_ShroudedItself[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 17}에 둘러싸였다!");
const u8 BattleText_MagicCoatBounce[] = _("{ATTACKING_MON}의 {STRING 17}{K_EUNNEUN}\n매직코트에 튕겨졌다!");
const u8 BattleText_AwaitMove[] = _("{ATTACKING_MON}{K_EUNNEUN}\n상대의 움직임을 살피고 있다!");
const u8 BattleText_SnatchedMove[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 16}의\n기술을 가로챘다!");
const u8 BattleText_ElecWeakened[] = _("전기의 위력이 약해졌다!");
const u8 BattleText_FireWeakened[] = _("불꽃의 위력이 약해졌다!");
const u8 BattleText_FoundOne[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 19}{K_EULREUL} 주워 왔다!");
const u8 BattleText_SoothingAroma[] = _("기분 좋은 향기가 퍼졌다!");
const u8 BattleText_CantUseItems[] = _("여기에서는 도구를\n사용할 수 없습니다!{PAUSE 64}");
const u8 BattleText_UnknownString2[] = _("{STRING 19}{K_EUNNEUN} {STRING 16}에게는\n{STRING 0}");
const u8 BattleText_HustleUse[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EULREUL} 써서\n의욕이 넘치기 시작했다!");
const u8 BattleText_LostFocus[] = _("{ATTACKING_MON}{K_EUNNEUN} 집중력이\n떨어져서 기술을 쓸 수 없었다!");
const u8 BattleText_DraggedOut[] = _("{DEFENDING_MON}{K_EUNNEUN} 배틀에\n끌려 나왔다!\p");
const u8 BattleText_BrokeWall[] = _("벽이 깨졌다!");
const u8 BattleText_NoEffect[] = _("그러나 효과가 없었다!");
const u8 BattleText_NoMovesLeft[] = _("{STRING 15}{K_EUNNEUN} 쓸 수 있는\n기술이 없다!\p");
const u8 BattleText_MoveIsDisabled[] = _("{STRING 15}{K_EUNNEUN} 사슬묶기 때문에\n{STRING 17}{K_EULREUL} 쓸 수 없다!\p");
const u8 BattleText_TormentNoUse[] = _("{STRING 15}{K_EUNNEUN}\n트집을 잡혔기 때문에\l계속해서 같은 기술을 쓸 수 없다!\p");
const u8 BattleText_TauntNoUse[] = _("{STRING 15}{K_EUNNEUN} 도발당한 상태라서\n{STRING 17}{K_EULREUL} 쓸 수 없다!\p");
const u8 BattleText_SealedNoUse[] = _("{STRING 15}{K_EUNNEUN} 봉인 때문에\n{STRING 17}{K_EULREUL} 쓸 수 없다!\p");
const u8 BattleText_RainMade[] = _("{STRING 16}의 {STRING 23}\n때문에 비가 내리기 시작했다!");
const u8 BattleText_SpeedRisen[] = _("{STRING 16}의 {STRING 23}\n때문에 스피드가 올라갔다!");
const u8 BattleText_ProtectedBy[] = _("{DEFENDING_MON}의 {STRING 22} 때문에\n효과가 없었다!");
const u8 BattleText_PreventedBy[] = _("{DEFENDING_MON}의 {STRING 22}\n때문에 {ATTACKING_MON}{K_EUNNEUN}\l{STRING 17}{K_EULREUL} 할 수 없다!");
const u8 BattleText_HPRestoredUsing[] = _("{DEFENDING_MON}{K_EUNNEUN}\n{STRING 22}{K_EU}로 인해 회복했다!");
const u8 BattleText_MadeUseless[] = _("{DEFENDING_MON}의 {STRING 22}\n때문에 {STRING 17}{K_EUNNEUN} 효과가 없었다!");
const u8 BattleText_MadeType[] = _("{DEFENDING_MON}의 {STRING 22} 때문에\n{STRING 0}타입이 되었다!");
const u8 BattleText_PreventedPara[] = _("{STRING 14}{K_EUNNEUN} {STRING 22}\n때문에 마비되지 않는다!");
const u8 BattleText_PreventedRomance[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n헤롱헤롱해지지 않는다!");
const u8 BattleText_PreventedPoison[] = _("{STRING 14}{K_EUNNEUN}\n{STRING 22} 때문에\l독에 걸리지 않는다!");
const u8 BattleText_PreventedConfusion[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22}\n때문에 혼란되지 않는다!");
const u8 BattleText_RaisedFirePower[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n불꽃의 위력이 올라갔다!");
const u8 BattleText_AnchorsItself[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n들러붙어 있다!");
const u8 BattleText_CutsAttack[] = _("{STRING 16}의 {STRING 23}\n때문에 {DEFENDING_MON}의 공격이 떨어졌다!");
const u8 BattleText_PreventedStatLoss[] = _("{STRING 16}{K_EUNNEUN} {STRING 23} 때문에\n능력이 떨어지지 않는다!");
const u8 BattleText_HurtOther[] = _("{DEFENDING_MON}의 {STRING 22} 때문에\n{ATTACKING_MON}{K_EUNNEUN} 상처를 입었다!");
const u8 BattleText_Traced[] = _("{STRING 16}{K_EUNNEUN} {STRING 0}의\n{STRING 1}{K_EULREUL} 트레이스했다!");
const u8 BattleText_PreventedBurn[] = _("{STRING 14}{K_EUNNEUN} {STRING 24} 때문에\n화상을 입지 않는다!");
const u8 BattleText_BlocksOther[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n{STRING 17}{K_EULREUL} 받지 않는다!");
const u8 BattleText_BlocksOther2[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 23} 때문에\l{STRING 17}{K_EULREUL} 받지 않는다!");
const u8 BattleText_RestoredHPByItem[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 21}{K_EU}로 인해 조금 회복했다");
const u8 BattleText_WhipSandstorm[] = _("{STRING 16}의 {STRING 23}\n때문에 모래바람이 불었다!");
const u8 BattleText_SunIntensified[] = _("{STRING 16}의 {STRING 23}\n때문에 햇살이 강해졌다!");
const u8 BattleText_PreventedLoss[] = _("{STRING 16}{K_EUNNEUN} {STRING 23} 때문에\n{STRING 0}{K_IGA} 떨어지지 않는다!");
const u8 BattleText_InfatuatedPoke[] = _("{DEFENDING_MON}의 {STRING 22}\n때문에 {ATTACKING_MON}{K_EUNNEUN} 헤롱헤롱해졌다!");
const u8 BattleText_MadeIneffective[] = _("{DEFENDING_MON}의\n{STRING 22} 때문에\l{STRING 17}{K_EUNNEUN} 효과가 없다!");
const u8 BattleText_CuredProblem[] = _("{STRING 16}{K_EUNNEUN} {STRING 23} 때문에\n{STRING 0}상태가 나았다!");
const u8 BattleText_OozeSuckup[] = _("해감액을 흡수했다!");
const u8 BattleText_Transformed2[] = _("{STRING 16}의 모습이\n변화했다!");
const u8 BattleText_TookAttack2[] = _("{DEFENDING_MON}{K_EUNNEUN} {STRING 22} 때문에\n공격을 받았다!");
const u8 BattleText_PreventedSwitch[] = _("{STRING 0}의 {STRING 20} 때문에\n교체할 수 없다!\p");
const u8 BattleText_PreventedOther[] = _("{DEFENDING_MON}의\n{STRING 22} 때문에\l{STRING 16}의\l{STRING 0}{K_EUNNEUN} 효과가 없었다!");
const u8 BattleText_MadeIneffective2[] = _("{STRING 16}의\n{STRING 23} 때문에 실패했다!");
const u8 BattleText_PreventedFlinching[] = _("{STRING 14}{K_EUNNEUN} {STRING 24} 때문에\n풀이 죽지 않는다!");
const u8 BattleText_PreventedOther2[] = _("{ATTACKING_MON}의 {STRING 21}{K_EUNNEUN}\n{DEFENDING_MON}의\l{STRING 22} 때문에 효과가 없었다!");
const u8 BattleText_CuredOfProblem[] = _("{STRING 16}{K_EUNNEUN} {STRING 23} 때문에\n{STRING 0}상태가 나았다!");
const u8 BattleText_NoEffectOn[] = _("{STRING 16}의 {STRING 23}{K_EUNNEUN}\n{STRING 14}에게는 효과가 없었다!");
const u8 BattleText_Sharply[] = _("크게 ");
const u8 BattleText_Rose[] = _("올라갔다!");
const u8 BattleText_Harshly[] = _("매우 크게 ");
const u8 BattleText_Fell[] = _("떨어졌다!");
const u8 BattleText_UnknownString7[] = _("{ATTACKING_MON}의\n{STRING 0}{K_IGA} {STRING 1}");
const u8 BattleText_UnknownString3[] = _("{DEFENDING_MON}의\n{STRING 0}{K_IGA} {STRING 1}");
const u8 BattleText_UnknownString4[] = _("{STRING 19}{K_EU}로 {STRING 16}의\n{STRING 0}{K_IGA} {STRING 1}");
const u8 BattleText_UnknownString5[] = _("{ATTACKING_MON}의\n{STRING 0}{K_IGA} {STRING 1}");
const u8 BattleText_UnknownString6[] = _("{DEFENDING_MON}의\n{STRING 0}{K_IGA} {STRING 1}");
const u8 BattleText_StatNoHigher[] = _("{ATTACKING_MON}의 능력은\n더 올라가지 않는다!");
const u8 BattleText_StatNoLower[] = _("{DEFENDING_MON}의 능력은\n더 떨어지지 않는다!");
const u8 BattleText_Critical[] = _("급소에 맞았다!");
const u8 BattleText_GrandSlam[] = _("일격필살!");
const u8 BattleText_MoveForget123[] = _("{PAUSE 32}1, {PAUSE 15}2, {PAUSE 15}... {PAUSE 15}... {PAUSE 15}... {PAUSE 15}{PLAY_SE SE_KON}짠!\p");
const u8 BattleText_MoveForgetAnd[] = _("그리고...!\p");
const u8 BattleText_CantForgetHM[] = _("중요한 기술입니다!\n잊게 할 수 없습니다!\p");
const u8 BattleText_NotEffective[] = _("효과가 별로인 듯하다");
const u8 BattleText_SuperEffective[] = _("효과가 굉장했다!");
const u8 BattleText_GotAwaySafely[] = _("{PLAY_SE SE_NIGERU}무사히 도망쳤다!\p");
const u8 BattleText_FledUsingItem[] = _("{PLAY_SE SE_NIGERU}{ATTACKING_MON}{K_EUNNEUN} 가지고 있던\n{STRING 19}{K_EULREUL} 써서 도망쳤다\p");
const u8 BattleText_FledUsingOther[] = _("{PLAY_SE SE_NIGERU}{ATTACKING_MON}{K_EUNNEUN}\n{STRING 21}{K_EULREUL} 써서 도망쳤다\p");
const u8 BattleText_FledWild[] = _("{PLAY_SE SE_NIGERU}야생 {STRING 0}{K_EUNNEUN} 도망쳤다!");
const u8 BattleText_PlayerDefeatedTrainer[] = _("{STRING 29}{K_WAGWA}의\n승부에서 이겼다!");
const u8 BattleText_PlayerDefeatedTrainers[] = _("{STRING 29}{K_WAGWA}\n{STRING 30}{K_WAGWA}의\l승부에서 이겼다!");
const u8 BattleText_PlayerLostTrainer[] = _("{STRING 29}{K_WAGWA}의\n승부에서 졌다!");
const u8 BattleText_PlayerLostTrainers[] = _("{STRING 29}{K_WAGWA}\n{STRING 30}{K_WAGWA}의\l승부에서 졌다!");
const u8 BattleText_PlayerTiedTrainer[] = _("{STRING 29}{K_WAGWA}의\n승부에서 비겼다!");
const u8 BattleText_PlayerTiedTrainers[] = _("{STRING 29}{K_WAGWA}\n{STRING 30}{K_WAGWA}의\l승부에서 비겼다!");
const u8 BattleText_FledSingle[] = _("{PLAY_SE SE_NIGERU}{STRING 29}{K_EUNNEUN} 도망쳤다!");
const u8 BattleText_FledDouble[] = _("{PLAY_SE SE_NIGERU}{STRING 29}{K_WAGWA} {STRING 30}{K_EUNNEUN}\n도망쳤다!");
const u8 BattleText_NoRunning[] = _("안돼! 승부 도중에\n상대에게 등을 보일 순 없어!\p");
const u8 BattleText_CantEscape2[] = _("도망칠 수 없다!\p");
const u8 BattleText_BirchDontLeaveMe[] = _("털보박사: 외, 외면하지 말아줘-!\p");
const u8 BattleText_Nothing[] = _("그러나 아무 일도 일어나지 않았다");
const u8 BattleText_Failed[] = _("그러나 실패하고 말았다!");
const u8 BattleText_HurtItself[] = _("영문도 모른 채\n자신을 공격했다!");
const u8 BattleText_MirrorFail[] = _("그러나 따라하기는\n실패로 끝났다!");
const u8 BattleText_RainStart[] = _("비가 내리기 시작했다!");
const u8 BattleText_PourStart[] = _("폭우로 변했다!");
const u8 BattleText_RainCont1[] = _("비가 계속 내리고 있다");
const u8 BattleText_PourCont[] = _("폭우가 계속 내리고 있다");
const u8 BattleText_RainStop[] = _("비가 그쳤다!");
const u8 BattleText_SandBrewed[] = _("모래바람이 불기 시작했다!");
const u8 BattleText_SandRages[] = _("모래바람이 세차게 분다");
const u8 BattleText_SandSubsided[] = _("모래바람이 가라앉았다!");
const u8 BattleText_SunBright[] = _("햇살이 강해졌다!");
const u8 BattleText_SunStrong[] = _("햇살이 강하다");
const u8 BattleText_SunFaded[] = _("햇살이 약해졌다!");
const u8 BattleText_HailStart[] = _("싸라기눈이 내리기 시작했다!");
const u8 BattleText_HailCont[] = _("싸라기눈이 계속 내리고 있다");
const u8 BattleText_HailStop[] = _("싸라기눈이 그쳤다!");
const u8 BattleText_SpitUpFail[] = _("그러나 아무것도 토해낼 수 없었다!");
const u8 BattleText_SwallowFail[] = _("그러나 아무것도 꿀꺽할 수 없었다!");
const u8 BattleText_WindHeatWave[] = _("바람은 열풍이 되었다!");
const u8 BattleText_StatElim[] = _("모든 상태가\n원래대로 되돌아왔다!");
const u8 BattleText_CoinScatter[] = _("돈이 주위에 흩어졌다!");
const u8 BattleText_SubWeak[] = _("그러나 분신을 쓰기에는\n체력이 부족했다!");
const u8 BattleText_PainSplit[] = _("서로의 체력을 나누어 가졌다!");
const u8 BattleText_BellChime[] = _("방울소리가 울려 퍼졌다!");
const u8 BattleText_PerishSong[] = _("멸망의노래를 들은 포켓몬은\n3턴 후에 쓰러져 버린다!");
const u8 BattleText_NoPP1[] = _("남은 기술 포인트가 없다!\p");
const u8 BattleText_NoPP2[] = _("그러나\n남은 기술 포인트가 없었다!");
const u8 BattleText_IgnoredOrdersSLP[] = _("{ATTACKING_MON}{K_EUNNEUN} 잠든 채로\n명령을 무시했다!");
const u8 BattleText_IgnoredOrders[] = _("{ATTACKING_MON}{K_EUNNEUN} 명령을 무시했다!");
const u8 BattleText_BeganNap[] = _("{ATTACKING_MON}{K_EUNNEUN} 낮잠을 자기 시작했다!");
const u8 BattleText_LoafingAround[] = _("{ATTACKING_MON}{K_EUNNEUN} 게으름을 피우고 있다!");
const u8 BattleText_WontObey[] = _("{ATTACKING_MON}{K_EUNNEUN} 말을 듣지 않는다!");
const u8 BattleText_TurnedAway[] = _("{ATTACKING_MON}{K_EUNNEUN} 외면했다!");
const u8 BattleText_NotNotice[] = _("{ATTACKING_MON}{K_EUNNEUN} 모른 체했다!");
const u8 BattleText_WillSwitch[] = _("{STRING 25} {STRING 26}{K_EUNNEUN}\n{STRING 1}{K_EULREUL} 내보내려 하고 있다\p{STRING 32}도 포켓몬을\n교체하겠습니까?");
const u8 BattleText_LearnedMove2[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 배웠다!");
const u8 BattleText_PlayerDefeatedTrainer2[] = _("{STRING 25} {STRING 26}{K_WAGWA}의\n승부에서 이겼다!\p");
const u8 BattleText_CreptCloser[] = _("{STRING 32}{K_EUNNEUN}\n{STRING 3}에게 다가갔다!");
const u8 BattleText_CantGetCloser[] = _("{STRING 32}{K_EUNNEUN}\n더 이상 다가갈 수 없다!");
const u8 BattleText_WatchingCarefully[] = _("{STRING 3}{K_EUNNEUN}\n이쪽의 상황을 살피고 있다!");
const u8 BattleText_CuriousAbout[] = _("{STRING 3}{K_EUNNEUN}\n{STRING 0}에 대해 관심을 가졌다!");
const u8 BattleText_EnthralledBy[] = _("{STRING 3}{K_EUNNEUN}\n{STRING 0}{K_IGA} 마음에 들었다!");
const u8 BattleText_IgnoredThing[] = _("{STRING 3}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 무시했다!");
const u8 BattleText_ThrewBlock[] = _("{STRING 32}{K_EUNNEUN}\n{STRING 3}에게 포켓몬스넥을 던졌다!");
const u8 BattleText_SafariOver[] = _("{PLAY_SE SE_PINPON}아나운서: 딩동-!\n사파리볼이 전부 떨어졌으므로\l종료입니다-!\p");
const u8 BattleText_WildAppeared1[] = _("앗! 야생 {STRING 3}{K_IGA} 튀어나왔다!\p");
const u8 BattleText_WildAppeared2[] = _("앗! 야생 {STRING 3}{K_IGA} 튀어나왔다!\p");
const u8 BattleText_WildAppeared3[] = _("앗! 야생 {STRING 3}{K_IGA} 튀어나왔다!{PAUSE 127}");
const u8 BattleText_WildDoubleAppeared[] = _("앗! 야생 {STRING 5}{K_WAGWA}\n{STRING 3}{K_IGA} 튀어나왔다!\p");
const u8 BattleText_SingleWantToBattle1[] = _("{STRING 25} {STRING 26}{K_IGA}\n승부를 걸어왔다!\p");
const u8 BattleText_SingleWantToBattle2[] = _("{STRING 29}{K_IGA}\n승부를 걸어왔다!");
const u8 BattleText_DoubleWantToBattle[] = _("{STRING 29}{K_WAGWA} {STRING 30}{K_IGA}\n승부를 걸어왔다!");
const u8 BattleText_SentOutSingle1[] = _("{STRING 25} {STRING 26}{K_EUNNEUN}\n{STRING 3}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutDouble1[] = _("{STRING 25} {STRING 26}{K_EUNNEUN}\n{STRING 3}{K_WAGWA} {STRING 5}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutSingle2[] = _("{STRING 25} {STRING 26}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutSingle3[] = _("{STRING 29}{K_EUNNEUN}\n{STRING 3}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutDouble2[] = _("{STRING 29}{K_EUNNEUN}\n{STRING 3}{K_WAGWA} {STRING 5}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutDouble3[] = _("{STRING 29}{K_EUNNEUN}\n{STRING 7}{K_EULREUL} 내보냈다!\p{STRING 30}{K_EUNNEUN}\n{STRING 9}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutSingle4[] = _("{STRING 29}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutSingle5[] = _("{STRING 31}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 내보냈다!");
const u8 BattleText_SentOutSingle6[] = _("가랏! {STRING 2}!");
const u8 BattleText_SentOutDouble4[] = _("가랏! {STRING 2}! {STRING 4}!");
const u8 BattleText_SentOutSingle7[] = _("가랏! {STRING 0}!");
const u8 BattleText_SentOutSingle8[] = _("널 믿어! {STRING 0}!");
const u8 BattleText_SentOutSingle9[] = _("힘내! {STRING 0}!");
const u8 BattleText_SentOutSingle10[] = _("상대가 약해져 있어!\n기회다! {STRING 0}!");
const u8 BattleText_SentOutSingle11[] = _("{STRING 28}{K_EUNNEUN} {STRING 8}{K_EULREUL} 꺼냈다!\n가랏! {STRING 6}!");
const u8 BattleText_ComeBackSingle1[] = _("{STRING 0} 좋아!\n돌아와!");
const u8 BattleText_ComeBackSingle2[] = _("{STRING 0}\n돌아와!");
const u8 BattleText_ComeBackSingle3[] = _("{STRING 0} 좋았어!\n돌아와!");
const u8 BattleText_ComeBackSingle4[] = _("{STRING 0} 잘했어!\n돌아와!");
const u8 BattleText_WithdrewPoke1[] = _("{STRING 25} {STRING 26}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 넣어버렸다!");
const u8 BattleText_WithdrewPoke2[] = _("{STRING 29}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 넣어버렸다!");
const u8 BattleText_WithdrewPoke3[] = _("{STRING 31}{K_EUNNEUN}\n{STRING 0}{K_EULREUL} 넣어버렸다!");
const u8 BattleText_Wild[] = _("야생 ");
const u8 BattleText_Foe[] = _("상대 ");
const u8 BattleText_Foe2[] = _("상대 ");
const u8 BattleText_Ally[] = _("우리 편 ");
const u8 BattleText_Foe3[] = _("상대");
const u8 BattleText_Ally2[] = _("우리 편");
const u8 BattleText_Foe4[] = _("상대를");
const u8 BattleText_Ally3[] = _("우리 편");
const u8 BattleText_OpponentUsedMove[] = _("{ATTACKING_MON}{K_EUNNEUN}\n{STRING 1}");
const u8 BattleText_Exclamation2[] = _("{K_EULREUL} 썼다!");
const u8 BattleText_Exclamation3[] = _("{K_EULREUL} 썼다!");
const u8 BattleText_Exclamation4[] = _("{K_EULREUL} 썼다!");
const u8 BattleText_Exclamation5[] = _(" 공격!");
const u8 BattleText_Exclamation[] = _("!");
const u8 BattleStatText_HP[] = _("체력");
const u8 BattleStatText_Attack[] = _("공격");
const u8 BattleStatText_Defense[] = _("방어");
const u8 BattleStatText_Speed[] = _("스피드");
const u8 BattleStatText_SpAtk[] = _("특수공격");
const u8 BattleStatText_SpDef[] = _("특수방어");
const u8 BattleStatText_Accuracy[] = _("명중률");
const u8 BattleStatText_Evasion[] = _("회피율");
const u8 ContestStatText_TooSpicy[] = _("너무 맵다!");
const u8 ContestStatText_TooDry[] = _("너무 떫다!");
const u8 ContestStatText_TooSweet[] = _("너무 달다!");
const u8 ContestStatText_TooBitter[] = _("너무 쓰다!");
const u8 ContestStatText_TooSour[] = _("너무 시다!");
const u8 BattleText_Used1[] = _("{STRING 32}{K_EUNNEUN}\n{STRING 19}{K_EULREUL} 썼다!");
const u8 BattleText_TutorialUsed[] = _("민진은\n{STRING 19}{K_EULREUL} 썼다!");
const u8 BattleText_Used2[] = _("{STRING 25} {STRING 26}{K_EUNNEUN}\n{STRING 19}{K_EULREUL} 썼다!");
const u8 BattleText_BlockBall[] = _("트레이너가 볼을 튕겨내 버렸다!");
const u8 BattleText_DontBeAThief[] = _("남의 것에 손대면 도둑!");
const u8 BattleText_DodgeBall[] = _("피했다!\n이 녀석은 잡힐 것 같지 않군!");
const u8 BattleText_MissPoke[] = _("포켓몬에게\n제대로 맞지 않았다!");
const u8 BattleText_BallBrokeOhNo[] = _("안돼! 포켓몬이\n볼에서 나와버렸다!");
const u8 BattleText_BallBrokeAppeared[] = _("아아!\n잡았다고 생각했는데!");
const u8 BattleText_BallBrokeAlmost[] = _("아쉽다!\n조금만 더하면 잡을 수 있었는데!");
const u8 BattleText_BallBrokeSoClose[] = _("아깝다!\n조금만 더하면 됐는데!");
const u8 BattleText_BallCaught1[] = _("신난다-!\n{STRING 3}{K_EULREUL} 붙잡았다!{UNKNOWN_A}{PLAY_BGM BGM_KACHI22}\p");
const u8 BattleText_BallCaught2[] = _("신난다-!\n{STRING 3}{K_EULREUL} 붙잡았다!{UNKNOWN_A}{PLAY_BGM BGM_KACHI22}{PAUSE 127}");
const u8 BattleText_GiveNickname[] = _("잡은 {STRING 3}에게\n닉네임을 붙이겠습니까?");
const u8 BattleText_SentToPC[] = _("{STRING 3}{K_EUNNEUN}\n{STRING 35} PC로 전송되었다!");
const u8 BattleText_Someone[] = _("누군가의");
const u8 BattleText_Lanette[] = _("보은의");
const u8 BattleText_AddedToDex[] = _("{STRING 3}의 데이터가 새로\n포켓몬 도감에 등록됩니다!\p");
const u8 BattleText_Raining[] = _("비가 내리고 있다");
const u8 BattleText_Sandstorm[] = _("모래바람이 세차게 불고 있다");
const u8 BattleText_BoxFull[] = _("박스가 가득 찼습니다!\n더 이상 잡을 수 없습니다!\p");
const u8 BattleText_EnigmaBerry[] = _("의문열매");
const u8 BattleText_Berry[] = _("열매");
const u8 BattleText_CuredParalysis[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 19}{K_EU}로 마비가 풀렸다!");
const u8 BattleText_CuredPoison[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 19}{K_EU}로 독이 해독됐다!");
const u8 BattleText_CuredBurn[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 19}{K_EU}로 화상이 나았다!");
const u8 BattleText_CuredFreeze[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 19}{K_EU}로 얼음상태가 나았다!");
const u8 BattleText_CuredSleep[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 19}{K_EU}로 잠에서 깼다!");
const u8 BattleText_CuredConfusion[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 19}{K_EU}로 혼란이 풀렸다!");
const u8 BattleText_CuredStatus[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 19}{K_EU}로 {STRING 0}상태가 나았다!");
const u8 BattleText_NormalizedStatus[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 19}{K_EU}로 상태이상이 나았다!");
const u8 BattleText_RestoredHealth[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 19}{K_EU}로 체력을 회복했다!");
const u8 BattleText_RestoredPP[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 19}{K_EU}로 {STRING 0}의 PP를 회복했다!");
const u8 BattleText_RestoredStatus[] = _("{STRING 16}{K_EUNNEUN} {STRING 19}{K_EU}로 상태를 원래대로 되돌렸다!");
const u8 BattleText_RestoredHPLittle[] = _("{STRING 16}{K_EUNNEUN}\n{STRING 19}{K_EU}로 조금 회복했다");
const u8 BattleText_ChoiceBand[] = _("{STRING 19}의 효과로\n{STRING 17}밖에 쓸 수 없다!\p");
const u8 BattleText_FocusSash[] = _("{DEFENDING_MON}{K_EUNNEUN}\n{STRING 19}{K_EU}로 버텼다!");
const u8 BattleText_Terminator2[] = _("");
const u8 BattleText_WallyBall[] = _("여기서 볼을 던지는 거군요\n저... 해볼게요!");
const u8 BattleText_StartEvo[] = _("...오잉!?\n{STRING 2}의 모습이...!");
const u8 BattleText_FinishEvo[] = _("축하합니다! {STRING 2}{K_EUNNEUN}\n{STRING 3}{K_EU}로 진화했습니다!{UNKNOWN_A}\p");
const u8 BattleText_StopEvo[] = _("얼라리...?\n{STRING 2}의 변화가 멈췄다!\p");
const u8 BattleText_OtherMenu[] = _("{STRING 15}{K_EUNNEUN}\n무엇을 할까?");
const u8 BattleText_PlayerMenu[] = _("{STRING 32}{K_EUNNEUN}\n무엇을 할까?");
const u8 BattleText_WallyMenu[] = _("민진은\n무엇을 할까?");
const u8 BattleText_LinkStandby[] = _("{PAUSE 16}통신 대기 중...");
const u8 BattleText_MenuOptions[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}싸운다{CLEAR_TO 0x30}가방\n포켓몬{CLEAR_TO 0x30}도망간다");
const u8 BattleText_MenuOptionsSafari[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}볼{CLEAR_TO 0x30}포켓몬스넥\n다가간다{CLEAR_TO 0x30}도망간다");
const u8 BattleText_PP[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}PP\n타입/");
const u8 BattleText_Format[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}"); // cant think of a better name
const u8 BattleText_ForgetMove[] = _("{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}{PALETTE 5}바꿀 기술을\n선택해주세요");
const u8 BattleText_YesNo[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}예\n아니오");
const u8 BattleText_SwitchWhich[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}바꿀 기술을\n선택해주세요");
const u8 BattleText_Format2[] = _("{PALETTE 5}{COLOR_HIGHLIGHT_SHADOW SKY_BLUE LIGHT_BLUE WHITE2}");
const u8 BattleText_RightArrow[] = _("{RIGHT_ARROW}");
const u8 BattleText_Plus[] = _("+");
const u8 BattleText_Dash[] = _("-");
const u8 BattleText_HP[] = _("HP  ");
const u8 BattleText_Attack[] = _("공격");
const u8 BattleText_Defense[] = _("방어");
const u8 BattleText_SpAtk[] = _("특수공격");
const u8 BattleText_SpDef[] = _("특수방어");
const u8 BattleText_SafariBalls[] = _("{HIGHLIGHT RED}사파리볼");
const u8 BattleText_SafariBallsLeft[] = _("{HIGHLIGHT RED}개 남음");
const u8 BattleText_HighlightRed[] = _("{HIGHLIGHT RED}");
const u8 BattleText_Sleep[] = _("잠듦");
const u8 BattleText_PoisonStatus[] = _("독");
const u8 BattleText_Burn[] = _("화상");
const u8 BattleText_Paralysis[] = _("마비");
const u8 BattleText_IceStatus[] = _("얼음");
const u8 BattleText_Confusion[] = _("혼란");
const u8 BattleText_Love[] = _("헤롱헤롱");
const u8 BattleText_Format3[] = _("{K_WAGWA} ");
const u8 BattleText_Format4[] = _(", ");
const u8 BattleText_Format5[] = _(" ");
const u8 BattleText_Format6[] = _("\l");
const u8 BattleText_Format7[] = _("\n");
const u8 BattleText_Format8[] = _("{K_EUNNEUN}");
const u8 BattleText_Format9[] = _("{K_EUNNEUN}");
const u8 gBadEggNickname[] = _("불량알"); // 8400E3A
const u8 BattleText_Wally[] = _("민진");
const u8 BattleText_Win[] = _("{HIGHLIGHT TRANSPARENT}승"); // 8400E48
const u8 BattleText_Loss[] = _("{HIGHLIGHT TRANSPARENT}패"); // 8400E4F
const u8 BattleText_Tie[] = _("{HIGHLIGHT TRANSPARENT}무승부"); // 8400E57
const u8 BattleText_Format10[] = _("{K_EUNNEUN}");
const u8 BattleText_Format11[] = _("의");
const u8 BattleText_Normal[] = _("노말 기술");
const u8 BattleText_Fighting[] = _("격투 기술");
const u8 BattleText_Flying[] = _("비행 기술");
const u8 BattleText_Poison[] = _("독 기술");
const u8 BattleText_Ground[] = _("땅 기술");
const u8 BattleText_Rock[] = _("바위 기술");
const u8 BattleText_Bug[] = _("벌레 기술");
const u8 BattleText_Ghost[] = _("고스트 기술");
const u8 BattleText_Steel[] = _("강철 기술");
const u8 BattleText_Typeless[] = _("??? 기술");
const u8 BattleText_Fire[] = _("불꽃 기술");
const u8 BattleText_Water[] = _("물 기술");
const u8 BattleText_Grass[] = _("풀 기술");
const u8 BattleText_Electric[] = _("전기 기술");
const u8 BattleText_Psychic[] = _("에스퍼 기술");
const u8 BattleText_Ice[] = _("얼음 기술");
const u8 BattleText_Dragon[] = _("드래곤 기술");
const u8 BattleText_Dark[] = _("악 기술");

const u8 *const gUnknown_08400F58[] =
{
    BattleStatText_HP,
    BattleStatText_Attack,
    BattleStatText_Defense,
    BattleStatText_Speed,
    BattleStatText_SpAtk,
    BattleStatText_SpDef,
    BattleStatText_Accuracy,
    BattleStatText_Evasion,
};

const u8 *const gUnknown_08400F78[] =
{
    ContestStatText_TooSpicy,
    ContestStatText_TooDry,
    ContestStatText_TooSweet,
    ContestStatText_TooBitter,
    ContestStatText_TooSour,
};

const u8 *const gBattleStringsTable[] =
{
    BattleText_UnknownString,
    BattleText_GainExpPoints,
    BattleText_GrewLevel,
    BattleText_LearnedMove,
    BattleText_TryingToLearnMove,
    BattleText_CantLearnMore,
    BattleText_DeleteMove,
    BattleText_DeletedMove,
    BattleText_StopLearning,
    BattleText_DidNotLearn,
    BattleText_LearnedMove2,
    BattleText_AttackMissed,
    BattleText_ProtectedItself,
    BattleText_StatNoHigher,
    BattleText_AvoidedDamage,
    BattleText_DoesntAffect,
    BattleText_AttackingFainted,
    BattleText_DefendingFainted,
    BattleText_WinningPrize,
    BattleText_OutOfUsablePoke,
    BattleText_WhitedOut,
    BattleText_PreventEscape,
    BattleText_HitMulti,
    BattleText_FellAsleep,
    BattleText_MadeAsleep,
    BattleText_DefendingAsleep,
    BattleText_AttackingAsleep,
    BattleText_WasntAffected,
    BattleText_Poisoned,
    BattleText_Poisoned2,
    BattleText_PoisonHurt,
    BattleText_AlreadyPoisoned,
    BattleText_BadlyPoisoned,
    BattleText_EnergyDrained,
    BattleText_Burned,
    BattleText_Burned2,
    BattleText_BurnHurt,
    BattleText_Frozen,
    BattleText_Frozen2,
    BattleText_FrozenSolid,
    BattleText_DefendingDefrosted,
    BattleText_AttackingDefrosted,
    BattleText_Defrosted,
    BattleText_Paralyzed,
    BattleText_Paralyzed2,
    BattleText_Paralyzed3,
    BattleText_AlreadyParalyzed,
    BattleText_ParalysisHealed,
    BattleText_DreamEaten,
    BattleText_AttackingStatNoHigher,
    BattleText_DefendingStatNoHigher,
    BattleText_StoppedWorking,
    BattleText_StoppedWorking2,
    BattleText_Confused,
    BattleText_ConfusionSnapOut,
    BattleText_BecameConfused,
    BattleText_AlreadyConfused,
    BattleText_FellLove,
    BattleText_InLoveWith,
    BattleText_ImmobilizedBy,
    BattleText_BlownAway,
    BattleText_TypeTransform,
    BattleText_Flinched,
    BattleText_RegainedHealth,
    BattleText_HPFull,
    BattleText_RaisedSpDef,
    BattleText_RaisedDefense,
    BattleText_CoveredVeil,
    BattleText_SafeguardActive,
    BattleText_SafeguardFaded,
    BattleText_WentToSleep,
    BattleText_SpeltHealthy,
    BattleText_WhipWhirlwind,
    BattleText_TookSunlight,
    BattleText_LoweredHead,
    BattleText_IsGlowing,
    BattleText_FlewHigh,
    BattleText_DugHole,
    BattleText_SqueezedBind,
    BattleText_TrappedVortex,
    BattleText_Wrapped,
    BattleText_Clamped,
    BattleText_HurtBy,
    BattleText_FreedFrom,
    BattleText_KeptGoingCrash,
    BattleText_MistShroud,
    BattleText_MistProtect,
    BattleText_GetPumped,
    BattleText_HitRecoil,
    BattleText_ProtectedItself2,
    BattleText_SandBuffeted,
    BattleText_HailStricken,
    BattleText_WasSeeded,
    BattleText_EvadedAttack,
    BattleText_HealthSapped,
    BattleText_FastAsleep,
    BattleText_WokeUp,
    BattleText_UproarAwake,
    BattleText_UproarWoke,
    BattleText_UproarCaused,
    BattleText_UproarMaking,
    BattleText_CalmedDown,
    BattleText_UproarCantSleep,
    BattleText_Stockpiled,
    BattleText_StockpiledCant,
    BattleText_UproarCantSleep2,
    BattleText_UproarKeptAwake,
    BattleText_StayedAwake,
    BattleText_StoringEnergy,
    BattleText_UnleashedEnergy,
    BattleText_FatigueConfuse,
    BattleText_PickedUpYen,
    BattleText_Unaffected,
    BattleText_Transformed,
    BattleText_SubMade,
    BattleText_SubAlready,
    BattleText_SubTookDamage,
    BattleText_SubFaded,
    BattleText_MustRecharge,
    BattleText_RageBuilding,
    BattleText_MoveWasDisabled,
    BattleText_MoveIsDisabled,
    BattleText_DisabledNoMore,
    BattleText_EncoreGot,
    BattleText_EncoreEnded,
    BattleText_TookAim,
    BattleText_SketchedMove,
    BattleText_DestinyBondTake,
    BattleText_DestinyBondTaken,
    BattleText_ReducedBy,
    BattleText_StoleSomething,
    BattleText_CantEscapeNow,
    BattleText_NightmareStart,
    BattleText_NightmareLock,
    BattleText_CurseLay,
    BattleText_CurseAfflict,
    BattleText_SpikesScattered,
    BattleText_SpikesHurt,
    BattleText_IdentifiedPoke,
    BattleText_PerishSongFell,
    BattleText_BracedItself,
    BattleText_EnduredHit,
    BattleText_MagnitudeCount,
    BattleText_CutHPMaxATK,
    BattleText_CopyStatChanges,
    BattleText_GotFreeFrom,
    BattleText_LeechShed,
    BattleText_SpikesBlownAway,
    BattleText_FledBattle,
    BattleText_ForesawAttack,
    BattleText_TookAttack,
    BattleText_PokeAttack,
    BattleText_CenterAttention,
    BattleText_ChargingPower,
    BattleText_NaturePower,
    BattleText_StatusNormal,
    BattleText_NoMovesLeft,
    BattleText_TormentSubject,
    BattleText_TormentNoUse,
    BattleText_TightenFocus,
    BattleText_TauntFell,
    BattleText_TauntNoUse,
    BattleText_ReadyToHelp,
    BattleText_SwitchedItems,
    BattleText_CopiedObject,
    BattleText_WishMade,
    BattleText_WishTrue,
    BattleText_PlantedRoots,
    BattleText_AbsorbNutrients,
    BattleText_AnchoredItself,
    BattleText_DrowsyMade,
    BattleText_KnockedOffItem,
    BattleText_AbilitySwap,
    BattleText_SealedMove,
    BattleText_SealedNoUse,
    BattleText_GrudgeBear,
    BattleText_GrudgeLosePP,
    BattleText_ShroudedItself,
    BattleText_MagicCoatBounce,
    BattleText_AwaitMove,
    BattleText_SnatchedMove,
    BattleText_RainMade,
    BattleText_SpeedRisen,
    BattleText_ProtectedBy,
    BattleText_PreventedBy,
    BattleText_HPRestoredUsing,
    BattleText_MadeType,
    BattleText_PreventedPara,
    BattleText_PreventedRomance,
    BattleText_PreventedPoison,
    BattleText_PreventedConfusion,
    BattleText_RaisedFirePower,
    BattleText_AnchorsItself,
    BattleText_CutsAttack,
    BattleText_PreventedStatLoss,
    BattleText_HurtOther,
    BattleText_Traced,
    BattleText_Sharply,
    BattleText_Rose,
    BattleText_Harshly,
    BattleText_Fell,
    BattleText_UnknownString7,
    BattleText_UnknownString3,
    BattleText_UnknownString5,
    BattleText_UnknownString6,
    BattleText_Critical,
    BattleText_GrandSlam,
    BattleText_MoveForget123,
    BattleText_MoveForgetAnd,
    BattleText_NotEffective,
    BattleText_SuperEffective,
    BattleText_GotAwaySafely,
    BattleText_FledWild,
    BattleText_NoRunning,
    BattleText_CantEscape2,
    BattleText_BirchDontLeaveMe,
    BattleText_Nothing,
    BattleText_Failed,
    BattleText_HurtItself,
    BattleText_MirrorFail,
    BattleText_RainStart,
    BattleText_PourStart,
    BattleText_RainCont1,
    BattleText_PourCont,
    BattleText_RainStop,
    BattleText_SandBrewed,
    BattleText_SandRages,
    BattleText_SandSubsided,
    BattleText_SunBright,
    BattleText_SunStrong,
    BattleText_SunFaded,
    BattleText_HailStart,
    BattleText_HailCont,
    BattleText_HailStop,
    BattleText_SpitUpFail,
    BattleText_SwallowFail,
    BattleText_WindHeatWave,
    BattleText_StatElim,
    BattleText_CoinScatter,
    BattleText_SubWeak,
    BattleText_PainSplit,
    BattleText_BellChime,
    BattleText_PerishSong,
    BattleText_NoPP1,
    BattleText_NoPP2,
    BattleText_Used1,
    BattleText_TutorialUsed,
    BattleText_BlockBall,
    BattleText_DontBeAThief,
    BattleText_DodgeBall,
    BattleText_MissPoke,
    BattleText_BallBrokeOhNo,
    BattleText_BallBrokeAppeared,
    BattleText_BallBrokeAlmost,
    BattleText_BallBrokeSoClose,
    BattleText_BallCaught1,
    BattleText_BallCaught2,
    BattleText_GiveNickname,
    BattleText_SentToPC,
    BattleText_AddedToDex,
    BattleText_Raining,
    BattleText_Sandstorm,
    BattleText_CantEscape,
    BattleText_IgnoredOrdersSLP,
    BattleText_IgnoredOrders,
    BattleText_BeganNap,
    BattleText_LoafingAround,
    BattleText_WontObey,
    BattleText_TurnedAway,
    BattleText_NotNotice,
    BattleText_WillSwitch,
    BattleText_CreptCloser,
    BattleText_CantGetCloser,
    BattleText_WatchingCarefully,
    BattleText_CuriousAbout,
    BattleText_EnthralledBy,
    BattleText_IgnoredThing,
    BattleText_ThrewBlock,
    BattleText_SafariOver,
    BattleText_CuredParalysis,
    BattleText_CuredPoison,
    BattleText_CuredBurn,
    BattleText_CuredFreeze,
    BattleText_CuredSleep,
    BattleText_CuredConfusion,
    BattleText_CuredStatus,
    BattleText_RestoredHealth,
    BattleText_RestoredPP,
    BattleText_RestoredStatus,
    BattleText_RestoredHPLittle,
    BattleText_ChoiceBand,
    BattleText_FocusSash,
    BattleText_Terminator2,
    BattleText_PreventedBurn,
    BattleText_BlocksOther,
    BattleText_RestoredHPByItem,
    BattleText_WhipSandstorm,
    BattleText_PreventedLoss,
    BattleText_InfatuatedPoke,
    BattleText_MadeIneffective,
    BattleText_CuredProblem,
    BattleText_OozeSuckup,
    BattleText_Transformed2,
    BattleText_ElecWeakened,
    BattleText_FireWeakened,
    BattleText_HidUnderwater,
    BattleText_SprangUp,
    BattleText_CantForgetHM,
    BattleText_FoundOne,
    BattleText_PlayerDefeatedTrainer2,
    BattleText_SoothingAroma,
    BattleText_CantUseItems,
    BattleText_UnknownString2,
    BattleText_UnknownString4,
    BattleText_HustleUse,
    BattleText_MadeUseless,
    BattleText_SandTombTrapped,
    BattleText_Terminator,
    BattleText_BoostedExp,
    BattleText_SunIntensified,
    BattleText_GroundMoveNegate,
    BattleText_WallyBall,
    BattleText_TookAttack2,
    BattleText_ChoseDestiny,
    BattleText_LostFocus,
    BattleText_UseNext,
    BattleText_FledUsingItem,
    BattleText_FledUsingOther,
    BattleText_DraggedOut,
    BattleText_PreventedOther,
    BattleText_NormalizedStatus,
    BattleText_Used2,
    BattleText_BoxFull,
    BattleText_AvoidedAttack,
    BattleText_MadeIneffective2,
    BattleText_PreventedFlinching,
    BattleText_AlreadyBurned,
    BattleText_StatNoLower,
    BattleText_BlocksOther2,
    BattleText_WoreOff,
    BattleText_RaisedDefenseLittle,
    BattleText_RaisedSpDefLittle,
    BattleText_BrokeWall,
    BattleText_PreventedOther2,
    BattleText_CuredOfProblem,
    BattleText_AttackingCantEscape,
    BattleText_Obtained1,
    BattleText_Obtained2,
    BattleText_Obtained3,
    BattleText_NoEffect,
    BattleText_NoEffectOn,
};

// below are lists of battle string enums and NOT pointers to the strings.
const u16 gMissStrings[] =
{
    BATTLE_TEXT_AttackMissed,
    BATTLE_TEXT_ProtectedItself,
    BATTLE_TEXT_AvoidedAttack,
    BATTLE_TEXT_AvoidedDamage,
    BATTLE_TEXT_GroundMoveNegate,
};

const u16 BattleTextList_401512[] =
{
    BATTLE_TEXT_CantEscape2,
    BATTLE_TEXT_BirchDontLeaveMe,
    BATTLE_TEXT_PreventEscape,
    BATTLE_TEXT_CantEscape,
    BATTLE_TEXT_AttackingCantEscape,
};

const u16 BattleTextList_40151C[] =
{
    BATTLE_TEXT_RainStart,
    BATTLE_TEXT_PourStart,
    BATTLE_TEXT_Failed,
    BATTLE_TEXT_SandBrewed,
    BATTLE_TEXT_SunBright,
    BATTLE_TEXT_HailStart,
};

const u16 BattleTextList_401528[] =
{
    BATTLE_TEXT_SandRages,
    BATTLE_TEXT_HailCont,
};

const u16 BattleTextList_40152C[] =
{
    BATTLE_TEXT_SandBuffeted,
    BATTLE_TEXT_HailStricken,
};

const u16 BattleTextList_401530[] =
{
    BATTLE_TEXT_SandSubsided,
    BATTLE_TEXT_HailStop,
};

const u16 BattleTextList_401534[] =
{
    BATTLE_TEXT_RainCont1,
    BATTLE_TEXT_PourCont,
    BATTLE_TEXT_RainStop,
};

const u16 BattleTextList_40153A[] =
{
    BATTLE_TEXT_ProtectedItself2,
    BATTLE_TEXT_BracedItself,
    BATTLE_TEXT_Failed,
};

const u16 BattleTextList_401540[] =
{
    BATTLE_TEXT_Failed,
    BATTLE_TEXT_RaisedDefense,
    BATTLE_TEXT_RaisedDefenseLittle,
    BATTLE_TEXT_RaisedSpDef,
    BATTLE_TEXT_RaisedSpDefLittle,
    BATTLE_TEXT_CoveredVeil,
};

const u16 BattleTextList_40154C[] =
{
    BATTLE_TEXT_WasSeeded,
    BATTLE_TEXT_EvadedAttack,
    BATTLE_TEXT_DoesntAffect,
    BATTLE_TEXT_HealthSapped,
    BATTLE_TEXT_OozeSuckup,
};

const u16 BattleTextList_401556[] =
{
    BATTLE_TEXT_WentToSleep,
    BATTLE_TEXT_SpeltHealthy,
};

const u16 BattleTextList_40155A[] =
{
    BATTLE_TEXT_UproarMaking,
    BATTLE_TEXT_CalmedDown,
};

const u16 BattleTextList_40155E[] =
{
    BATTLE_TEXT_Stockpiled,
    BATTLE_TEXT_StockpiledCant,
};

const u16 BattleTextList_401562[] =
{
    BATTLE_TEXT_WokeUp,
    BATTLE_TEXT_UproarWoke,
};

const u16 BattleTextList_401566[] =
{
    BATTLE_TEXT_SwallowFail,
    BATTLE_TEXT_HPFull,
};

const u16 BattleTextList_40156A[] =
{
    BATTLE_TEXT_UproarCantSleep2,
    BATTLE_TEXT_UproarKeptAwake,
    BATTLE_TEXT_StayedAwake,
};

const u16 BattleTextList_401570[] =
{
    BATTLE_TEXT_UnknownString7,
    BATTLE_TEXT_UnknownString3,
    BATTLE_TEXT_AttackingStatNoHigher,
    BATTLE_TEXT_Terminator2,
    BATTLE_TEXT_UnknownString4,
    BATTLE_TEXT_HustleUse,
};

const u16 BattleTextList_40157C[] =
{
    BATTLE_TEXT_UnknownString5,
    BATTLE_TEXT_UnknownString6,
    BATTLE_TEXT_DefendingStatNoHigher,
    BATTLE_TEXT_Terminator2,
};

const u16 BattleTextList_401584[] =
{
    BATTLE_TEXT_WhipWhirlwind,
    BATTLE_TEXT_TookSunlight,
    BATTLE_TEXT_LoweredHead,
    BATTLE_TEXT_IsGlowing,
    BATTLE_TEXT_FlewHigh,
    BATTLE_TEXT_DugHole,
    BATTLE_TEXT_HidUnderwater,
    BATTLE_TEXT_SprangUp,
};

const u16 BattleTextList_401594[] =
{
    BATTLE_TEXT_SqueezedBind, 
    BATTLE_TEXT_Wrapped, 
    BATTLE_TEXT_TrappedVortex, 
    BATTLE_TEXT_Clamped, 
    BATTLE_TEXT_TrappedVortex, 
    BATTLE_TEXT_SandTombTrapped, 
};

const u16 BattleTextList_4015A0[] =
{
    BATTLE_TEXT_MistShroud,
    BATTLE_TEXT_Failed,
};

const u16 BattleTextList_4015A4[] =
{
    BATTLE_TEXT_GetPumped,
    BATTLE_TEXT_Failed,
};

const u16 BattleTextList_4015A8[] =
{
    BATTLE_TEXT_Transformed,
    BATTLE_TEXT_Failed,
};

const u16 BattleTextList_4015AC[] =
{
    BATTLE_TEXT_SubMade,
    BATTLE_TEXT_SubWeak,
};

const u16 BattleTextList_4015B0[] =
{
    BATTLE_TEXT_Poisoned,
    BATTLE_TEXT_Poisoned2,
};

const u16 BattleTextList_4015B4[] =
{
    BATTLE_TEXT_Paralyzed,
    BATTLE_TEXT_Paralyzed2,
};

const u16 BattleTextList_4015B8[] =
{
    BATTLE_TEXT_FellAsleep,
    BATTLE_TEXT_MadeAsleep,
};

const u16 BattleTextList_4015BC[] =
{
    BATTLE_TEXT_Burned,
    BATTLE_TEXT_Burned2,
};

const u16 BattleTextList_4015C0[] =
{
    BATTLE_TEXT_Frozen,
    BATTLE_TEXT_Frozen2,
};

const u16 BattleTextList_4015C4[] =
{
    BATTLE_TEXT_AttackingDefrosted,
    BATTLE_TEXT_Defrosted,
};

const u16 BattleTextList_4015C8[] =
{
    BATTLE_TEXT_AttackMissed,
    BATTLE_TEXT_Unaffected,
    BATTLE_TEXT_FellLove,
    BATTLE_TEXT_InfatuatedPoke,
};

const u16 BattleTextList_4015D0[] =
{
    BATTLE_TEXT_EnergyDrained,
    BATTLE_TEXT_OozeSuckup,
};

const u16 BattleTextList_4015D4[] =
{
    BATTLE_TEXT_ElecWeakened,
    BATTLE_TEXT_FireWeakened,
};

const u16 BattleTextList_4015D8[] =
{
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_BellChime,
    BATTLE_TEXT_SoothingAroma,
};

const u16 BattleTextList_4015E2[] =
{
    BATTLE_TEXT_ForesawAttack,
    BATTLE_TEXT_ChoseDestiny,
};

const u16 BattleTextList_4015E6[] =
{
    BATTLE_TEXT_BallBrokeOhNo,
    BATTLE_TEXT_BallBrokeAppeared,
    BATTLE_TEXT_BallBrokeAlmost,
    BATTLE_TEXT_BallBrokeSoClose,
};

const u16 BattleTextList_4015EE[] =
{
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Sandstorm,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_SunStrong,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
    BATTLE_TEXT_Raining,
};

const u16 BattleTextList_40160E[] =
{
    BATTLE_TEXT_LoafingAround, 
    BATTLE_TEXT_WontObey, 
    BATTLE_TEXT_TurnedAway, 
    BATTLE_TEXT_NotNotice, 
};

const u16 BattleTextList_401616[] =
{
    BATTLE_TEXT_CreptCloser,
    BATTLE_TEXT_CantGetCloser,
};

const u16 BattleTextList_40161A[] =
{
    BATTLE_TEXT_CuriousAbout,
    BATTLE_TEXT_EnthralledBy,
    BATTLE_TEXT_IgnoredThing,
};

const u16 BattleTextList_401620[] =
{
    BATTLE_TEXT_CuredConfusion,
    BATTLE_TEXT_CuredParalysis,
    BATTLE_TEXT_CuredFreeze,
    BATTLE_TEXT_CuredBurn,
    BATTLE_TEXT_CuredPoison,
    BATTLE_TEXT_CuredSleep,
};

const u16 BattleTextList_40162C[] =
{
    BATTLE_TEXT_CuredStatus,
    BATTLE_TEXT_NormalizedStatus,
};

const u16 BattleTextList_401630[] =
{
    BATTLE_TEXT_PreventedBurn,
    BATTLE_TEXT_PreventedOther2,
    BATTLE_TEXT_NoEffectOn,
};

const u16 BattleTextList_401636[] =
{
    BATTLE_TEXT_PreventedPara,
    BATTLE_TEXT_PreventedOther2,
    BATTLE_TEXT_NoEffectOn,
};

const u16 BattleTextList_40163C[] =
{
    BATTLE_TEXT_PreventedPoison,
    BATTLE_TEXT_PreventedOther2,
    BATTLE_TEXT_NoEffectOn,
};

const u16 BattleTextList_401642[] =
{
    BATTLE_TEXT_Obtained1,
    BATTLE_TEXT_Obtained2,
    BATTLE_TEXT_Obtained3,
};

const u16 BattleTextList_401648[] =
{
    BATTLE_TEXT_RaisedFirePower,
    BATTLE_TEXT_MadeIneffective,
};

const u16 gTrappingMoves[] =
{
    MOVE_BIND,
    MOVE_WRAP,
    MOVE_FIRE_SPIN,
    MOVE_CLAMP,
    MOVE_WHIRLPOOL,
    MOVE_SAND_TOMB,
    0xFFFF,
};

const u8 *const gUnknown_0840165C[] =
{
    BattleText_HP,
    BattleText_SpAtk,
    BattleText_Attack,
    BattleText_SpDef,
    BattleText_Defense,
    BattleStatText_Speed,
};

const u8 *const gUnknown_08401674[] =
{
    BattleText_Normal,
    BattleText_Fighting,
    BattleText_Flying,
    BattleText_Poison,
    BattleText_Ground,
    BattleText_Rock,
    BattleText_Bug,
    BattleText_Ghost,
    BattleText_Steel,
    BattleText_Typeless,
    BattleText_Fire,
    BattleText_Water,
    BattleText_Grass,
    BattleText_Electric,
    BattleText_Psychic,
    BattleText_Ice,
    BattleText_Dragon,
    BattleText_Dark,
};
