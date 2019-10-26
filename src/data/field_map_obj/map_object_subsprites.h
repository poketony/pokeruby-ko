//

//

#ifndef POKERUBY_MAP_OBJECT_SUBSPRITES_H
#define POKERUBY_MAP_OBJECT_SUBSPRITES_H

const struct Subsprite gMapObjectSubspriteTable_16x16_0[] = {
    { -8,  -8, 0, 1, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_16x16_1[] = {
    { -8,  -8, 0, 1, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_16x16_2[] = {
    { -8,  -8, 1, 0, 0, 2},
    { -8,   0, 1, 0, 2, 3}
};

const struct Subsprite gMapObjectSubspriteTable_16x16_3[] = {
    { -8,  -8, 0, 1, 0, 2},
    { -8,  -8, 0, 1, 0, 3}
};

const struct Subsprite gMapObjectSubspriteTable_16x16_4[] = {
    { -8,  -8, 0, 1, 0, 1},
    { -8,  -8, 0, 1, 0, 3}
};

const struct SubspriteTable gMapObjectSubspriteTables_16x16[] = {
    {0, NULL},
    {1, gMapObjectSubspriteTable_16x16_0},
    {1, gMapObjectSubspriteTable_16x16_1},
    {2, gMapObjectSubspriteTable_16x16_2},
    {2, gMapObjectSubspriteTable_16x16_3},
    {2, gMapObjectSubspriteTable_16x16_4}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_0[] = {
    { -8, -16, 2, 2, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_1[] = {
    { -8, -16, 2, 2, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_2[] = {
    { -8, -16, 0, 1, 0, 2},
    { -8,   0, 1, 0, 4, 2},
    { -8,   8, 1, 0, 6, 3}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_3[] = {
    { -8, -16, 0, 1, 0, 2},
    { -8,   0, 0, 1, 4, 3}
};

const struct Subsprite gMapObjectSubspriteTable_16x32_4[] = {
    { -8, -16, 0, 1, 0, 1},
    { -8,   0, 0, 1, 4, 3}
};

const struct SubspriteTable gMapObjectSubspriteTables_16x32[] = {
    {0, NULL},
    {1, gMapObjectSubspriteTable_16x32_0},
    {1, gMapObjectSubspriteTable_16x32_1},
    {3, gMapObjectSubspriteTable_16x32_2},
    {2, gMapObjectSubspriteTable_16x32_3},
    {2, gMapObjectSubspriteTable_16x32_4}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_0[] = {
    {-16, -16, 0, 2, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_1[] = {
    {-16, -16, 0, 2, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_2[] = {
    {-16, -16, 1, 2, 0, 2},
    {-16,   0, 1, 1, 8, 2},
    {-16,   8, 1, 1, 12, 3}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_3[] = {
    {-16, -16, 1, 2, 0, 2},
    {-16,   0, 1, 2, 8, 3}
};

const struct Subsprite gMapObjectSubspriteTable_32x32_4[] = {
    {-16, -16, 1, 2, 0, 1},
    {-16,   0, 1, 2, 8, 3}
};

const struct SubspriteTable gMapObjectSubspriteTables_32x32[] = {
    {0, NULL},
    {1, gMapObjectSubspriteTable_32x32_0},
    {1, gMapObjectSubspriteTable_32x32_1},
    {3, gMapObjectSubspriteTable_32x32_2},
    {2, gMapObjectSubspriteTable_32x32_3},
    {2, gMapObjectSubspriteTable_32x32_4}
};

const struct Subsprite gMapObjectSubspriteTable_Truck_0[] = {
    {-24, -24, 1, 1, 0, 2},
    {  8, -24, 1, 0, 4, 2},
    {-24, -16, 1, 1, 6, 2},
    {  8, -16, 1, 0, 10, 2},
    {-24,  -8, 1, 1, 12, 2},
    {  8,  -8, 1, 0, 16, 2},
    {-24,   0, 1, 1, 18, 2},
    {  8,   0, 1, 0, 22, 2},
    {-24,   8, 1, 1, 24, 2},
    {  8,   8, 1, 0, 28, 2},
    {-24,  16, 1, 1, 30, 2},
    {  8,  16, 1, 0, 34, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_Truck[] = {
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0},
    {12, gMapObjectSubspriteTable_Truck_0}
};

const struct Subsprite gMapObjectSubspriteTable_Unused_0[] = {
    {-32, -16, 1, 3, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_Unused_1[] = {
    {-32, -16, 1, 3, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_Unused_2[] = {
    {-32, -16, 1, 3, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_Unused_3[] = {
    {-32, -16, 1, 3, 0, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_Unused[] = {
    {0, NULL},
    {1, gMapObjectSubspriteTable_Unused_0},
    {1, gMapObjectSubspriteTable_Unused_1},
    {1, gMapObjectSubspriteTable_Unused_2},
    {1, gMapObjectSubspriteTable_Unused_3},
    {1, gMapObjectSubspriteTable_Unused_3}
};

const struct Subsprite gMapObjectSubspriteTable_CableCar_0[] = {
    {-32, -32, 0, 3, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_CableCar_1[] = {
    {-32, -32, 0, 3, 0, 1}
};

const struct Subsprite gMapObjectSubspriteTable_CableCar_2[] = {
    {-32, -32, 0, 3, 0, 2}
};

const struct Subsprite gMapObjectSubspriteTable_CableCar_3[] = {
    {-32, -32, 0, 3, 0, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_CableCar[] = {
    {0, NULL},
    {1, gMapObjectSubspriteTable_CableCar_0},
    {1, gMapObjectSubspriteTable_CableCar_1},
    {1, gMapObjectSubspriteTable_CableCar_2},
    {1, gMapObjectSubspriteTable_CableCar_3},
    {1, gMapObjectSubspriteTable_CableCar_3}
};

const struct Subsprite gMapObjectSubspriteTable_SSTidal_0[] = {
    {-48, -20, 1, 1, 0, 2},
    {-16, -20, 1, 1, 4, 2},
    { 16, -20, 1, 1, 8, 2},
    {-48, -12, 1, 1, 12, 2},
    {-16, -12, 1, 1, 16, 2},
    { 16, -12, 1, 1, 20, 2},
    {-48,  -4, 1, 1, 24, 2},
    {-16,  -4, 1, 1, 28, 2},
    { 16,  -4, 1, 1, 32, 2},
    {-48,   4, 1, 1, 36, 2},
    {-16,   4, 1, 1, 40, 2},
    { 16,   4, 1, 1, 44, 2},
    {-48,  12, 1, 1, 48, 2},
    {-16,  12, 1, 1, 52, 2},
    { 16,  12, 1, 1, 56, 2}
};

const struct Subsprite gMapObjectSubspriteTable_SSTidal_1[] = {
    {-48, -20, 1, 1, 0, 1},
    {-16, -20, 1, 1, 4, 1},
    { 16, -20, 1, 1, 8, 1},
    {-48, -12, 1, 1, 12, 1},
    {-16, -12, 1, 1, 16, 1},
    { 16, -12, 1, 1, 20, 1},
    {-48,  -4, 1, 1, 24, 1},
    {-16,  -4, 1, 1, 28, 1},
    { 16,  -4, 1, 1, 32, 1},
    {-48,   4, 1, 1, 36, 1},
    {-16,   4, 1, 1, 40, 1},
    { 16,   4, 1, 1, 44, 1},
    {-48,  12, 1, 1, 48, 1},
    {-16,  12, 1, 1, 52, 1},
    { 16,  12, 1, 1, 56, 1}
};

const struct Subsprite gMapObjectSubspriteTable_SSTidal_2[] = {
    {-48, -20, 1, 1, 0, 2},
    {-16, -20, 1, 1, 4, 2},
    { 16, -20, 1, 1, 8, 2},
    {-48, -12, 1, 1, 12, 2},
    {-16, -12, 1, 1, 16, 2},
    { 16, -12, 1, 1, 20, 2},
    {-48,  -4, 1, 1, 24, 2},
    {-16,  -4, 1, 1, 28, 2},
    { 16,  -4, 1, 1, 32, 2},
    {-48,   4, 1, 1, 36, 2},
    {-16,   4, 1, 1, 40, 2},
    { 16,   4, 1, 1, 44, 2},
    {-48,  12, 1, 1, 48, 2},
    {-16,  12, 1, 1, 52, 2},
    { 16,  12, 1, 1, 56, 2}
};

const struct Subsprite gMapObjectSubspriteTable_SSTidal_3[] = {
    {-48, -20, 1, 1, 0, 1},
    {-16, -20, 1, 1, 4, 1},
    { 16, -20, 1, 1, 8, 1},
    {-48, -12, 1, 1, 12, 1},
    {-16, -12, 1, 1, 16, 1},
    { 16, -12, 1, 1, 20, 1},
    {-48,  -4, 1, 1, 24, 2},
    {-16,  -4, 1, 1, 28, 2},
    { 16,  -4, 1, 1, 32, 2},
    {-48,   4, 1, 1, 36, 2},
    {-16,   4, 1, 1, 40, 2},
    { 16,   4, 1, 1, 44, 2},
    {-48,  12, 1, 1, 48, 2},
    {-16,  12, 1, 1, 52, 2},
    { 16,  12, 1, 1, 56, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_SSTidal[] = {
    {15, gMapObjectSubspriteTable_SSTidal_0},
    {15, gMapObjectSubspriteTable_SSTidal_0},
    {15, gMapObjectSubspriteTable_SSTidal_1},
    {15, gMapObjectSubspriteTable_SSTidal_2},
    {15, gMapObjectSubspriteTable_SSTidal_3},
    {15, gMapObjectSubspriteTable_SSTidal_3}
};

const struct Subsprite gMapObjectSubspriteTable_SubmarineShadow_0[] = {
    {-48, -20, 1, 1, 0, 2},
    {-16, -20, 1, 1, 4, 2},
    { 16, -20, 1, 0, 8, 2},
    { 32, -20, 0, 0, 10, 2},
    {-48, -12, 1, 1, 11, 2},
    {-16, -12, 1, 1, 15, 2},
    { 16, -12, 1, 0, 19, 2},
    { 32, -12, 0, 0, 21, 2},
    {-48,  -4, 1, 1, 22, 2},
    {-16,  -4, 1, 1, 26, 2},
    { 16,  -4, 1, 0, 30, 2},
    { 32,  -4, 0, 0, 32, 2},
    {-48,   4, 1, 1, 33, 2},
    {-16,   4, 1, 1, 37, 2},
    { 16,   4, 1, 0, 41, 2},
    { 32,   4, 0, 0, 43, 2}
};

const struct Subsprite gMapObjectSubspriteTable_SubmarineShadow_1[] = {
    {-48, -20, 1, 1, 0, 1},
    {-16, -20, 1, 1, 4, 1},
    { 16, -20, 1, 0, 8, 1},
    { 32, -20, 0, 0, 10, 1},
    {-48, -12, 1, 1, 11, 1},
    {-16, -12, 1, 1, 15, 1},
    { 16, -12, 1, 0, 19, 1},
    { 32, -12, 0, 0, 21, 1},
    {-48,  -4, 1, 1, 22, 1},
    {-16,  -4, 1, 1, 26, 1},
    { 16,  -4, 1, 0, 30, 1},
    { 32,  -4, 0, 0, 32, 1},
    {-48,   4, 1, 1, 33, 1},
    {-16,   4, 1, 1, 37, 1},
    { 16,   4, 1, 0, 41, 1},
    { 32,   4, 0, 0, 43, 1}
};

const struct Subsprite gMapObjectSubspriteTable_SubmarineShadow_2[] = {
    {-48, -20, 1, 1, 0, 2},
    {-16, -20, 1, 1, 4, 2},
    { 16, -20, 1, 0, 8, 2},
    { 32, -20, 0, 0, 10, 2},
    {-48, -12, 1, 1, 11, 2},
    {-16, -12, 1, 1, 15, 2},
    { 16, -12, 1, 0, 19, 2},
    { 32, -12, 0, 0, 21, 2},
    {-48,  -4, 1, 1, 22, 2},
    {-16,  -4, 1, 1, 26, 2},
    { 16,  -4, 1, 0, 30, 2},
    { 32,  -4, 0, 0, 32, 2},
    {-48,   4, 1, 1, 33, 2},
    {-16,   4, 1, 1, 37, 2},
    { 16,   4, 1, 0, 41, 2},
    { 32,   4, 0, 0, 43, 2}
};

const struct Subsprite gMapObjectSubspriteTable_SubmarineShadow_3[] = {
    {-48, -20, 1, 1, 0, 1},
    {-16, -20, 1, 1, 4, 1},
    { 16, -20, 1, 0, 8, 1},
    { 32, -20, 0, 0, 10, 1},
    {-48, -12, 1, 1, 11, 1},
    {-16, -12, 1, 1, 15, 1},
    { 16, -12, 1, 0, 19, 1},
    { 32, -12, 0, 0, 21, 1},
    {-48,  -4, 1, 1, 22, 2},
    {-16,  -4, 1, 1, 26, 2},
    { 16,  -4, 1, 0, 30, 2},
    { 32,  -4, 0, 0, 32, 2},
    {-48,   4, 1, 1, 33, 2},
    {-16,   4, 1, 1, 37, 2},
    { 16,   4, 1, 0, 41, 2},
    { 32,   4, 0, 0, 43, 2}
};

const struct SubspriteTable gMapObjectSubspriteTables_SubmarineShadow[] = {
    {16, gMapObjectSubspriteTable_SubmarineShadow_0},
    {16, gMapObjectSubspriteTable_SubmarineShadow_0},
    {16, gMapObjectSubspriteTable_SubmarineShadow_1},
    {16, gMapObjectSubspriteTable_SubmarineShadow_2},
    {16, gMapObjectSubspriteTable_SubmarineShadow_3},
    {16, gMapObjectSubspriteTable_SubmarineShadow_3}
};
#endif //POKERUBY_MAP_OBJECT_SUBSPRITES_H
