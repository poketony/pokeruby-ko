#include "global.h"
#include "rom_8077ABC.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "data2.h"
#include "decompress.h"
#include "palette.h"
#include "pokemon_icon.h"
#include "species.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "util.h"
#include "ewram.h"

#define GET_UNOWN_LETTER(personality) ((\
      (((personality & 0x03000000) >> 24) << 6) \
    | (((personality & 0x00030000) >> 16) << 4) \
    | (((personality & 0x00000300) >> 8) << 2) \
    | (((personality & 0x00000003) >> 0) << 0) \
) % 28)

#define IS_DOUBLE_BATTLE() ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE) ? TRUE : FALSE)

#define NUM_BATTLE_SLOTS 4

#define gBattleMonPartyPositions gBattlePartyID
#define gCastformElevations gUnknownCastformData_0837F5A8
#define gCastformBackSpriteYCoords gUnknown_0837F5AC
#define gTransformPersonalities gPID_perBank
#define gBattleMonSprites gObjectBankIDs


struct Struct_unk_2019348 {
    u16 field_0;
    u16 field_2;
    u8 field_4;
    u32 field_8;
    u32 field_c;
    u32 field_10;
};

struct TransformStatus {
    u16 unknown;
    u16 species;
};

struct Struct_gUnknown_0837F578 {
    u8 field_0;
    u8 field_1;
};

struct OamMatrix {
    s16 a;
    s16 b;
    s16 c;
    s16 d;
};

struct Struct_2017810 {
    u8 filler_0[6];
    u8 field_6;
    u8 filler_7[5];
};

struct Color {
    u16 r:5;
    u16 g:5;
    u16 b:5;
};

struct Struct_sub_8078914 {
    u8 *field_0;
    u8 *field_4;
    u8 field_8;
};

struct BGCnt {
    u16 priority:2;
    u16 charBase:2;
    u16 unused:2;
    u16 mosaic:1;
    u16 colorMode:1;
    u16 screenBase:5;
    u16 overflow:1;
    u16 size:2;
};

#define BG1CNT (*(volatile struct BGCnt*)REG_ADDR_BG1CNT)
#define BG2CNT (*(volatile struct BGCnt*)REG_ADDR_BG2CNT)
#define BG3CNT (*(volatile struct BGCnt*)REG_ADDR_BG3CNT)

extern struct OamData gOamData_837DF9C[];
extern const union AnimCmd *const gDummySpriteAnimTable[];
extern const union AffineAnimCmd *const gDummySpriteAffineAnimTable[];

extern u16 gBattleMonPartyPositions[];
extern u16 gBattleTypeFlags;
extern u32 gTransformPersonalities[NUM_BATTLE_SLOTS];
extern u8 gBattleMonForms[NUM_BATTLE_SLOTS];
extern u16 gUnknown_0202F7CA[];
extern u8 gBattleMonSprites[NUM_BATTLE_SLOTS];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;
extern s16 gBattleAnimArgs[8];
extern u8 gBanksBySide[NUM_BATTLE_SLOTS];
extern u8 gNoOfAllBanks; // gNumBattleMons?
extern struct OamMatrix gOamMatrices[];
extern struct Struct_2017810 unk_2017810[];
extern u8 gHappinessMoveAnim;

extern u8 UpdateMonIconFrame(struct Sprite *sprite);

EWRAM_DATA union AffineAnimCmd *gUnknown_0202F7D4 = NULL;
EWRAM_DATA u32 filler_0202F7D8[3] = {0};

const struct Struct_gUnknown_0837F578 gUnknown_0837F578[][4] = {
    {
        { 72, 80 },
        { 176, 40 },
        { 48, 40 },
        { 112, 80 },
    },
    {
        { 32, 80 },
        { 200, 40 },
        { 90, 88 },
        { 152, 32 },
    },
};

// One entry for each of the four Castform forms.
// Coords are probably front pic coords or back pic coords, but this data does not seem to be
// used during battle, party summary, or pokedex screens.
const struct MonCoords gCastformFrontSpriteCoords[] = {
    { 0x44, 17 }, // NORMAL
    { 0x66, 9 }, // SUN
    { 0x46, 9 }, // RAIN
    { 0x86, 8 }, // HAIL
};

const u8 gCastformElevations[] = {
    13, // NORMAL
    14, // SUN
    13, // RAIN
    13, // HAIL
};

// Y position of the backsprite for each of the four Castform forms.
const u8 gCastformBackSpriteYCoords[] = {
    0, // NORMAL
    0, // SUN
    0, // RAIN
    0, // HAIL
};

const struct SpriteTemplate gSpriteTemplate_837F5B0[] = {
    {
        .tileTag = 55125,
        .paletteTag = 55125,
        .oam = gOamData_837DF9C,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    }, {
        .tileTag = 55126,
        .paletteTag = 55126,
        .oam = gOamData_837DF9C,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    }
};

const struct SpriteSheet gUnknown_0837F5E0[] = {
    { gMiscBlank_Gfx, 0x800, 55125, },
    { gMiscBlank_Gfx, 0x800, 55126, },
};


u8 sub_8077ABC(u8 slot, u8 a2) {
    u8 var;
    u16 species;
    struct TransformStatus *transform;

    if (NotInBattle()) {
        if (a2 == 3 && slot == 3) {
            a2 = 1;
        }
    }
    switch (a2) {
    case 0:
    case 2:
        var = gUnknown_0837F578[IS_DOUBLE_BATTLE()][GetBankIdentity(slot)].field_0;
        break;
    case 1:
        var = gUnknown_0837F578[IS_DOUBLE_BATTLE()][GetBankIdentity(slot)].field_1;
        break;
    case 3:
    case 4:
    default:
        if (NotInBattle()) {
            if (ewram19348.unk4 & 1) {
                species = ewram19348.unk2;
            } else {
                species = ewram19348.unk0;
            }
        } else {
            if (GetBankSide(slot)) {
                transform = &eTransformStatuses[slot];
                if (!transform->species) {
                    species = GetMonData(&gEnemyParty[gBattleMonPartyPositions[slot]], MON_DATA_SPECIES);
                } else {
                    species = transform->species;
                }
            } else {
                transform = &eTransformStatuses[slot];
                if (!transform->species) {
                    species = GetMonData(&gPlayerParty[gBattleMonPartyPositions[slot]], MON_DATA_SPECIES);
                } else {
                    species = transform->species;
                }
            }
        }
        if (a2 == 3) {
            var = sub_8077E44(slot, species, 1);
        } else {
            var = sub_8077E44(slot, species, 0);
        }
        break;
    }
    return var;
}

u8 sub_8077BFC(u8 slot, u16 species) {
    u16 letter;
    u32 personality;
    struct TransformStatus *transform;
    u8 ret;
    u16 var;

    if (!GetBankSide(slot) || NotInBattle()) {
        if (species == SPECIES_UNOWN) {
            if (NotInBattle()) {
                if (ewram19348.unk4 & 1) {
                    personality = ewram19348.unk10;
                } else {
                    personality = ewram19348.unk8;
                }
            } else {
                transform = &eTransformStatuses[slot];
                if (!transform->species) {
                    personality = GetMonData(&gPlayerParty[gBattleMonPartyPositions[slot]], MON_DATA_PERSONALITY);
                } else {
                    personality = gTransformPersonalities[slot];
                }
            }
            letter = GET_UNOWN_LETTER(personality);
            if (!letter) {
                var = species;
            } else {
                var = letter + SPECIES_UNOWN_B - 1;
            }
            ret = gMonBackPicCoords[var].y_offset;
        } else if (species == SPECIES_CASTFORM) {
            ret = gCastformBackSpriteYCoords[gBattleMonForms[slot]];
        } else if (species > NUM_SPECIES) {
            ret = gMonBackPicCoords[0].y_offset;
        } else {
            ret = gMonBackPicCoords[species].y_offset;
        }
    } else {
        if (species == SPECIES_UNOWN) {
            transform = &eTransformStatuses[slot];
            if (!transform->species) {
                personality = GetMonData(&gEnemyParty[gBattleMonPartyPositions[slot]], MON_DATA_PERSONALITY);
            } else {
                personality = gTransformPersonalities[slot];
            }
            letter = GET_UNOWN_LETTER(personality);
            if (!letter) {
                var = species;
            } else {
                var = letter + SPECIES_UNOWN_B - 1;
            }
            ret = gMonFrontPicCoords[var].y_offset;
        } else if (species == SPECIES_CASTFORM) {
            ret = gCastformFrontSpriteCoords[gBattleMonForms[slot]].y_offset;
        } else if (species > NUM_SPECIES) {
            ret = gMonFrontPicCoords[0].y_offset;
        } else {
            ret = gMonFrontPicCoords[species].y_offset;
        }
    }
    return ret;
}

