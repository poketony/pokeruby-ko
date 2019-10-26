#ifndef GUARD_ROM4_H
#define GUARD_ROM4_H

#include "sprite.h"

struct UnkPlayerStruct
{
    u8 player_field_0;
    u8 player_field_1;
};

struct LinkPlayerMapObject
{
    u8 active;
    u8 linkPlayerId;
    u8 mapObjId;
    u8 mode;
};

struct UCoords32
{
    u32 x, y;
};

extern const struct UCoords32 gUnknown_0821664C[];
extern void (*gFieldCallback)(void);

// sub_8052F5C
void Overworld_ResetStateAfterFly(void);
void Overworld_ResetStateAfterTeleport(void);
void Overworld_ResetStateAfterDigEscRope(void);
void Overworld_ResetStateAfterWhiteOut(void);
// sub_805308C
void ResetGameStats(void);
void IncrementGameStat(u8 index);
u32 GetGameStat(u8 index);
void SetGameStat(u8, u32);
// LoadMapObjTemplatesFromHeader
// LoadSaveblockMapObjScripts
void Overworld_SetMapObjTemplateCoords(u8, s16, s16);
void Overworld_SetMapObjTemplateMovementType(u8, u8);
// mapdata_load_assets_to_gpu_and_full_redraw
// get_mapdata_header
// ApplyCurrentWarp
// SetWarpData
// warp_data_is_not_neg_1
struct MapHeader * const Overworld_GetMapHeaderByGroupAndId(u16 mapGroup, u16 mapNum);
struct MapHeader * const warp1_get_mapheader(void);
// set_current_map_header_from_sav1_save_old_name
// LoadSaveblockMapHeader
// sub_80533CC
void warp_in(void);
void Overworld_SetWarpDestination(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void warp1_set_2(s8 mapGroup, s8 mapNum, s8 warpId);
void saved_warp2_set(int unused, s8 mapGroup, s8 mapNum, s8 warpId);
void saved_warp2_set_2(int unused, s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void copy_saved_warp2_bank_and_enter_x_to_warp1(u8 unused);
void sub_8053538(u8);
void Overworld_SetWarpDestToLastHealLoc(void);
void Overworld_SetHealLocationWarp(u8);
void sub_80535C4(s16 a1, s16 a2);
void sub_805363C(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y);
void sub_8053678(void);
void sub_8053690(s8, s8, s8, s8, s8);
// warp1_set_to_warp2
void sub_80536E4(s8, s8, s8, s8, s8);
void sub_8053720(s16, s16);
// sub_8053778
// unref_sub_8053790
void sub_80537CC(u8);
void gpu_sync_bg_hide();
// GetMapConnection
// sub_8053850
bool8 sub_80538B0(u16 x, u16 y);
bool8 sub_80538D0(u16 x, u16 y);
void sub_80538F0(u8 mapGroup, u8 mapNum);
// sub_8053994
void player_avatar_init_params_reset(void);
void walkrun_find_lowest_active_bit_in_bitfield(void);
// sub_8053AA8
u8 sub_8053B00(struct UnkPlayerStruct *playerStruct, u16 a2, u8 a3);
u8 sub_8053B60(struct UnkPlayerStruct *playerStruct, u8, u16, u8);
u16 cur_mapdata_block_role_at_screen_center_acc_to_sav1(void);
bool32 Overworld_IsBikingAllowed(void);
void SetDefaultFlashLevel(void);
void Overworld_SetFlashLevel(s32 a1);
u8 Overworld_GetFlashLevel(void);
void sub_8053D14(u16);
// sub_8053D30
// sub_8053D6C
// GetLocationMusic
// GetCurrLocationDefaultMusic
// GetWarpDestinationMusic
// Overworld_ResetMapMusic
void Overworld_PlaySpecialMapMusic(void);
void Overworld_SetSavedMusic(u16);
void Overworld_ClearSavedMusic(void);
void sub_8053F0C(void);
void Overworld_ChangeMusicToDefault(void);
void Overworld_ChangeMusicTo(u16);
// GetMapMusicFadeoutSpeed
void sub_8053FF8(void);
bool8 sub_8054034(void);
void Overworld_FadeOutMapMusic(void);
// PlayAmbientCry
void UpdateAmbientCry(s16 *, u16 *);
void ChooseAmbientCrySpecies(void);
u8 GetMapTypeByGroupAndId(s8 mapGroup, s8 mapNum);
// GetMapTypeByWarpData
u8 Overworld_GetMapTypeOfSaveblockLocation(void);
u8 get_map_type_from_warp0(void);
bool8 is_map_type_1_2_3_5_or_6(u8 a1);
bool8 Overworld_MapTypeAllowsTeleportAndFly(u8 a1);
u8 Overworld_MapTypeIsIndoors(u8);
// unref_sub_8054260
u8 sav1_map_get_name();
// sav1_map_get_battletype
// ResetSafariZoneFlag_
bool32 is_c1_link_related_active(void);
// c1_overworld_normal
// c1_overworld
// OverworldBasic
void CB2_OverworldBasic(void);
void c2_overworld(void);
// set_callback1
// sub_80543DC
// sub_80543E8
void CB2_NewGame(void);
void CB2_WhiteOut(void);
void CB2_LoadMap(void);
void CB2_LoadMap2(void);
void sub_8054534(void);
void sub_8054588(void);
void c2_80567AC(void);
void c2_exit_to_overworld_2_switch(void);
void c2_exit_to_overworld_2_local(void);
void c2_exit_to_overworld_2_link(void);
// sub_805465C
void sub_805469C(void);
// sub_80546B8
void c2_exit_to_overworld_1_continue_scripts_restart_music(void);
void sub_80546F0(void);
// sub_805470C
void CB2_ContinueSavedGame(void);
void FieldClearVBlankHBlankCallbacks(void);
void SetFieldVBlankCallback(void);
void VBlankCB_Field(void);
// sub_8054814
bool32 sub_805483C(u8 *);
bool32 sub_805493C(u8 *, u32);
bool32 sub_8054A4C(u8 *);
bool32 sub_8054A9C(u8 *a1);
void do_load_map_stuff_loop(u8 *a1);
void sub_8054BA8(void);
void sub_8054C2C(void);
void sub_8054C54(void);
void sub_8054D4C(u32 a1);
void sub_8054D90(void);
void mli4_mapscripts_and_other(void);
void sub_8054E20(void);
void sub_8054E34(void);
void sub_8054E60(void);
void sub_8054E7C(void);
void sub_8054E98(void);
void sub_8054EC8(void);
void sub_8054F48(void);
void sub_8054F70(void);
// sub_8054F88
// sub_8054FC0
// sub_8054FF8
// sub_8055218
// sub_8055280
// sub_80552B0
u16 sub_805530C(u16);
void sub_8055340(u16 *);
void sub_8055354(void);
u16 sub_8055390(u32);
// sub_80553E0
u16 sub_80553E4(u32);
u16 sub_8055408(u32);
u16 sub_8055438(u32);
// sub_8055468
// sub_805546C
// sub_80554A4
// sub_80554B8
// sub_80554BC
// sub_80554E4
// sub_80554F8
// unref_sub_8055568
// sub_8055574
u16 sub_8055588(void);
// sub_805559C
void sub_80555B0(int linkPlayerId, int a2, struct UnkStruct_8054FF8 *a3);
bool32 sub_8055618(struct UnkStruct_8054FF8 *);
bool32 sub_8055630(struct UnkStruct_8054FF8 *);
u8 *sub_8055648(struct UnkStruct_8054FF8 *);
bool32 sub_8055660(struct UnkStruct_8054FF8 *);
u8 *sub_805568C(struct UnkStruct_8054FF8 *);
u16 sub_8055758(u8 *);
void sub_80557E8(void);
void sub_80557F4(void);
void sub_8055808(u8 *);
void sub_8055824(void);
void sub_8055840(u8 *);
void sub_805585C(void);
bool32 sub_8055870(void);
u32 sub_80558AC(void);
u32 sub_8055910(void);
u32 sub_8055940(void);
// ZeroLinkPlayerMapObject
void strange_npc_table_clear(void);
// ZeroMapObject
void SpawnLinkPlayerMapObject(u8, s16, s16, u8);
void InitLinkPlayerMapObjectPos(struct MapObject *, s16, s16);
// unref_sub_8055A6C
// unref_sub_8055A9C
u8 sub_8055AE8(u8);
void sub_8055B08(u8, u16 *, u16 *);
u8 sub_8055B30(u8);
u8 sub_8055B50(u8);
// unref_sub_8055B74
u8 GetLinkPlayerIdAt(s16, s16);
void sub_8055BFC(u8, u8);
// sub_8055C68
// sub_8055C88
// sub_8055C8C
// sub_8055CAC
// sub_8055CB0
// sub_8055D18
// sub_8055D30
// sub_8055D38
u8 npc_something3(u8, u8);
u8 LinkPlayerDetectCollision(u8, u8, s16, s16);
void CreateLinkPlayerSprite(u8);
void SpriteCB_LinkPlayer(struct Sprite *);
void sub_805465C(void);

#endif // GUARD_ROM4_H
