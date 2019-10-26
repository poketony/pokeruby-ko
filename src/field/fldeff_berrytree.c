#include "global.h"
#include "field_map_obj.h"
#include "field_player_avatar.h"
#include "script.h"

static void Task_WateringBerryTreeAnim_0(u8);
static void Task_WateringBerryTreeAnim_1(u8);
static void Task_WateringBerryTreeAnim_2(u8);
static void Task_WateringBerryTreeAnim_3(u8);

static void Task_WateringBerryTreeAnim_0(u8 taskId)
{
    gTasks[taskId].func = Task_WateringBerryTreeAnim_1;
}

static void Task_WateringBerryTreeAnim_1(u8 taskId)
{
    struct MapObject *mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(mapObject)
        || FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        sub_8059D08(player_get_direction_lower_nybble());
        FieldObjectSetSpecialAnim(mapObject, GetStepInPlaceDelay16AnimId(player_get_direction_lower_nybble()));
        gTasks[taskId].func = Task_WateringBerryTreeAnim_2;
    }
}

static void Task_WateringBerryTreeAnim_2(u8 taskId)
{
    struct MapObject *mapObject = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        s16 value = gTasks[taskId].data[1]++;
        
        if (value < 10)
        {
            FieldObjectSetSpecialAnim(mapObject, GetStepInPlaceDelay16AnimId(player_get_direction_lower_nybble()));
        }
        else
        {
            gTasks[taskId].func = Task_WateringBerryTreeAnim_3;
        }
    }
}

static void Task_WateringBerryTreeAnim_3(u8 taskId)
{
    SetPlayerAvatarTransitionFlags(sub_80597D0());
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

void DoWateringBerryTreeAnim(void)
{
    CreateTask(Task_WateringBerryTreeAnim_0, 80);
}
