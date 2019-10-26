#ifndef GUARD_SAVE_H
#define GUARD_SAVE_H

struct SaveSectionLocation
{
    u8 *data;
    u16 size;
};

struct SaveSection
{
    u8 data[0xFF4];
    u16 id;
    u16 checksum;
    u32 security;
    u32 counter;
}; // size is 0x1000

// headless save section?
struct UnkSaveSection
{
    u8 data[0xFF4];
    u32 security;
}; // size is 0xFF8

// Ruby/Sapphire's save data is Flash 128K, which is 32 save sectors.
#define NUM_SECTORS 32 // defined in agb_flash but not in a header

#define UNKNOWN_CHECK_VALUE 0x8012025

// SetDamagedSectorBits states
enum
{
    ENABLE,
    DISABLE,
    CHECK // unused
};

// Do save types
enum
{
    NORMAL_SAVE,
    LINK_SAVE,
    EREADER_SAVE, // mossdeep event
    HOF_SAVE,
    DIFFERENT_FILE_SAVE,
    HOF_DELETE_SAVE // unused
};

void ClearSaveData(void);
void ResetSaveCounters(void);
bool32 ManipulateSectorBits(u8 op, u8 bit);
u8 save_write_to_flash(u16 a1, const struct SaveSectionLocation *a2);
u8 HandleWriteSector(u16, const struct SaveSectionLocation *);
u8 HandleWriteSectorNBytes(u8 sector, u8 *data, u16 size);
u8 TryWriteSector(u8, u8 *);
u32 RestoreSaveBackupVarsAndIncrement(const struct SaveSectionLocation *location);
u32 RestoreSaveBackupVars(const struct SaveSectionLocation *location);
u8 sub_812550C(u16 a1, const struct SaveSectionLocation *location);
u8 sub_812556C(u16 a1, const struct SaveSectionLocation *location);
u8 sub_81255B8(u16, const struct SaveSectionLocation *location);
u8 sub_8125758(u16 a1, const struct SaveSectionLocation *location);
u8 sub_81257F0(u16 a1, const struct SaveSectionLocation *location);
u8 sub_812587C(u16 a1, const struct SaveSectionLocation *location);
u8 sub_81258BC(u16, const struct SaveSectionLocation *location);
u8 GetSaveValidStatus(const struct SaveSectionLocation *location);
u8 sub_8125B88(u8 a1, u8 *data, u16 size);
u8 DoReadFlashWholeSection(u8, struct SaveSection *);
u16 CalculateChecksum(void *, u16);
u8 HandleSavingData(u8 saveType);
u8 TrySavingData(u8 saveType);
u8 sub_8125D80(void);
bool8 sub_8125DA8(void);
u8 sub_8125DDC(void);
u8 sub_8125E04(void);
u8 sub_8125E2C(void);
bool8 sub_8125E6C(void);
u8 sub_8125EC8(u8 a1);
bool8 unref_sub_8125F4C(struct UnkSaveSection *a1);
u8 unref_sub_8125FA0(void);
u8 unref_sub_8125FF0(u8 *data, u16 size);
u8 unref_sub_8126068(u8 sector, u8 *data, u32 size);
u8 unref_sub_8126080(u8 sector, u8 *data);

#endif // GUARD_SAVE_H
