	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	@ unused
gOtherText_TopSpeed::
	.string "최고 속도$"

gMultiText_BerryBlenderMaxSpeedRecord:: @ 842C2E6
	.string "나무열매블렌더\n최고 속도 랭킹!$"

gMultiText_2P3P4P:: @ 842C30A
	.string "2명\n3명\n4명$"

gMultiText_Saving:: @ 842C328
	.string "통신 대기 중!\n잠시 기다려 주십시오$"

gMultiText_LinkError:: @ 842C34C
	.string "{HIGHLIGHT TRANSPARENT}{COLOR WHITE2}통신 에러가 발생했습니다\n통신케이블의 연결을 확인하고\n전원을 껐다가 다시 켜 주십시오$"

gSystemText_OptionMenu:: @ 842C3A6
	.string "{PALETTE 9}설정을 바꾼다$"

gSystemText_TextSpeed:: @ 842C3B0
	.string "{PALETTE 9}이야기의 속도$"

gSystemText_BattleScene:: @ 842C3BE
	.string "{PALETTE 9}배틀 애니메이션$"

gSystemText_BattleStyle:: @ 842C3CE
	.string "{PALETTE 9}시합 룰$"

gSystemText_Sound:: @ 842C3DE
	.string "{PALETTE 9}사운드$"

gSystemText_Frame:: @ 842C3E7
	.string "{PALETTE 9}윈도우$"

gSystemText_Cancel:: @ 842C3F0
	.string "{PALETTE 9}닫는다$"

gSystemText_ButtonMode:: @ 842C3FA
	.string "{PALETTE 9}버튼 모드$"

gSystemText_Slow:: @ 842C409
	.string "{PALETTE 15}느리게$"

gSystemText_Mid:: @ 842C411
	.string "{PALETTE 15}보통$"

gSystemText_Fast:: @ 842C418
	.string "{PALETTE 15}빠르게$"

gSystemText_On:: @ 842C420
	.string "{PALETTE 15}본다$"

gSystemText_Off:: @ 842C426
	.string "{PALETTE 15}보지 않는다$"

gSystemText_Shift:: @ 842C42D
	.string "{PALETTE 15}교체$"

gSystemText_Set:: @ 842C436
	.string "{PALETTE 15}토너먼트$"

gSystemText_Mono:: @ 842C43D
	.string "{PALETTE 15}모노$"

gSystemText_Stereo:: @ 842C445
	.string "{PALETTE 15}스테레오$"

gSystemText_Type:: @ 842C44F
	.string "{PALETTE 13}{HIGHLIGHT 15}{COLOR 1}{SHADOW 10}타입$"

gSystemText_Terminator:: @ 842C457
	.string "{PALETTE 8}$"

gSystemText_Normal:: @ 842C45B
	.string "{PALETTE 15}노말$"

gSystemText_LR:: @ 842C465
	.string "{PALETTE 15}LR$"

gSystemText_LA:: @ 842C46B
	.string "{PALETTE 15}L=A$"

SystemText_Pokedex::
	.string "도감$"
SystemText_Pokemon::
	.string "포켓몬$"
SystemText_BAG::
	.string "가방$"
SystemText_Pokenav::
	.string "포켓내비$"
SystemText_Player::
	.string "{PLAYER}$"
SystemText_Save::
	.string "리포트$"
SystemText_Option::
	.string "설정$"
SystemText_Exit::
	.string "닫는다$"
SystemText_Retire:: @ safari zone?
	.string "포기한다$"

gOtherText_SafariStock:: @ 842C4A9
	.string "사파리볼\n{STR_VAR_1}개 남음$"

gSystemText_LinkStandby:: @ 842C4C0
	.string "통신 대기 중입니다\n...B 버튼으로 취소합니다$"

gSystemText_LoadEventPressA:: @ 842C4E9
	.string "A 버튼으로 사건을 읽어들입니다\n...B 버튼으로 취소합니다$"

gSystemText_LoadingEvent:: @ 842C524
	.string "사건을 읽어들이는 중!!$"

gSystemText_DontCutLink:: @ 842C535
	.string "통신케이블을 뽑지 말아 주십시오\n전원을 끄지 않도록 해주십시오$"

gSystemText_EventLoadSuccess:: @ 842C571
	.string "사건의 로딩이\n정상적으로 종료되었습니다$$"

gSystemText_LoadingError:: @ 842C58F
	.string "에러가 발생했습니다\n종료합니다$$$$$$$$"

