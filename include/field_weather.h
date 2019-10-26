#ifndef GUARD_WEATHER_H
#define GUARD_WEATHER_H

void sub_807C828(void);
void DoWeatherEffect(u8 effect);
void sub_807C988(u8 effect);
void sub_807C9B4(u8 effect);
void sub_807C9E4(u8);
void sub_807CA34(u8);
void sub_807CAE8(void);
void nullsub_38(void);
u32 sub_807CB0C(void);
void sub_807CB10(void);
void sub_807CC24(void);
void sub_807CCAC(void);
u8 sub_807CDC4(void);
u8 sub_807CE24(void);
u8 sub_807CE7C(void);
void nullsub_39(void);

// ASM
void sub_807CEBC(u8, u8, s8);
//void sub_807D1BC(u8, u8, u8, u8, u16);
void sub_807D1BC(u8 a, u8 a2, s8 c, u8 d, u16 e);
void sub_807D304(s8 a, u8 arg2, u16 c);
void sub_807D424(u8, u16);
// ...
void fade_screen(u8, u8);
// ...
void sub_807D78C(u8 tag);
void sub_807D874(u8);
// ...
void sub_807DB64(u8, u8);
// ...
void sub_807DE68(void);
// ...
void PlayRainSoundEffect(void);
// ...
void SetSav1Weather(u32);
u8 GetSav1Weather(void);
void sub_80806E4(void);
// ...
void DoCurrentWeather(void);
void sub_8080750();

bool8 sub_807D770(void);
bool8 sub_807DDFC(void);
void SetWeather(u32);
void UpdateWeatherPerDay(u16);

#endif // GUARD_WEATHER_H
