#include "global.h"
#include "rng.h"

// The number 1103515245 comes from the example implementation of rand and srand
// in the ISO C standard.

u32 gRngValue;

u16 Random(void)
{
    gRngValue = 1103515245 * gRngValue + 24691;
    return gRngValue >> 16;
}

void SeedRng(u16 seed)
{
    gRngValue = seed;
}