gOtherText_Hoenn:: @ 842C5B5
	.string "호연지방$"

gOtherText_OhABite:: @ 842C5BB
	.string "걸렸다 걸렸다!!$"
gOtherText_PokeOnHook:: @ 842C5C7
	.string "포켓몬을 낚았다!{PAUSE_UNTIL_PRESS}$"

gOtherText_NotEvenANibble:: @ 842C5E2
	.string "잡히지 않네...{PAUSE_UNTIL_PRESS}$"

gOtherText_ItGotAway:: @ 842C5F9
	.string "도망가버렸다...{PAUSE_UNTIL_PRESS}$$"

gTradeText_WillBeSent:: @ 842C60B
	.string "{STR_VAR_2}{K_EULREUL} {STR_VAR_1}에게 보냅니다!$"

gTradeText_ByeBye:: @ 842C622
	.string "바이바이! {STR_VAR_2}!$"

gTradeText_SentOverPoke:: @ 842C62F
	.string "{STR_VAR_1}{K_EU}로부터 {STR_VAR_3}{K_IGA} 전송됐다!$"

gTradeText_TakeGoodCare:: @ 842C640
	.string "{STR_VAR_3}{K_EULREUL} 귀여워해 줘!$"

TradeText_Cancel:: @ JP: 1E0094
	.string "취소$"
TradeText_ChoosePoke::
	.string "포켓몬을 선택해 주십시오$"
TradeText_Summary1::
	.string "능력치를 본다$"
TradeText_Trade1::
	.string "교환한다$"
TradeText_CancelTradePrompt::
	.string "교환을 그만두겠습니까?$"
TradeText_PressBToExit::
	.string "B 버튼으로 돌아갑니다$"
TradeText_Summary2::
	.string "능력치를 본다$"
TradeText_Trade2::
	.string "교환한다$"
TradeText_LinkStandby::
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}통신 대기 중!\n잠시 기다려 주십시오$"
TradeText_TradeCancelled::
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}교환이\n취소되었습니다$"
TradeText_OnlyPoke::
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}그 포켓몬을 교환하면\n싸울 수 없게 돼!$"
TradeText_NonTradablePoke::
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}이걸로 교환하면 상대가\n싸울 수 없게 돼!$"
TradeText_WaitingForFriend::
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}친구가 종료하기를\n기다리고 있습니다...$"
TradeText_WantToTrade::
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}친구는 포켓몬을\n교환하고 싶어하는 것 같습니다!$"
	.string "$"

gTradeText_TradeOkayPrompt:: @ 842C7B6
	.string "{K_WAGWA} {K_EULREUL} 교환하겠습니까?$"

gOtherText_Terminator2:: @ 842C7CA
	.string "$"

gOtherText_ControlAndMiscText:: @ 842C7CB
	.string "\n$"
	.string "/$"
	.string "Lv$"
	.string "---$"

gOtherText_FourQuestions:: @ 842C7D6
	.string "????$"

@ 842C7DB
	.include "data/text/easy_chat/group_name_strings.inc"

gOtherText_ThreeQuestions:: @ 842C890
	.string "???$"

gOtherText_From:: @ 842C894
	.string "{K_EU}로부터$" @ 원래는 From {NAME} 형태인데 {NAME}{K_EU}로부터 식으로 출력되면 좋겠습니다. 확인 후 수정 부탁드립니다

gOtherText_MixingRecordsWithFriend:: @ 842C89A
	.string "레코드를 섞고 있습니다$"

gOtherText_MixingComplete:: @ 842C8AC
	.string "레코드 통신이 끝났습니다!\n수고하셨습니다$"

gOtherText_TrainersTrainerCard:: @ 842C8DC
	.string "의 트레이너카드$"

gOtherText_FirstHOF:: @ 842C8EC
	.string "첫 전당등록$"

gOtherText_LinkCableBattles:: @ 842C8FF
	.string "통신케이블 대전 승      패$"

gOtherText_BattleTowerWinRecord:: @ 842C924
	.string "배틀타워 승      연승$"

gOtherText_ContestRecord:: @ 842C943
	.string "친구와 콘테스트 우승$"

gOtherText_MixingRecord:: @ 842C959
	.string "친구와 만든 포켓몬스넥      개$"

gOtherText_TradeRecord:: @ 842C96A
	.string "포켓몬 교환$"

gOtherText_Boy:: @ 842C979
	.string "남자$"

