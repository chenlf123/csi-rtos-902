/*
 * Copyright (C) 2017 C-SKY Microsystems Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_cache(void)
{
#if __CK80X >= 3
    uint8_t *p;

    printf("Testing cache api\n");

    ASSERT_TRUE((uint32_t) & (CACHE->CER) == 0xE000F000);
    ASSERT_TRUE((uint32_t) & (CACHE->CIR) == 0xE000F004);
    ASSERT_TRUE((uint32_t) & (CACHE->CPFCR) == 0xE000FFF4);
    ASSERT_TRUE((uint32_t) & (CACHE->CPFATR) == 0xE000FFF8);

    CACHE_Type free_mem[0x1000];

#undef CACHE
#define CACHE	((CACHE_Type *) free_mem)

    p = (uint8_t *)free_mem;

    CACHE->CER = 0x12345678;
    ASSERT_TRUE(*(uint32_t *)p == 0x12345678);

    CACHE->CIR = 0x22345678;
    ASSERT_TRUE(*(uint32_t *)(p + 4) == 0x22345678);

    CACHE->CPFCR = 0x32345678;
    ASSERT_TRUE(*(uint32_t *)(p + 0xFF4) == 0x32345678);

    return 0;
#else
    printf("Testing cache api\n");
    return 0;
#endif
}
