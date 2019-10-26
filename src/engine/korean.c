#include "global.h"

extern u16 gUnicodeToKorean[];
extern u16 gKoreanToUnicode[];

const u8 JongTable[] =
{
/* 0     */ 0x00,
/* 1   ㄱ*/ 0x01,
/* 2   ㄲ*/ 0x02,
/* 3  #ㄳ*/ 0xFF,
/* 4   ㄴ*/ 0x03,
/* 5  #ㄵ*/ 0xFF,
/* 6  #ㄶ*/ 0xFF,
/* 7   ㄷ*/ 0x04,
/* 8   ㄹ*/ 0x06,
/* 9  #ㄺ*/ 0xFF,
/* 10 #ㄻ*/ 0xFF,
/* 11 #ㄼ*/ 0xFF,
/* 12 #ㄽ*/ 0xFF,
/* 13 #ㄾ*/ 0xFF,
/* 14 #ㄿ*/ 0xFF,
/* 15 #ㅀ*/ 0xFF,
/* 16  ㅁ*/ 0x07,
/* 17  ㅂ*/ 0x08,
/* 18 #ㅄ*/ 0xFF,
/* 19  ㅅ*/ 0x0a,
/* 20  ㅆ*/ 0x0b,
/* 21  ㅇ*/ 0x0c,
/* 22  ㅈ*/ 0x0d,
/* 23  ㅊ*/ 0x0f,
/* 24  ㅋ*/ 0x10,
/* 25  ㅌ*/ 0x11,
/* 26  ㅍ*/ 0x12,
/* 27  ㅎ*/ 0x13,
/* 28    */ 0xFF,
};

u8 isHavingJong(u16 kor)
{
	return gKoreanToUnicode[kor - 0x3700] % 28;
}

u8 getJong(u16 kor)
{
	return JongTable[gKoreanToUnicode[kor - 0x3700] % 28];
}

u8 getJung(u16 kor)
{
	u16 unicode = gKoreanToUnicode[kor - 0x3700];
	
	return ((unicode / 28) % 21) + 0x14;
}

u8 getCho(u16 kor)
{
	u16 unicode = gKoreanToUnicode[kor - 0x3700];
	
	return ((unicode / 28) / 21) + 0x01;
}

//자음이면 0, 모음이면 1
u8 distJamo(u8 ch)
{
	if (ch >= 0x01 && ch <= 0x13)
	{
		return 0;
	} else
	{
		return 1;
	}
}

//한글조합 결과는 완성형 문자체계로 나옴
u16 MakeKorean(u8 cho, u8 jung, u8 jong)
{
	u16 index = (((cho * 21) + jung) * 28) + jong;
	
	return gUnicodeToKorean[index];
}


//자모값 변환
u8 MakeJong(u8 ch)
{
	u8 i;
	
	for (i = 0; i < sizeof(JongTable); i++)
	{
		if (JongTable[i] == ch)
			return i;
	}
	
	//never
	return 0xFF;
}

u8 MakeJung(u8 ch)
{
	return ch - 0x14;
}

u8 MakeCho(u8 ch)
{
	return ch - 1;
}

//이중자음 조합 (리턴값은 테이블표의 값이 아닌 고유종성값임)
u8 DoubleJong(u8 ch, u8 ch2)
{
	switch (ch)
	{
	//ㄱ
	case 0x01:
		//ㅅ
		if (ch2 == 0x0A)
			return 3;
		break;
	//ㄴ
	case 0x03:
		switch (ch2)
		{
		//ㅈ
		case 0x0D:
			return 5;
		//ㅎ
		case 0x13:
			return 6;
		}
		break;
	//ㄹ
	case 0x06:
		switch (ch2)
		{
		//ㄱ
		case 0x01:
			return 9;
		//ㅁ
		case 0x07:
			return 10;
		//ㅂ
		case 0x08:
			return 11;
		//ㅅ
		case 0x0A:
			return 12;
		//ㅌ
		case 0x11:
			return 13;
		//ㅍ
		case 0x12:
			return 14;
		//ㅎ
		case 0x13:
			return 15;
		}
		break;
	//ㅂ
	case 0x08:
		if (ch2 == 0x0A)
			return 18;
		break;
	} //end switch
	
	//조합불가 0
	return 0;
}

//이중모음 조합
u8 DoubleJung(u8 ch, u8 ch2)
{
	switch (ch)
	{
	//ㅗ
	case 0x1C:
		switch (ch2)
		{
		//ㅏ
		case 0x14:
			return 0x1D;
		//ㅐ
		case 0x15:
			return 0x1E;
		//ㅣ
		case 0x28:
			return 0x1F;
		}
		break;

	//ㅜ
	case 0x21:
		switch (ch2)
		{
		//ㅓ
		case 0x18:
			return 0x22;
		//ㅔ
		case 0x19:
			return 0x23;
		//ㅣ
		case 0x28:
			return 0x24;
		}
		break;

	//ㅡ
	case 0x26:
		//ㅣ
		if (ch2 == 0x28)
			return 0x27;
		break;
	}

	//조합불가일 경우 0
	return 0;
}

//이중종성 분리 (dir 0 - ㄶ을 ㄴ으로 dir 1 - ㄶ을 ㅎ으로)
//리턴값은 고유종성값
u8 SplitJong(u8 ch, u8 dir)
{
	if (dir == 0)
	{
		if (ch == 3)
		{
			return 1;
		} else if (ch >= 5 && ch <= 6)
		{
			return 4;
		} else if (ch >= 9 && ch <= 15)
		{
			return 8;
		} else if (ch == 18)
		{
			return 17;
		}
	} else
	{
		switch (ch)
		{
		//ㄳ
		case 3:
			return 19;
		//ㄵ
		case 5:
			return 22;
		//ㄶ
		case 6:
			return 27;
		//ㄺ
		case 9:
			return 1;
		//ㄻ
		case 10:
			return 16;
		//ㄼ
		case 11:
			return 17;
		//ㄽ
		case 12:
			return 19;
		//ㄾ
		case 13:
			return 25;
		//ㄿ
		case 14:
			return 26;
		//ㅀ
		case 15:
			return 27;
		//ㅄ
		case 18:
			return 19;
		}
	}
	
	return 0;
}

//종성값을 초성값으로
u8 JongToCho(u8 ch)
{
	return JongTable[ch];
}