u8 sub_8077DD8(u8 slot, u16 species) {
    u8 ret = 0;
    if (GetBankSide(slot) == 1) {
        if (!NotInBattle()) {
            if (species == SPECIES_CASTFORM) {
                ret = gCastformElevations[gBattleMonForms[slot]];
            } else if (species > NUM_SPECIES) {
                ret = gEnemyMonElevation[0];
            } else {
                ret = gEnemyMonElevation[species];
            }
        }
    }
    return ret;
}

u8 sub_8077E44(u8 slot, u16 species, u8 a3) {
    u16 offset;
    u8 y;
    if (GetBankSide(slot) == 0 || NotInBattle()) {
        offset = sub_8077BFC(slot, species);
    } else {
        offset = sub_8077BFC(slot, species);
        offset -= sub_8077DD8(slot, species);
    }
    y = offset + gUnknown_0837F578[IS_DOUBLE_BATTLE()][GetBankIdentity(slot)].field_1;
    if (a3) {
        if (GetBankSide(slot) == 0) {
            y += 8;
        }
        if (y > 104) y = 104;
    }
    return y;
}

u8 sub_8077EE4(u8 slot, u8 a2) {
    u16 species;
    struct TransformStatus *transform;
    if (a2 == 3 || a2 == 4) {
        if (NotInBattle()) {
            if (ewram19348.unk4 & 1) {
                species = ewram19348.unk2;
            } else {
                species = ewram19348.unk0;
            }
        } else {
            transform = &eTransformStatuses[slot];
            if (!transform->species) {
                species = gUnknown_0202F7CA[slot];
            } else {
                species = transform->species;
            }
        }
        if (a2 == 3) {
            return sub_8077E44(slot, species, 1);
        } else {
            return sub_8077E44(slot, species, 0);
        }
    } else {
        return sub_8077ABC(slot, a2);
    }
}

u8 sub_8077F68(u8 slot) {
    return sub_8077ABC(slot, 4);
}

u8 sub_8077F7C(u8 slot) {
    u16 var;
    if (GetBankSide(slot)) {
        var = sub_8077ABC(slot, 1) + 16;
    } else {
        var = sub_8077ABC(slot, 1) + 17;
    }
    return var;
}

u8 sub_8077FC0(u8 slot) {
    u16 var;
    u8 r6;
    struct TransformStatus *transform;
    r6 = sub_8077ABC(slot, 1);
    if (!NotInBattle()) {
        if (GetBankSide(slot)) {
            transform = &eTransformStatuses[slot];
            if (!transform->species) {
                var = GetMonData(&gEnemyParty[gBattleMonPartyPositions[slot]], MON_DATA_SPECIES);
            } else {
                var = transform->species;
            }
        } else {
            transform = &eTransformStatuses[slot];
            if (!transform->species) {
                var = GetMonData(&gPlayerParty[gBattleMonPartyPositions[slot]], MON_DATA_SPECIES);
            } else {
                var = transform->species;
            }
        }
        if (GetBankSide(slot)) {
            r6 -= sub_8077DD8(slot, var);
        }
    }
    return r6;
}

u8 GetAnimBankSpriteId(u8 whichBank) {
    u8 *sprites;
    if (whichBank == ANIM_BANK_ATK) {
        if (AnimBankSpriteExists(gBattleAnimBankAttacker)) {
            sprites = gBattleMonSprites;
            return sprites[gBattleAnimBankAttacker];
        } else {
            return 0xff;
        }
    } else if (whichBank == ANIM_BANK_DEF) {
        if (AnimBankSpriteExists(gBattleAnimBankTarget)) {
            sprites = gBattleMonSprites;
            return sprites[gBattleAnimBankTarget];
        } else {
            return 0xff;
        }
    } else if (whichBank == ANIM_BANK_ATK_PARTNER) {
        if (!IsAnimBankSpriteVisible(gBattleAnimBankAttacker ^ 2)) {
            return 0xff;
        } else {
            return gBattleMonSprites[gBattleAnimBankAttacker ^ 2];
        }
    } else {
        if (IsAnimBankSpriteVisible(gBattleAnimBankTarget ^ 2)) {
            return gBattleMonSprites[gBattleAnimBankTarget ^ 2];
        } else {
            return 0xff;
        }
    }
}

void StoreSpriteCallbackInData(struct Sprite *sprite, void (*callback)(struct Sprite*)) {
    sprite->data[6] = (u32)(callback) & 0xffff;
    sprite->data[7] = (u32)(callback) >> 16;
}

void SetCallbackToStoredInData(struct Sprite *sprite) {
    u32 callback = (u16)sprite->data[6] | (sprite->data[7] << 16);
    sprite->callback = (void (*)(struct Sprite *))callback;
}

