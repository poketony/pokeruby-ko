#ifndef GUARD_SHOP_H
#define GUARD_SHOP_H

enum
{
    MART_TYPE_0, // normal mart
    MART_TYPE_1,
    MART_TYPE_2,
};

// shop view window NPC info enum
enum
{
    MAP_OBJ_ID,
    X_COORD,
    Y_COORD,
    ANIM_NUM
};

struct MartInfo
{
    /* 0x0 */ void (* callback) (void);
    /* 0x4 */ u16 *itemList;
    /* 0x8 */ u8 itemCount; // how many unique items are there for sale?
    /* 0x9 */ u8 cursor; // this shows the on-screen true index of the cursor and not the current item selected.
    /* 0xA */ u8 numChoices; // how many options does the mart have? can be either 2 or 1 (BUY/SELL vs BUY)
    /* 0xB */ u8 choicesAbove; // when your cursor is far down, there are choices that have scrolled up past the top. this is the count of that.
    /* 0xC */ u8 martType; // 0-2. 0 is normal mart while 1-2 seem to be decor shops or non-stackable purchases in general.
    /* 0xD */ u8 curItemCount; // if you are selling an item, this is the count of the current item stack you have.
};

void sub_80B2E38(u8);
void HandleShopMenuQuit(u8);
void sub_80B2FA0(u8);
void BuyMenuDrawGraphics(void);
void sub_80B3240(void);
void sub_80B3270(void);
void BuyMenuDrawMapGraphics(void);
void sub_80B3764(int, int);
void sub_80B37EC(void);
void sub_80B40E8(u8);
void CreatePokemartMenu(u16 *);
void CreateDecorationShop1Menu(u16 *);
void CreateDecorationShop2Menu(u16 *);
void sub_80B356C(void);
void sub_80B368C(void);

#endif // GUARD_SHOP_H
