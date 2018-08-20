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
#include "soc.h"
#include "test_device.h"

int test_vic(void)
{
    uint8_t *p;

    printf("Testing VIC api\n");

    ASSERT_TRUE((uint32_t *) & (VIC->ISER) == (uint32_t *)0xE000E100);
    ASSERT_TRUE((uint32_t *) & (VIC->IWER) == (uint32_t *)0xE000E140);
    ASSERT_TRUE((uint32_t *) & (VIC->ICER) == (uint32_t *)0xE000E180);
    ASSERT_TRUE((uint32_t *) & (VIC->ICPR) == (uint32_t *)0xE000E280);
    ASSERT_TRUE((uint32_t *) & (VIC->IABR) == (uint32_t *)0xE000E300);
    ASSERT_TRUE((uint32_t *) & (VIC->IPR) == (uint32_t *)0xE000E400);
    ASSERT_TRUE((uint32_t *) & (VIC->ISR) == (uint32_t *)0xE000EC00);
    ASSERT_TRUE((uint32_t *) & (VIC->IPTR) == (uint32_t *)0xE000EC04);

    VIC_Type free_mem;

#undef VIC
#define VIC	((VIC_Type *) &free_mem)

    p = (uint8_t *)&free_mem;
    VIC->IWER[0U] = 0x12345678;
    ASSERT_TRUE(*(uint32_t *)(p + 0x40) == 0x12345678);

    VIC->IABR[0U] = 0x22345678;
    ASSERT_TRUE(*(uint32_t *)(p + 0x200) == 0x22345678);

    VIC->IPTR = 0x32345678;
    ASSERT_TRUE(*(uint32_t *)(p + 0xB04) == 0x32345678);

    return 0;
}
