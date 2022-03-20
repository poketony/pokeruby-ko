	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

gOtherText_BerryObtainedDadHasIt:: @ 842F798
	.string "{STR_VAR_2}열매를 손에 넣었다!\n등화체육관에 있는 아빠한테서 받자!$"
	// §うのみを てに いれた!ｎ
	// トウカジムの パパから うけとろう!

gOtherText_BerryTransformed:: @ 842F7CA
	.string "{STR_VAR_1}열매는\n{STR_VAR_2}열매로 변화했다!$"
	// §いのみはｎ
	// §うのみに へんかした!

gOtherText_BerryAlreadyObtained:: @ 842F7F6
	.string "{STR_VAR_1}열매는 이미\n들어 있었다$"
	// §いのみは すでにｎ
	// はいっていた

gOtherText_SpecialRibbonReceived:: @ 842F81E
	.string "지닌 포켓몬에게\n특별한 리본을 달아줬다!$"
	// てもちのポケモンにｎ
	// とくべつなリボンが あたえられた!

gOtherText_DexUpgraded:: @ 842F852
	.string "도감에 전국 모드가\n추가되었다!$"
	// ずかんに ぜんこくモ-ドがｎ
	// ついか された!

gOtherText_RareWordAdded:: @ 842F888
	.string "희귀한 말을 추가했습니다$"
	// めずらしい ことばを ついかしました

gOtherText_PokeWasSentOver:: @ 842F8A4
	.string "{STR_VAR_1}{K_IGA} 전송됐다!$"
	// §いが おくられてきた!

gOtherText_PartyIsFull:: @ 842F8B6
	.string "지닌 포켓몬이 가득해서\n{STR_VAR_1}{K_EULREUL} 받을 수 없다...$"
	// てもちが いっぱいなのでｎ
	// §いは もらえなかった…

gOtherText_NewTrainerInHoenn:: @ 842F8E5
	.string "새로운 트레이너가\n호연지방에 찾아왔다$"
	.string "배틀타워에 새로운\n대전자가 나타났다!$"
	// あらたな トレ-ナ-がｎホウエンに やってきた
	// バトルタワ-に あらたなｎたいせんしゃが あらわれた!

gOtherText_DataCannotUseVersion:: @ 842F93A
	.string "이 데이터는 이 버전에서\n사용할 수 없습니다$"