gOtherText_Girl:: @ 842C97D
	.string "여자$"
	.string "$"

gOtherText_Player:: @ 842C983
	.string "주인공$"

gOtherText_Badges:: @ 842C98A
	.string "가진 배지$"
	.string "$"

gOtherText_Pokedex:: @ 842C992
	.string "포켓몬 도감$"

gOtherText_PlayTime:: @ 842C99A
	.string "플레이 시간$"

gOtherText_SentToPC:: @ 842C9A4
	.string "{STR_VAR_1}{K_EUNNEUN}\nPC로 전송되었다!{PAUSE_UNTIL_PRESS}$"

OtherText_YourName::
	.string "당신의 이름은?$"
OtherText_BoxName::
	.string "박스의 이름은?$"
OtherText_PokeName::
	.string "{STR_VAR_1}의 이름은?$"

gOtherText_Marco:: @ 842C9E1
	.string "하성$"

gOtherText_Coins:: @ 842C9E7
	.string "{STR_VAR_1}개$"

gOtherText_BattleResults:: @ 842C9F0
	.string "{PLAYER}의 대전 성적$"

gOtherText_WinRecord:: @ 842CA04
	.string "{STR_VAR_1}승      {STR_VAR_2}패      {STR_VAR_3}무$"

gOtherText_WinLoseDraw:: @ 842CA20
	.string "승리      패배      무승부$"

gOtherText_SevenDashes:: @ 842CA3C
	.string "-------$"

gOtherText_FourDashes:: @ 842CA44
	.string "----$"

gOtherText_BattleTowerResults:: @ 842CA49
	.string "{PLAYER}의 배틀타워 성적$"

gOtherText_Lv50:: @ 842CA63
	.string "레벨50$"

gOtherText_Lv100:: @ 842CA69
	.string "레벨100$"

gOtherText_WinStreak:: @ 842CA70
	.string "{STR_VAR_1}연승$"

gOtherText_Current:: @ 842CA7B
	.string "현재$"

gOtherText_Record:: @ 842CA83
	.string "최고$"

gOtherText_Prev:: @ 842CA8A
	.string "지난번$"

gOtherText_QuitGamePrompt:: @ 842CA90
	.string "게임을 그만두겠습니까?$"

gOtherText_MaxCoins:: @ 842CA9F
	.string "동전이 9999개\n담겨 있습니다$"

gOtherText_OutOfCoins:: @ 842CAB7
	.string "동전이 없습니다\n게임을 종료합니다$"

gOtherText_DontHaveThreeCoins:: @ 842CADB
	.string "동전 3개가 없습니다!$"

gOtherText_ReelTime:: @ 842CAF7
	.string "   BD 타임\n   차분히 노리면 어느 마크든\n   멈출 수 있는 찬스 게임!\n   물론 뽑은 횟수만큼\n   BD 타임을 즐길 수 있어!\n   빅 보너스가 나오면 종료$"

DaycareText_GetAlongVeryWell::
	.string "2마리는 사이가\n아주 좋은 것 같구먼!$"
DaycareText_GetAlong::
	.string "2마리는 사이가\n그럭저럭인 것 같구먼$"
DaycareText_DontLikeOther::
	.string "2마리의 사이가\n좋진 않지만...$"
DaycareText_PlayOther::
	.string "비록 2마리는 서로\n다른 포켓몬과 놀고 있지만...$"

gOtherText_NewLine2:: @ 842CC28
	.string "\n$"

gOtherText_CancelAndLv:: @ 842CC2A
	.string "취소$"
	.string "Lv$"

gEggNickname:: @ 842CC34
	.string "알$"

gOtherText_HatchedFromEgg:: @ 842CC38
	.string "{COLOR WHITE2}{HIGHLIGHT TRANSPARENT}{SHADOW DARK_GREY}알이 부화해서\n{STR_VAR_1}{K_IGA} 태어났다!$"

gOtherText_NickHatchPrompt:: @ 842CC5A
	.string "{COLOR WHITE2}{HIGHLIGHT TRANSPARENT}{SHADOW DARK_GREY}태어난 {STR_VAR_1}에게\n별명을 지어주겠습니까?$"

OtherText_Battle::
	.string "싸울 기술$"
OtherText_Contest::
	.string "콘테스트 기술$"
OtherText_Type::
	.string "타입/$"
OtherText_PP::
	.string "PP/$"
OtherText_Power::
	.string "위력$"
