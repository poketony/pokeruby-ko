#ifndef GUARD_STARTER_CHOOSE_H
#define GUARD_STARTER_CHOOSE_H

#include "sprite.h"

extern const u16 gBirchBagGrassPal[2][16];
extern const u8 gBirchBagTilemap[];
extern const u8 gBirchGrassTilemap[];
extern const u8 gBirchHelpGfx[];

u16 GetStarterPokemon(u16);
void CB2_ChooseStarter(void);

#endif // GUARD_STARTER_CHOOSE_H