void sub_8078114(struct Sprite *sprite) {
    if (sprite->data[3]) {
        sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
        sprite->pos2.y = Cos(sprite->data[0], sprite->data[1]);
        sprite->data[0] += sprite->data[2];
        if (sprite->data[0] >= 0x100) {
            sprite->data[0] -= 0x100;
        } else if (sprite->data[0] < 0) {
            sprite->data[0] += 0x100;
        }
        sprite->data[3]--;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078174(struct Sprite *sprite) {
    if (sprite->data[3]) {
        sprite->pos2.x = Sin(sprite->data[0], (sprite->data[5] >> 8) + sprite->data[1]);
        sprite->pos2.y = Cos(sprite->data[0], (sprite->data[5] >> 8) + sprite->data[1]);
        sprite->data[0] += sprite->data[2];
        sprite->data[5] += sprite->data[4];
        if (sprite->data[0] >= 0x100) {
            sprite->data[0] -= 0x100;
        } else if (sprite->data[0] < 0) {
            sprite->data[0] += 0x100;
        }
        sprite->data[3]--;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void unref_sub_80781F0(struct Sprite *sprite) {
    if (sprite->data[3]) {
        sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
        sprite->pos2.y = Cos(sprite->data[4], sprite->data[1]);
        sprite->data[0] += sprite->data[2];
        sprite->data[4] += sprite->data[5];
        if (sprite->data[0] >= 0x100) {
            sprite->data[0] -= 0x100;
        } else if (sprite->data[0] < 0) {
            sprite->data[0] += 0x100;
        }
        if (sprite->data[4] >= 0x100) {
            sprite->data[4] -= 0x100;
        } else if (sprite->data[4] < 0) {
            sprite->data[4] += 0x100;
        }
        sprite->data[3]--;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078278(struct Sprite *sprite) {
    if (sprite->data[3]) {
        sprite->pos2.x = Sin(sprite->data[0], sprite->data[1]);
        sprite->pos2.y = Cos(sprite->data[0], sprite->data[4]);
        sprite->data[0] += sprite->data[2];
        if (sprite->data[0] >= 0x100) {
            sprite->data[0] -= 0x100;
        } else if (sprite->data[0] < 0) {
            sprite->data[0] += 0x100;
        }
        sprite->data[3]--;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_80782D8(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_80782F8(struct Sprite *sprite) {
    sub_8078314(sprite);
    sprite->callback = sub_8078364;
    sprite->callback(sprite);
}

void sub_8078314(struct Sprite *sprite) {
    s16 old;
    int v1;
    if (sprite->data[1] > sprite->data[2]) {
        sprite->data[0] = -sprite->data[0];
    }
    v1 = sprite->data[2] - sprite->data[1];
    old = sprite->data[0];
    sprite->data[0] = abs(v1 / sprite->data[0]);
    sprite->data[2] = (sprite->data[4] - sprite->data[3]) / sprite->data[0];
    sprite->data[1] = old;
}

void sub_8078364(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
        sprite->pos2.x += sprite->data[1];
        sprite->pos2.y += sprite->data[2];
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078394(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
        sprite->data[3] += sprite->data[1];
        sprite->data[4] += sprite->data[2];
        sprite->pos2.x = sprite->data[3] >> 8;
        sprite->pos2.y = sprite->data[4] >> 8;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_80783D0(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
        sprite->data[3] += sprite->data[1];
        sprite->data[4] += sprite->data[2];
        sprite->pos2.x = sprite->data[3] >> 8;
        sprite->pos2.y = sprite->data[4] >> 8;
    } else {
        SetCallbackToStoredInData(sprite);
    }
    UpdateMonIconFrame(sprite);
}

void unref_sub_8078414(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x + sprite->pos2.x;
    sprite->data[3] = sprite->pos1.y + sprite->pos2.y;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3);
    sprite->callback = sub_80782F8;
}

void sub_8078458(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
        gSprites[sprite->data[3]].pos2.x += sprite->data[1];
        gSprites[sprite->data[3]].pos2.y += sprite->data[2];
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_80784A8(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
        sprite->data[3] += sprite->data[1];
        sprite->data[4] += sprite->data[2];
        gSprites[sprite->data[5]].pos2.x = sprite->data[3] >> 8;
        gSprites[sprite->data[5]].pos2.y = sprite->data[4] >> 8;
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078504(struct Sprite *sprite) {
    if (sprite->data[0] > 0) {
        sprite->data[0]--;
        sprite->pos2.x = sprite->data[2] >> 8;
        sprite->data[2] += sprite->data[1];
        sprite->pos2.y = sprite->data[4] >> 8;
        sprite->data[4] += sprite->data[3];
        if (sprite->data[0] % sprite->data[5] == 0) {
            if (sprite->data[5]) {
                sprite->invisible ^= 1;
            }
        }
    } else {
        SetCallbackToStoredInData(sprite);
    }
}

void move_anim_8074EE0(struct Sprite *sprite) {
    FreeSpriteOamMatrix(sprite);
    move_anim_8072740(sprite);
}

void unref_sub_8078588(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x + sprite->pos2.x;
    sprite->data[3] = sprite->pos1.y + sprite->pos2.y;
    sprite->data[2] = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->data[4] = sub_8077ABC(gBattleAnimBankAttacker, 3);
    sprite->callback = sub_80782F8;
}

void unref_sub_80785CC(struct Sprite *sprite) {
    ResetPaletteStructByUid(sprite->data[5]);
    move_anim_8074EE0(sprite);
}

void sub_80785E4(struct Sprite *sprite) {
    if (sprite->affineAnimEnded) {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078600(struct Sprite *sprite) {
    if (sprite->animEnded) {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_807861C(struct Sprite *sprite) {
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    move_anim_8072740(sprite);
}

void sub_8078634(u8 task) {
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    DestroyAnimVisualTask(task);
}

void sub_8078650(struct Sprite *sprite) {
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
}

void sub_807867C(struct Sprite *sprite, s16 a2) {
    u16 v1 = sub_8077ABC(gBattleAnimBankAttacker, 0);
    u16 v2 = sub_8077ABC(gBattleAnimBankTarget, 0);
    if (v1 > v2) {
        sprite->pos1.x -= a2;
    } else if (v1 < v2) {
        sprite->pos1.x += a2;
    } else {
        if (GetBankSide(gBattleAnimBankAttacker)) {
            sprite->pos1.x -= a2;
        } else {
            sprite->pos1.x += a2;
        }
    }
}

void sub_80786EC(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->data[6] = 0x8000 / sprite->data[0];
    sprite->data[7] = 0;
}

bool8 sub_8078718(struct Sprite *sprite) {
    if (sub_8078B5C(sprite)) {
        return TRUE;
    }
    sprite->data[7] += sprite->data[6];
    sprite->pos2.y += Sin((u8)(sprite->data[7] >> 8), sprite->data[5]);
    return FALSE;
}

void oamt_add_pos2_onto_pos1(struct Sprite *sprite) {
    sprite->pos1.x += sprite->pos2.x;
    sprite->pos1.y += sprite->pos2.y;
    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
}

void sub_8078764(struct Sprite *sprite, u8 a2) {
    if (!a2) {
        sprite->pos1.x = sub_8077EE4(gBattleAnimBankTarget, 0);
        sprite->pos1.y = sub_8077EE4(gBattleAnimBankTarget, 1);
    }
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
}

void sub_80787B0(struct Sprite *sprite, u8 a2) {
    if (!a2) {
        sprite->pos1.x = sub_8077EE4(gBattleAnimBankAttacker, 0);
        sprite->pos1.y = sub_8077EE4(gBattleAnimBankAttacker, 1);
    } else {
        sprite->pos1.x = sub_8077EE4(gBattleAnimBankAttacker, 2);
        sprite->pos1.y = sub_8077EE4(gBattleAnimBankAttacker, 3);
    }
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
}

u8 GetBankSide(u8 slot) {
    return gBanksBySide[slot] & 1;
}

u8 GetBankIdentity(u8 slot) {
    return gBanksBySide[slot];
}

u8 GetBankByPlayerAI(u8 slot) {
    u8 i;
    for (i = 0; i < gNoOfAllBanks; i++) {
        if (gBanksBySide[i] == slot) {
            break;
        }
    }
    return i;
}

bool8 AnimBankSpriteExists(u8 slot) {
    if (NotInBattle()) {
        if (gBattleAnimBankAttacker == slot) {
            return TRUE;
        }
        if (gBattleAnimBankTarget == slot) {
            return TRUE;
        }
        return FALSE;
    } else {
        if (gBanksBySide[slot] == 0xff) {
            return FALSE;
        }
        if (GetBankSide(slot)) {
            if (GetMonData(&gEnemyParty[gBattleMonPartyPositions[slot]], MON_DATA_HP) != 0) {
                return TRUE;
            }
        } else {
            if (GetMonData(&gPlayerParty[gBattleMonPartyPositions[slot]], MON_DATA_HP) != 0) {
                return TRUE;
            }
        }
        return FALSE;
    }
}

bool8 IsDoubleBattle() {
    return IS_DOUBLE_BATTLE();
}

void sub_8078914(struct Struct_sub_8078914 *unk) {
    if (NotInBattle()) {
        unk->field_0 = (u8 *)0x6008000;
        unk->field_4 = (u8 *)0x600f000;
        unk->field_8 = 0xe;
    } else {
        unk->field_0 = (u8 *)0x6004000;
        unk->field_4 = (u8 *)0x600e000;
        unk->field_8 = 0x8;
    }
}

void sub_8078954(struct Struct_sub_8078914 *unk) {
    if (NotInBattle()) {
        unk->field_0 = (u8 *)0x6008000;
        unk->field_4 = (u8 *)0x600f000;
        unk->field_8 = 0xe;
    } else if (GetBankIdentity_permutated(gBattleAnimBankAttacker) == 1) {
        unk->field_0 = (u8 *)0x6004000;
        unk->field_4 = (u8 *)0x600e000;
        unk->field_8 = 0x8;
    } else {
        unk->field_0 = (u8 *)0x6006000;
        unk->field_4 = (u8 *)0x600f000;
        unk->field_8 = 0x9;
    }
}

u8 sub_80789BC() {
    if (NotInBattle()) {
        return 1;
    }
    return 2;
}

void sub_80789D4(bool8 a1) {
    if (!a1) {
        BG3CNT.size = 0;
        BG3CNT.overflow = 1;
    } else if (NotInBattle()) {
        BG3CNT.size = 0;
        BG3CNT.overflow = 1;
    } else {
        BG3CNT.size = 1;
        BG3CNT.overflow = 0;
    }
}

void sub_8078A34(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sub_8078A5C(sprite);
    sprite->callback = sub_80783D0;
    sprite->callback(sprite);
}

void sub_8078A5C(struct Sprite *sprite) {
    s16 x = (sprite->data[2] - sprite->data[1]) << 8;
    s16 y = (sprite->data[4] - sprite->data[3]) << 8;
    sprite->data[1] = x / sprite->data[0];
    sprite->data[2] = y / sprite->data[0];
    sprite->data[4] = 0;
    sprite->data[3] = 0;
}

void obj_translate_based_on_private_1_2_3_4(struct Sprite *sprite) {
    int x = sprite->data[2] - sprite->data[1];
    int y = sprite->data[4] - sprite->data[3];
    bool8 r8 = x < 0;
    bool8 r9 = y < 0;
    u16 x2 = abs(x) << 8;
    u16 y2 = abs(y) << 8;
    x2 = x2 / sprite->data[0];
    y2 = y2 / sprite->data[0];
    if (r8) {
        x2 |= 1;
    } else {
        x2 &= ~1;
    }
    if (r9) {
        y2 |= 1;
    } else {
        y2 &= ~1;
    }
    sprite->data[1] = x2;
    sprite->data[2] = y2;
    sprite->data[4] = 0;
    sprite->data[3] = 0;
}

void sub_8078B34(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    obj_translate_based_on_private_1_2_3_4(sprite);
    sprite->callback = sub_8078BB8;
    sprite->callback(sprite);
}

bool8 sub_8078B5C(struct Sprite *sprite) {
    u16 v1, v2, x, y;
    if (!sprite->data[0]) {
        return TRUE;
    }
    v1 = sprite->data[1];
    v2 = sprite->data[2];
    x = sprite->data[3];
    y = sprite->data[4];
    x += v1;
    y += v2;
    if (v1 & 1) {
        sprite->pos2.x = -(x >> 8);
    } else {
        sprite->pos2.x = x >> 8;
    }
    if (v2 & 1) {
        sprite->pos2.y = -(y >> 8);
    } else {
        sprite->pos2.y = y >> 8;
    }
    sprite->data[3] = x;
    sprite->data[4] = y;
    sprite->data[0]--;
    return FALSE;
}

void sub_8078BB8(struct Sprite *sprite) {
    if (sub_8078B5C(sprite)) {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078BD4(struct Sprite *sprite) {
    int v1 = abs(sprite->data[2] - sprite->data[1]) << 8;
    sprite->data[0] = v1 / sprite->data[0];
    obj_translate_based_on_private_1_2_3_4(sprite);
}

void sub_8078C00(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sub_8078BD4(sprite);
    sprite->callback = sub_8078BB8;
    sprite->callback(sprite);
}

void sub_8078C28(struct Sprite *sprite) {
    int x = sprite->data[2] - sprite->data[1];
    int y = sprite->data[4] - sprite->data[3];
    bool8 x_sign = x < 0;
    bool8 y_sign = y < 0;
    u16 x2 = abs(x) << 4;
    u16 y2 = abs(y) << 4;
    x2 /= sprite->data[0];
    y2 /= sprite->data[0];
    if (x_sign) {
        x2 |= 1;
    } else {
        x2 &= ~1;
    }
    if (y_sign) {
        y2 |= 1;
    } else {
        y2 &= ~1;
    }
    sprite->data[1] = x2;
    sprite->data[2] = y2;
    sprite->data[4] = 0;
    sprite->data[3] = 0;
}

void sub_8078CC0(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sub_8078C28(sprite);
    sprite->callback = sub_8078D44;
    sprite->callback(sprite);
}

bool8 sub_8078CE8(struct Sprite *sprite) {
    u16 v1, v2, x, y;
    if (!sprite->data[0]) {
        return TRUE;
    }
    v1 = sprite->data[1];
    v2 = sprite->data[2];
    x = sprite->data[3];
    y = sprite->data[4];
    x += v1;
    y += v2;
    if (v1 & 1) {
        sprite->pos2.x = -(x >> 4);
    } else {
        sprite->pos2.x = x >> 4;
    }
    if (v2 & 1) {
        sprite->pos2.y = -(y >> 4);
    } else {
        sprite->pos2.y = y >> 4;
    }
    sprite->data[3] = x;
    sprite->data[4] = y;
    sprite->data[0]--;
    return FALSE;
}

void sub_8078D44(struct Sprite *sprite) {
    if (sub_8078CE8(sprite)) {
        SetCallbackToStoredInData(sprite);
    }
}

void sub_8078D60(struct Sprite *sprite) {
    int v1 = abs(sprite->data[2] - sprite->data[1]) << 4;
    sprite->data[0] = v1 / sprite->data[0];
    sub_8078C28(sprite);
}

void sub_8078D8C(struct Sprite *sprite) {
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;
    sub_8078D60(sprite);
    sprite->callback = sub_8078D44;
    sprite->callback(sprite);
}

void obj_id_set_rotscale(u8 sprite, s16 xScale, s16 yScale, u16 rotation) {
    int i;
    struct ObjAffineSrcData src;
    struct OamMatrix matrix;
    src.xScale = xScale;
    src.yScale = yScale;
    src.rotation = rotation;
    if (sub_8078E38()) {
        src.xScale = -src.xScale;
    }
    i = gSprites[sprite].oam.matrixNum;
    ObjAffineSet(&src, &matrix, 1, 2);
    gOamMatrices[i].a = matrix.a;
    gOamMatrices[i].b = matrix.b;
    gOamMatrices[i].c = matrix.c;
    gOamMatrices[i].d = matrix.d;
}

bool8 sub_8078E38() {
    if (NotInBattle()) {
        if (gSprites[GetAnimBankSpriteId(0)].data[2] == 0xc9 /* XXX SPECIES_UNOWN? */) {
            return FALSE;
        }
        return TRUE;
    }
    return FALSE;
}

void sub_8078E70(u8 sprite, u8 a2) {
    u8 r7 = gSprites[sprite].data[0];
    if (NotInBattle() || IsAnimBankSpriteVisible(r7)) {
        gSprites[sprite].invisible = FALSE;
    }
    gSprites[sprite].oam.objMode = a2;
    gSprites[sprite].affineAnimPaused = TRUE;
    if (!NotInBattle() && !gSprites[sprite].oam.affineMode) {
        gSprites[sprite].oam.matrixNum = ewram17810[r7].unk6;
    }
    gSprites[sprite].oam.affineMode = 3;
    CalcCenterToCornerVec(&gSprites[sprite], gSprites[sprite].oam.shape, gSprites[sprite].oam.size, gSprites[sprite].oam.affineMode);
}

void sub_8078F40(u8 sprite) {
    obj_id_set_rotscale(sprite, 0x100, 0x100, 0);
    gSprites[sprite].oam.affineMode = 1;
    gSprites[sprite].oam.objMode = 0;
    gSprites[sprite].affineAnimPaused = FALSE;
    CalcCenterToCornerVec(&gSprites[sprite], gSprites[sprite].oam.shape, gSprites[sprite].oam.size, gSprites[sprite].oam.affineMode);
}

void sub_8078F9C(u8 sprite) {
    u16 matrix = gSprites[sprite].oam.matrixNum;
    s16 c = gOamMatrices[matrix].c;
    if (c < 0) {
        c = -c;
    }
    gSprites[sprite].pos2.y = c >> 3;
}

// related to obj_id_set_rotscale
void sub_8078FDC(struct Sprite *sprite, bool8 a2, s16 xScale, s16 yScale, u16 rotation) {
    int i;
    struct ObjAffineSrcData src;
    struct OamMatrix matrix;
    if (sprite->oam.affineMode & 1) {
        sprite->affineAnimPaused = TRUE;
        if (a2) {
            CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, sprite->oam.affineMode);
        }
        src.xScale = xScale;
        src.yScale = yScale;
        src.rotation = rotation;
        if (sub_8078E38()) {
            src.xScale = -src.xScale;
        }
        i = sprite->oam.matrixNum;
        ObjAffineSet(&src, &matrix, 1, 2);
        gOamMatrices[i].a = matrix.a;
        gOamMatrices[i].b = matrix.b;
        gOamMatrices[i].c = matrix.c;
        gOamMatrices[i].d = matrix.d;
    }
}

void sub_8079098(struct Sprite *sprite) {
    sub_8078FDC(sprite, TRUE, 0x100, 0x100, 0);
    sprite->affineAnimPaused = FALSE;
    CalcCenterToCornerVec(sprite, sprite->oam.shape, sprite->oam.size, sprite->oam.affineMode);
}

static u16 ArcTan2_(s16 a, s16 b) {
    return ArcTan2(a, b);
}

u16 sub_80790F0(s16 a, s16 b) {
    u16 var = ArcTan2_(a, b);
    return -var;
}

void sub_8079108(u16 a1, bool8 a2) {
    int i;
    struct Color *c;
    struct Color *c2;
    u16 average;

    a1 *= 0x10;

    if (!a2) {
        for (i = 0; i < 0x10; i++) {
            c = (struct Color *)&gPlttBufferUnfaded[a1 + i];
            average = c->r + c->g + c->b;
            average /= 3;

            c2 = (struct Color *)&gPlttBufferFaded[a1 + i];
            c2->r = average;
            c2->g = average;
            c2->b = average;
        }
    } else {
        CpuCopy32(&gPlttBufferUnfaded[a1], &gPlttBufferFaded[a1], 0x20);
    }
}

u32 sub_80791A8(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7) {
    u32 var = 0;
    u32 shift;
    if (a1) {
        if (!NotInBattle()) {
            var = 0xe;
        } else {
            var = 1 << sub_80789BC();
        }
    }
    if (a2) {
        shift = gBattleAnimBankAttacker + 16;
        var |= 1 << shift;
    }
    if (a3) {
        shift = gBattleAnimBankTarget + 16;
        var |= 1 << shift;
    }
    if (a4) {
        if (IsAnimBankSpriteVisible(gBattleAnimBankAttacker ^ 2)) {
            shift = (gBattleAnimBankAttacker ^ 2) + 16;
            var |= 1 << shift;
        }
    }
    if (a5) {
        if (IsAnimBankSpriteVisible(gBattleAnimBankTarget ^ 2)) {
            shift = (gBattleAnimBankTarget ^ 2) + 16;
            var |= 1 << shift;
        }
    }
    if (a6) {
        if (!NotInBattle()) {
            var |= 0x100;
        } else {
            var |= 0x4000;
        }
    }
    if (a7) {
        if (!NotInBattle()) {
            var |= 0x200;
        }
    }
    return var;
}

u32 sub_80792C0(u8 a1, u8 a2, u8 a3, u8 a4) {
    u32 var = 0;
    u32 shift;
    if (NotInBattle()) {
        if (a1) {
            var |= 1 << 18;
            return var;
        }
    } else {
        if (a1) {
            if (IsAnimBankSpriteVisible(GetBankByPlayerAI(0))) {
                var |= 1 << (GetBankByPlayerAI(0) + 16);
            }
        }
        if (a2) {
            if (IsAnimBankSpriteVisible(GetBankByPlayerAI(2))) {
                shift = GetBankByPlayerAI(2) + 16;
                var |= 1 << shift;
            }
        }
        if (a3) {
            if (IsAnimBankSpriteVisible(GetBankByPlayerAI(1))) {
                shift = GetBankByPlayerAI(1) + 16;
                var |= 1 << shift;
            }
        }
        if (a4) {
            if (IsAnimBankSpriteVisible(GetBankByPlayerAI(3))) {
                shift = GetBankByPlayerAI(3) + 16;
                var |= 1 << shift;
            }
        }
    }
    return var;
}

u8 sub_80793A8(u8 a1) {
    return a1;
}

u8 unref_sub_80793B0(u8 a1) {
    return GetBankByPlayerAI(a1);
}

void sub_80793C4(struct Sprite *sprite) {
    bool8 var;
    if (!sprite->data[0]) {
        if (!gBattleAnimArgs[3]) {
            var = TRUE;
        } else {
            var = FALSE;
        }
        if (!gBattleAnimArgs[2]) {
            sub_80787B0(sprite, var);
        } else {
            sub_8078764(sprite, var);
        }
        sprite->data[0]++;

    } else if (sprite->animEnded || sprite->affineAnimEnded) {
        move_anim_8074EE0(sprite);
    }
}

void sub_807941C(struct Sprite *sprite) {
    bool8 v1;
    u8 v2;
    if (!(gBattleAnimArgs[5] & 0xff00)) {
        v1 = TRUE;
    } else {
        v1 = FALSE;
    }
    if (!(gBattleAnimArgs[5] & 0xff)) {
        v2 = 3;
    } else {
        v2 = 1;
    }
    sub_80787B0(sprite, v1);
    if (GetBankSide(gBattleAnimBankAttacker)) {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, v2) + gBattleAnimArgs[3];
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_80794A8(struct Sprite *sprite) {
    sub_80787B0(sprite, 1);
    if (GetBankSide(gBattleAnimBankAttacker)) {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sub_8077ABC(gBattleAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = sub_8077ABC(gBattleAnimBankTarget, 3) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];
    sub_80786EC(sprite);
    sprite->callback = sub_8079518;
}

void sub_8079518(struct Sprite *sprite) {
    if (sub_8078718(sprite)) {
        move_anim_8072740(sprite);
    }
}

void sub_8079534(struct Sprite *sprite) {
    u8 r4, slot, r7;
    if (!gBattleAnimArgs[6]) {
        r4 = 1;
        r7 = 3;
    } else {
        r4 = 0;
        r7 = 1;
    }
    if (!gBattleAnimArgs[5]) {
        sub_80787B0(sprite, r4);
        slot = gBattleAnimBankAttacker;
    } else {
        sub_8078764(sprite, r4);
        slot = gBattleAnimBankTarget;
    }
    if (GetBankSide(gBattleAnimBankAttacker)) {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    sub_8078764(sprite, r4);
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sub_8077ABC(slot, 2) + gBattleAnimArgs[2];
    sprite->data[4] = sub_8077ABC(slot, r7) + gBattleAnimArgs[3];
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

s16 duplicate_obj_of_side_rel2move_in_transparent_mode(u8 a1) {
    u16 i;
    u8 sprite = GetAnimBankSpriteId(a1);
    if (sprite != 0xff) {
        for (i = 0; i < 0x40; i++) {
            if (gSprites[i].inUse) {
                continue;
            }
            gSprites[i] = gSprites[sprite];
            gSprites[i].oam.objMode = 1;
            gSprites[i].invisible = FALSE;
            return i;
        }
    }
    return -1;
}

void obj_delete_but_dont_free_vram(struct Sprite *sprite) {
    sprite->usingSheet = TRUE;
    DestroySprite(sprite);
}

void sub_8079670(u8 task) {
    s16 v1 = 0;
    s16 v2 = 0;
    if (gBattleAnimArgs[2] > gBattleAnimArgs[0]) {
        v2 = 1;
    }
    if (gBattleAnimArgs[2] < gBattleAnimArgs[0]) {
        v2 = -1;
    }
    if (gBattleAnimArgs[3] > gBattleAnimArgs[1]) {
        v1 = 1;
    }
    if (gBattleAnimArgs[3] < gBattleAnimArgs[1]) {
        v1 = -1;
    }
    gTasks[task].data[0] = 0;
    gTasks[task].data[1] = gBattleAnimArgs[4];
    gTasks[task].data[2] = 0;
    gTasks[task].data[3] = gBattleAnimArgs[0];
    gTasks[task].data[4] = gBattleAnimArgs[1];
    gTasks[task].data[5] = v2;
    gTasks[task].data[6] = v1;
    gTasks[task].data[7] = gBattleAnimArgs[2];
    gTasks[task].data[8] = gBattleAnimArgs[3];
    REG_BLDALPHA = (gBattleAnimArgs[1] << 8) | gBattleAnimArgs[0];
    gTasks[task].func = sub_80796F8;
}

void sub_80796F8(u8 taskId) {
    struct Task *task = &gTasks[taskId];
    if (++task->data[0] > task->data[1]) {
        task->data[0] = 0;
        if (++task->data[2] & 1) {
            if (task->data[3] != task->data[7]) {
                task->data[3] += task->data[5];
            }
        } else {
            if (task->data[4] != task->data[8]) {
                task->data[4] += task->data[6];
            }
        }
        REG_BLDALPHA = (task->data[4] << 8) | task->data[3];
        if (task->data[3] == task->data[7] && task->data[4] == task->data[8]) {
            DestroyAnimVisualTask(taskId);
            return;
        }
    }
}

void sub_8079790(u8 task) {
    u8 sprite = GetAnimBankSpriteId(gBattleAnimArgs[0]);
    if (sprite == 0xff) {
        DestroyAnimVisualTask(task);
        return;
    }
    gTasks[task].data[0] = (gSprites[sprite].oam.paletteNum * 0x10) + 0x101;
    sub_80797EC(&gTasks[task]);
}

void sub_80797EC(struct Task *task) {
    task->data[1] = gBattleAnimArgs[1];
    task->data[2] = 0;
    task->data[3] = gBattleAnimArgs[2];
    task->data[4] = 0;
    task->data[5] = gBattleAnimArgs[3];
    task->data[6] = 0;
    task->data[7] = gBattleAnimArgs[4];
    task->func = sub_8079814;
}

void sub_8079814(u8 taskId) {
    struct Task *task = &gTasks[taskId];
    if (++task->data[4] >= task->data[5]) {
        task->data[4] = 0;
        if (!task->data[6]) {
            task->data[2]++;
            BlendPalette(task->data[0], 0xf, task->data[2], task->data[1]);
            if (task->data[2] == task->data[3]) {
                task->data[6] = 1;
            }
        } else {
            task->data[2]--;
            BlendPalette(task->data[0], 0xf, task->data[2], task->data[1]);
            if (!task->data[2]) {
                if (--task->data[7]) {
                    task->data[4] = 0;
                    task->data[6] = 0;
                } else {
                    DestroyAnimVisualTask(taskId);
                    return;
                }
            }
        }
    }
}

void sub_80798AC(u8 task) {
    u8 palette = IndexOfSpritePaletteTag(gBattleAnimArgs[0]);
    if (palette == 0xff) {
        DestroyAnimVisualTask(task);
        return;
    }
    gTasks[task].data[0] = (palette * 0x10) + 0x101;
    sub_80797EC(&gTasks[task]);
}

void sub_80798F4(struct Task *task, u8 a2, void *a3) {
    task->data[7] = 0;
    task->data[8] = 0;
    task->data[9] = 0;
    task->data[15] = a2;
    task->data[10] = 0x100;
    task->data[11] = 0x100;
    task->data[12] = 0;
    sub_8079BF4(&task->data[13], &task->data[14], a3);
    sub_8078E70(a2, 0);
}

bool8 sub_807992C(struct Task *task) {
    gUnknown_0202F7D4 = sub_8079BFC(task->data[13], task->data[14]) + (task->data[7] << 3);
    switch (gUnknown_0202F7D4->type) {
    default:
        if (!gUnknown_0202F7D4->frame.duration) {
            task->data[10] = gUnknown_0202F7D4->frame.xScale;
            task->data[11] = gUnknown_0202F7D4->frame.yScale;
            task->data[12] = gUnknown_0202F7D4->frame.rotation;
            task->data[7]++;
            gUnknown_0202F7D4++;
        }
        task->data[10] += gUnknown_0202F7D4->frame.xScale;
        task->data[11] += gUnknown_0202F7D4->frame.yScale;
        task->data[12] += gUnknown_0202F7D4->frame.rotation;
        obj_id_set_rotscale(task->data[15], task->data[10], task->data[11], task->data[12]);
        sub_8079A64(task->data[15]);
        if (++task->data[8] >= gUnknown_0202F7D4->frame.duration) {
            task->data[8] = 0;
            task->data[7]++;
        }
        break;

    case AFFINEANIMCMDTYPE_JUMP:
        task->data[7] = gUnknown_0202F7D4->jump.target;
        break;

    case AFFINEANIMCMDTYPE_LOOP:
        if (gUnknown_0202F7D4->loop.count) {
            if (task->data[9]) {
                if (!--task->data[9]) {
                    task->data[7]++;
                    break;
                }
            } else {
                task->data[9] = gUnknown_0202F7D4->loop.count;
            }
            if (!task->data[7]) {
                break;
            }
            for (;;) {
                task->data[7]--;
                gUnknown_0202F7D4--;
                if (gUnknown_0202F7D4->type == AFFINEANIMCMDTYPE_LOOP) {
                    task->data[7]++;
                    return TRUE;
                }
                if (!task->data[7]) {
                    return TRUE;
                }
            }
        }
        task->data[7]++;
        break;

    case 0x7fff:
        gSprites[task->data[15]].pos2.y = 0;
        sub_8078F40(task->data[15]);
        return FALSE;
    }

    return TRUE;
}

void sub_8079A64(u8 sprite) {
    int var = 0x40 - sub_8079B10(sprite) * 2;
    u16 matrix = gSprites[sprite].oam.matrixNum;
    int var2 = (var << 8) / gOamMatrices[matrix].d;
    if (var2 > 0x80) {
        var2 = 0x80;
    }
    gSprites[sprite].pos2.y = (var - var2) / 2;
}

void sub_8079AB8(u8 sprite, u8 sprite2) {
    int var = 0x40 - sub_8079B10(sprite2) * 2;
    u16 matrix = gSprites[sprite].oam.matrixNum;
    int var2 = (var << 8) / gOamMatrices[matrix].d;
    if (var2 > 0x80) {
        var2 = 0x80;
    }
    gSprites[sprite].pos2.y = (var - var2) / 2;
}

u16 sub_8079B10(u8 sprite) {
    struct TransformStatus *transform;
    u8 slot = gSprites[sprite].data[0];
    u16 species;
    u16 i;
    for (i = 0; i < (sizeof(gBattleMonSprites) / sizeof(u8)); i++) {
        if (gBattleMonSprites[i] == sprite) {
            if (NotInBattle()) {
                species = ewram19348.unk0;
                return gMonBackPicCoords[species].y_offset;
            } else {
                if (!GetBankSide(i)) {
                    transform = &eTransformStatuses[slot];
                    if (!transform->species) {
                        species = GetMonData(&gPlayerParty[gBattleMonPartyPositions[i]], MON_DATA_SPECIES);
                    } else {
                        species = transform->species;
                    }
                    return gMonBackPicCoords[species].y_offset;
                } else {
                    transform = &eTransformStatuses[slot];
                    if (!transform->species) {
                        species = GetMonData(&gEnemyParty[gBattleMonPartyPositions[i]], MON_DATA_SPECIES);
                    } else {
                        species = transform->species;
                    }
                    return gMonFrontPicCoords[species].y_offset;
                }
            }
        }
    }
    return 0x40;
}

void sub_8079BF4(s16 *bottom, s16 *top, void *ptr) {
    *bottom = ((intptr_t) ptr) & 0xffff;
    *top = (((intptr_t) ptr) >> 16) & 0xffff;
}

void *sub_8079BFC(s16 bottom, s16 top) {
    return (void *)((u16)bottom | ((u16)top << 16));
}


// possible new file

void sub_8079C08(struct Task *task, u8 a2, s16 a3, s16 a4, s16 a5, s16 a6, u16 a7) {
    task->data[8] = a7;
    task->data[15] = a2;
    task->data[9] = a3;
    task->data[10] = a4;
    task->data[13] = a5;
    task->data[14] = a6;
    task->data[11] = (a5 - a3) / a7;
    task->data[12] = (a6 - a4) / a7;
}

u8 sub_8079C74(struct Task *task) {
    if (!task->data[8]) {
        return 0;
    }
    if (--task->data[8]) {
        task->data[9] += task->data[11];
        task->data[10] += task->data[12];
    } else {
        task->data[9] = task->data[13];
        task->data[10] = task->data[14];
    }
    obj_id_set_rotscale(task->data[15], task->data[9], task->data[10], 0);
    if (task->data[8]) {
        sub_8079A64(task->data[15]);
    } else {
        gSprites[task->data[15]].pos2.y = 0;
    }
    return task->data[8];
}

void sub_8079CEC(u8 task) {
    u16 v1;
    if (gHappinessMoveAnim <= 30) {
        v1 = 0;
    } else if (gHappinessMoveAnim <= 100) {
        v1 = 1;
    } else if (gHappinessMoveAnim <= 200) {
        v1 = 2;
    } else {
        v1 = 3;
    }
    gBattleAnimArgs[7] = v1;
    DestroyAnimVisualTask(task);
}

void unref_sub_8079D20(u8 priority) {
    if (IsAnimBankSpriteVisible(gBattleAnimBankTarget)) {
        gSprites[gBattleMonSprites[gBattleAnimBankTarget]].oam.priority = priority;
    }
    if (IsAnimBankSpriteVisible(gBattleAnimBankAttacker)) {
        gSprites[gBattleMonSprites[gBattleAnimBankAttacker]].oam.priority = priority;
    }
    if (IsAnimBankSpriteVisible(gBattleAnimBankTarget ^ 2)) {
        gSprites[gBattleMonSprites[gBattleAnimBankTarget ^ 2]].oam.priority = priority;
    }
    if (IsAnimBankSpriteVisible(gBattleAnimBankAttacker ^ 2)) {
        gSprites[gBattleMonSprites[gBattleAnimBankAttacker ^ 2]].oam.priority = priority;
    }
}

void sub_8079E24() {
    int i;
    for (i = 0; i < gNoOfAllBanks; i++) {
        if (IsAnimBankSpriteVisible(i)) {
            gSprites[gBattleMonSprites[i]].subpriority = sub_8079E90(i);
            gSprites[gBattleMonSprites[i]].oam.priority = 2;
        }
    }
}

u8 sub_8079E90(u8 slot) {
    u8 status;
    u8 ret;
    if (NotInBattle()) {
        if (slot == 2) {
            return 30;
        } else {
            return 40;
        }
    } else {
        status = GetBankIdentity(slot);
        if (status == 0) {
            ret = 30;
        } else if (status == 2) {
            ret = 20;
        } else if (status == 1) {
            ret = 40;
        } else {
            ret = 50;
        }
    }
    return ret;
}

u8 sub_8079ED4(u8 slot) {
    u8 status = GetBankIdentity(slot);
    if (NotInBattle()) {
        return 2;
    }
    if (status == 0 || status == 3) {
        return BG2CNT.priority;
    } else {
        return BG1CNT.priority;
    }
}

u8 GetBankIdentity_permutated(u8 slot) {
    u8 status;
    if (!NotInBattle()) {
        status = GetBankIdentity(slot);
        if (status == 0 || status == 3) {
            return 2;
        } else {
            return 1;
        }
    }
    return 1;
}

u8 sub_8079F44(u16 species, u8 isBackpic, u8 a3, s16 a4, s16 a5, u8 a6, u32 a7, u32 a8) {
    void *src;
    void *dest;
    int size;

    u8 sprite;
    u16 sheet = LoadSpriteSheet(&gUnknown_0837F5E0[a3]);
    u16 palette = AllocSpritePalette(gSpriteTemplate_837F5B0[a3].paletteTag);
    if (!isBackpic) {
        LoadCompressedPalette(GetMonSpritePalFromOtIdPersonality(species, a8, a7), (palette * 0x10) + 0x100, 0x20);
        LoadSpecialPokePic(
            &gMonFrontPicTable[species],
            gMonFrontPicCoords[species].coords,
            gMonFrontPicCoords[species].y_offset,
            0x2000000,
            (void *)0x2000000,
            species,
            a7,
            1
        );
    } else {
        LoadCompressedPalette(
            GetMonSpritePalFromOtIdPersonality(species, a8, a7), (palette * 0x10) + 0x100, 0x20);
        LoadSpecialPokePic(
            &gMonBackPicTable[species],
            gMonBackPicCoords[species].coords,
            gMonBackPicCoords[species].y_offset,
            0x2000000,
            (void *)0x2000000,
            species,
            a7,
            0
        );
    }

    src = (void *)0x2000000;
    dest = (void *)(0x6010000 + (sheet * 0x20));
    size = 0x800;
    DmaCopy32(3, src, dest, size);

    if (!isBackpic) {
        sprite = CreateSprite(&gSpriteTemplate_837F5B0[a3], a4, a5 + gMonFrontPicCoords[species].y_offset, a6);
    } else {
        sprite = CreateSprite(&gSpriteTemplate_837F5B0[a3], a4, a5 + gMonBackPicCoords[species].y_offset, a6);
    }
    if (NotInBattle()) {
        gSprites[sprite].affineAnims = &gSpriteAffineAnimTable_81E7C18;
        StartSpriteAffineAnim(&gSprites[sprite], 0);
    }
    return sprite;
}

void sub_807A0F4(struct Sprite *sprite) {
    DestroySpriteAndFreeResources(sprite);
}

int sub_807A100(u8 slot, u8 a2) {
    u16 species;
    u32 personality;
    u16 letter;
    u16 var;
    int ret;
    const struct MonCoords *coords;
    struct TransformStatus *transform;
    if (NotInBattle()) {
        if (ewram19348.unk4 & 1) {
            species = ewram19348.unk2;
            personality = ewram19348.unk10;
        } else {
            species = ewram19348.unk0;
            personality = ewram19348.unk8;
        }
        if (species == SPECIES_UNOWN) {
            letter = GET_UNOWN_LETTER(personality);
            if (!letter) {
                var = SPECIES_UNOWN;
            } else {
                var = letter + SPECIES_UNOWN_B - 1;
            }
            coords = &gMonBackPicCoords[var];
        } else if (species == SPECIES_CASTFORM) {
            coords = &gCastformFrontSpriteCoords[gBattleMonForms[slot]];
        } else if (species <= SPECIES_EGG) {
            coords = &gMonBackPicCoords[species];
        } else {
            coords = &gMonBackPicCoords[0];
        }
    } else {
        if (!GetBankSide(slot)) {
            transform = &eTransformStatuses[slot];
            if (!transform->species) {
                species = GetMonData(&gPlayerParty[gBattleMonPartyPositions[slot]], MON_DATA_SPECIES);
                personality = GetMonData(&gPlayerParty[gBattleMonPartyPositions[slot]], MON_DATA_PERSONALITY);
            } else {
                species = transform->species;
                personality = gTransformPersonalities[slot];
            }
            if (species == SPECIES_UNOWN) {
                letter = GET_UNOWN_LETTER(personality);
                if (!letter) {
                    var = SPECIES_UNOWN;
                } else {
                    var = letter + SPECIES_UNOWN_B - 1;
                }
                coords = &gMonBackPicCoords[var];
            } else if (species > SPECIES_EGG) {
                coords = &gMonBackPicCoords[0];
            } else {
                coords = &gMonBackPicCoords[species];
            }
        } else {
            transform = &eTransformStatuses[slot];
            if (!transform->species) {
                species = GetMonData(&gEnemyParty[gBattleMonPartyPositions[slot]], MON_DATA_SPECIES);
                personality = GetMonData(&gEnemyParty[gBattleMonPartyPositions[slot]], MON_DATA_PERSONALITY);
            } else {
                species = transform->species;
                personality = gTransformPersonalities[slot];
            }
            if (species == SPECIES_UNOWN) {
                letter = GET_UNOWN_LETTER(personality);
                if (!letter) {
                    var = SPECIES_UNOWN;
                } else {
                    var = letter + SPECIES_UNOWN_B - 1;
                }
                coords = &gMonFrontPicCoords[var];
            } else if (species == SPECIES_CASTFORM) {
                coords = &gCastformFrontSpriteCoords[gBattleMonForms[slot]];
            } else if (species > SPECIES_EGG) {
                coords = &gMonFrontPicCoords[0];
            } else {
                coords = &gMonFrontPicCoords[species];
            }
        }
    }

    switch (a2) {
    case 0:
        return (coords->coords & 0xf) * 8;
    case 1:
        return (coords->coords >> 4) * 8;
    case 4:
        return sub_8077ABC(slot, 2) - ((coords->coords >> 4) * 4);
    case 5:
        return sub_8077ABC(slot, 2) + ((coords->coords >> 4) * 4);
    case 2:
        return sub_8077ABC(slot, 3) - ((coords->coords & 0xf) * 4);
    case 3:
        return sub_8077ABC(slot, 3) + ((coords->coords & 0xf) * 4);
    case 6:
        ret = sub_8077ABC(slot, 1) + 0x1f;
        return ret - coords->y_offset;
    default:
        return 0;
    }
}

void sub_807A3FC(u8 slot, u8 a2, s16 *a3, s16 *a4) {
    u8 v1, v2;
    s16 v3, v4;
    s16 v5, v6;
    if (!a2) {
        v1 = 0;
        v2 = 1;
    } else {
        v1 = 2;
        v2 = 3;
    }
    v3 = sub_8077ABC(slot, v1);
    v4 = sub_8077ABC(slot, v2);
    if (IsDoubleBattle() && !NotInBattle()) {
        v5 = sub_8077ABC(slot ^ 2, v1);
        v6 = sub_8077ABC(slot ^ 2, v2);
    } else {
        v5 = v3;
        v6 = v4;
    }
    *a3 = (v3 + v5) / 2;
    *a4 = (v4 + v6) / 2;
}

u8 sub_807A4A0(int a1, u8 sprite, int a3) {
    u8 new_sprite = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    gSprites[new_sprite] = gSprites[sprite];
    gSprites[new_sprite].usingSheet = TRUE;
    gSprites[new_sprite].oam.priority = 0;
    gSprites[new_sprite].oam.objMode = 2;
    gSprites[new_sprite].oam.tileNum = gSprites[sprite].oam.tileNum;
    gSprites[new_sprite].callback = SpriteCallbackDummy;
    return new_sprite;
}

void sub_807A544(struct Sprite *sprite) {
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimBankAttacker)) {
        sprite->pos1.x -= gBattleAnimArgs[0];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
        sprite->hFlip = TRUE;
    } else {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[4];
    sprite->data[5] = gBattleAnimArgs[5];
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078504;
}

void sub_807A5C4(struct Sprite *sprite) {
    if (GetBankSide(gBattleAnimBankAttacker)) {
        sprite->pos1.x -= gBattleAnimArgs[0];
        gBattleAnimArgs[3] *= -1;
    } else {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[3] = gBattleAnimArgs[4];
    sprite->data[5] = gBattleAnimArgs[5];
    StartSpriteAnim(sprite, gBattleAnimArgs[6]);
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_8078504;
}

void sub_807A63C(struct Sprite *sprite) {
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimBankAttacker)) {
        sprite->pos1.x -= gBattleAnimArgs[0];
    } else {
        sprite->pos1.x += gBattleAnimArgs[0];
    }
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}

void sub_807A69C(u8 taskId) {
    u16 src;
    u16 dest;
    struct Task *task = &gTasks[taskId];
    task->data[0] = GetAnimBankSpriteId(0);
    task->data[1] = (GetBankSide(gBattleAnimBankAttacker)) ? -8 : 8;
    task->data[2] = 0;
    task->data[3] = 0;
    gSprites[task->data[0]].pos2.x -= task->data[0];
    task->data[4] = AllocSpritePalette(10097);
    task->data[5] = 0;

    dest = (task->data[4] + 0x10) * 0x10;
    src = (gSprites[task->data[0]].oam.paletteNum + 0x10) * 0x10;
    task->data[6] = sub_8079E90(gBattleAnimBankAttacker);
    if (task->data[6] == 20 || task->data[6] == 40) {
        task->data[6] = 2;
    } else {
        task->data[6] = 3;
    }
    CpuCopy32(&gPlttBufferUnfaded[src], &gPlttBufferFaded[dest], 0x20);
    BlendPalette(dest, 0x10, gBattleAnimArgs[1], gBattleAnimArgs[0]);
    task->func = sub_807A784;
}

void sub_807A784(u8 taskId) {
    struct Task *task = &gTasks[taskId];
    switch (task->data[2]) {
    case 0:
        sub_807A850(task, taskId);
        gSprites[task->data[0]].pos2.x += task->data[1];
        if (++task->data[3] == 5) {
            task->data[3]--;
            task->data[2]++;
        }
        break;
    case 1:
        sub_807A850(task, taskId);
        gSprites[task->data[0]].pos2.x -= task->data[1];
        if (--task->data[3] == 0) {
            gSprites[task->data[0]].pos2.x = 0;
            task->data[2]++;
        }
        break;
    case 2:
        if (!task->data[5]) {
            FreeSpritePaletteByTag(10097);
            DestroyAnimVisualTask(taskId);
        }
        break;
    }
}

void sub_807A850(struct Task *task, u8 taskId) {
    s16 sprite = duplicate_obj_of_side_rel2move_in_transparent_mode(0);
    if (sprite >= 0) {
        gSprites[sprite].oam.priority = task->data[6];
        gSprites[sprite].oam.paletteNum = task->data[4];
        gSprites[sprite].data[0] = 8;
        gSprites[sprite].data[1] = taskId;
        gSprites[sprite].data[2] = sprite;
        gSprites[sprite].pos2.x = gSprites[task->data[0]].pos2.x;
        gSprites[sprite].callback = sub_807A8D4;
        task->data[5]++;
    }
}

void sub_807A8D4(struct Sprite *sprite) {
    if (--sprite->data[0] == 0) {
        gTasks[sprite->data[1]].data[5]--;
        obj_delete_but_dont_free_vram(sprite);
    }
}

void sub_807A908(struct Sprite *sprite) {
    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
    if (!GetBankSide(gBattleAnimBankAttacker)) {
        sprite->data[0] = 5;
    } else {
        sprite->data[0] = -10;
    }
    sprite->data[1] = -40;
    sprite->callback = sub_807A960;
}

void sub_807A960(struct Sprite *sprite) {
    sprite->data[2] += sprite->data[0];
    sprite->data[3] += sprite->data[1];
    sprite->pos2.x = sprite->data[2] / 10;
    sprite->pos2.y = sprite->data[3] / 10;
    if (sprite->data[1] < -20) {
        sprite->data[1]++;
    }
    if ((sprite->pos1.y + sprite->pos2.y) < -32) {
        move_anim_8072740(sprite);
    }
}

void sub_807A9BC(struct Sprite *sprite) {
    int x;
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[4];
    sprite->data[4] = sprite->pos1.y + gBattleAnimArgs[5];
    if (!GetBankSide(gBattleAnimBankTarget)) {
        x = (u16)gBattleAnimArgs[4] + 30;
        sprite->pos1.x += x;
        sprite->pos1.y = gBattleAnimArgs[5] - 20;
    } else {
        x = (u16)gBattleAnimArgs[4] - 30;
        sprite->pos1.x += x;
        sprite->pos1.y = gBattleAnimArgs[5] - 80;
    }
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}