OtherText_Accuracy::
	.string "명중$"
OtherText_Appeal::
	.string "어필$"
OtherText_Jam::
	.string "방해$"

gOtherText_TeachWhichMove:: @ 842CCC7
	.string "{STR_VAR_1}에게\n어느 기술을 배우게 하겠습니까?$"

gOtherText_TeachSpecificMove:: @ 842CCDF
	.string "{STR_VAR_2}{K_EULREUL}\n배우게 하겠습니까?$"

gOtherText_PokeLearnedMove:: @ 842CCE9
	.string "{STR_VAR_1}{K_EUNNEUN} 새로\n{STR_VAR_2}{K_EULREUL} 배웠다!$"

gOtherText_DeleteOlderMove:: @ 842CCF8
	.string "{STR_VAR_1}{K_EUNNEUN} 새로\n{STR_VAR_2}{K_EULREUL} 배우고 싶다...\p그러나 {STR_VAR_1}{K_EUNNEUN} 기술을 4개\n알고 있어 더 이상 배울 수 없다!\p{STR_VAR_2} 대신\n다른 기술을 잊게 하겠습니까?$"

gOtherText_StopLearningMove:: @ 842CD65
	.string "그럼...{STR_VAR_2}{K_EULREUL}\n배우는 것을 포기하겠습니까?$"

gOtherText_ForgotMove123:: @ 842CD77
	.string "{PAUSE 32}1 {PAUSE 15}2 {PAUSE 15}...{PAUSE 15}...{PAUSE 15}...{PAUSE 15} {PLAY_SE 0x0038}짠!\p$"

gOtherText_ForgotOrDidNotLearnMove:: @ 842CDA3
	.string "{STR_VAR_1}{K_EUNNEUN} {STR_VAR_3}{K_EULREUL}\n깨끗이 잊었다!\p그리고...!\p{STR_VAR_1}{K_EUNNEUN} 새로\n{STR_VAR_2}{K_EULREUL} 배웠다!$"
	.string "{STR_VAR_1}{K_EUNNEUN} {STR_VAR_2}{K_EULREUL}\n결국 배우지 않았다!$"

gOtherText_GiveUpTeachingMove:: @ 842CDDC
	.string "그럼... {STR_VAR_1}{K_EULREUL}\n배우는 것을 포기하겠습니까?$"

gOtherText_WhichMoveToForget:: @ 842CE06
	.string "어느 기술을\n잊게 하겠습니까?\p$"

gSystemText_ClearAllSaveDataPrompt:: @ 842CE27
	.string "모든 저장 데이터를\n정리하겠습니까?$"

gSystemText_ClearingData:: @ 842CE42
	.string "정리하고 있습니다...\n잠시 기다려 주십시오$"

gContestText_AnnounceResults:: @ 842CE60
	.string "결과 발표!$"

gContestText_PreliminaryResults:: @ 842CE78
	.string "1차 심사 결과!$"

gContestText_Round2Results:: @ 842CE91
	.string "2차 심사 결과!$"

gContestText_PokeWon:: @ 842CEA2
	.string "우승! {STR_VAR_1}의 {STR_VAR_2}!$"

gOtherText_LinkStandby:: @ 842CEAF
	.string "통신 대기 중...$"

@ 842CEBF
	.include "data/text/landmarks.inc"

gOtherText_Terminator4:: @ 842D0E6
	.string "$"

gOtherText_Nature:: @ 842D0E7
	.string " 성격 $"

gOtherText_Comma:: @ 842D0F1
	.string "일 때$"

gOtherText_Met:: @ 842D0F3
	.string "에서 만났다$"

gOtherText_Egg2:: @ 842D0FB
	.string "에서 알이 부화했다$"

gOtherText_ObtainedInTrade:: @ 842D103
	.string "교환을 통해서 만났다$"

gOtherText_FatefulEncounter:: @ 842D118
	.string "운명적인 만남을 가졌다$"

gOtherText_Met2:: @ 842D12B
	.string "에서 만났다$"

gOtherText_EggDayCare:: @ 842D133
	.string "키우미집 부부에게서 받은\n이상한 포켓몬알이다$"

gOtherText_EggNicePlace:: @ 842D164
	.string "멋진 장소에서 손에 넣은\n이상하고 또 이상한 포켓몬알이다$"

gOtherText_EggObtainedInTrade:: @ 842D197
	.string "교환을 통해서 받은\n이상한 포켓몬알이다$"

gOtherText_EggHotSprings:: @ 842D1C3
	.string "온천할머니에게서 받은\n이상한 포켓몬알이다$"

gOtherText_LinkStandby2:: @ 842D1EE
	.string "통신 대기 중...$"

gOtherText_YesNoAndPlayer:: @ 842D1FE
	.string "{COLOR DARK_GREY}{HIGHLIGHT WHITE2}{SHADOW LIGHT_GREY}예\n아니오$"
	.string "{HIGHLIGHT TRANSPARENT}플레이어$"
	.string "{HIGHLIGHT TRANSPARENT}$"

gOtherText_HoennDex:: @ 842D21C
	.string "호연$"

gOtherText_NationalDex:: @ 842D222
	.string "전국$"

gOtherText_DiplomaCertificationGameFreak:: @ 842D22B
	.string "{HIGHLIGHT TRANSPARENT}플레이어 {CLEAR 0x10}{COLOR RED}{PLAYER}님\n\n{COLOR DARK_GREY}{STR_VAR_1} 포켓몬 도감을\n훌륭히 완성시킨\n위대한 공적을 기려서\n이에 증명합니다\n\n{CLEAR_TO 0x42}{COLOR RED}GAME FREAK$"
	.string "{COLOR RED}{HIGHLIGHT TRANSPARENT}GAME FREAK$"

gOtherText_PLink:: @ 842D2BC
	.string "{STR_VAR_1}인 접속$"

gOtherText_YesNoTerminating:: @ 842D2C5 
	.string "예\n아니오$"
	.string "종료 중입니다$"

gOtherText_LinkNotFound:: @ 842D2D9
	.string "상대를 찾을 수 없습니다\n다시 한 번 시도해 주십시오\p$"

gOtherText_BlenderChooseBerry:: @ 842D307
	.string "나무열매블렌더를 작동시킵니다\p가방에서 나무열매블렌더에 넣을\n나무열매를 선택해 주십시오\p$"

gOtherText_PokeBlockMade:: @ 842D368
	.string "{K_IGA} 만들어졌다!$"

gOtherText_PressAToStart:: @ 842D373
	.string "A 버튼으로 시작합니다$"

gOtherText_PleaseWait:: @ 842D390
	.string "잠시 기다려 주십시오$"

gOtherText_LinkStandby3:: @ 842D3A5
	.string "통신 대기 중입니다$"

gOtherText_BlendAnotherBerryPrompt:: @ 842D3B5
	.string "한 번 더 나무열매를 섞으시겠습니까?\n$"

gOtherText_OutOfBerries:: @ 842D3DC
	.string "나무열매블렌더에 넣을 나무열매가\n없으므로 더 이상 할 수 없습니다\p$"

gOtherText_CaseIsFull:: @ 842D41A
	.string "포켓몬스넥케이스가\n가득 찬 것 같습니다\p$"

gOtherText_NoBerriesForBlend:: @ 842D434
	.string "{K_EUNNEUN} 나무열매블렌더에\n넣을 나무열매가 없는 것 같습니다$"

gOtherText_OtherCaseIsFull:: @ 842D461
	.string "{K_EUNNEUN} 포켓몬스넥케이스가\n가득 찬 것 같습니다\p$"

gOtherText_ResultsOfBlending:: @ 842D479
	.string "섞은 결과$"
	.string "넣은 열매$"

gOtherText_Berry:: @ 842D498
	.string "열매$"

gOtherText_RequiredTime:: @ 842D49F
	.string "시간$"

gOtherText_Min:: @ 842D4AD
	.string "분$"

gOtherText_Sec:: @ 842D4B2
	.string "초$"

gOtherText_MaxSpeed:: @ 842D4B7
	.string "최고 속도$"

gOtherText_RPM:: @ 842D4C5
	.string "rpm$"
	.string ".$"

gOtherText_Ranking:: @ 842D4CB
	.string "랭킹$"

gOtherText_BlockLevelIs:: @ 842D4D3
	.string "레벨은 $"

gOtherText_BlockFeelIs:: @ 842D4E1
	.string "이고 경도는 $"

gOtherText_Period:: @ 842D4F4
	.string "이다$"

gOtherText_Day:: @ 842D4F6
	.string "날짜$"
	.string ":$"

gOtherText_OK:: @ 842D4FC
	.string "결정$"

gOtherText_CorrectTimePrompt:: @ 842D4FF
	.string "정말 이 시간이 맞습니까?$"
