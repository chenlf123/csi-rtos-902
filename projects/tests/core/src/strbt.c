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

int test_strbt(void)
{
    int i = 0;
    unsigned int test_mem[20];
    tst_addr = (unsigned int *)&test_mem;

    printf("Testing functions __STRBT\n");

    /*
     * STRBT
     * 非特权模式下的8位数值存储
     *
     * __STRBT(0x12, FREE_MEM)
     * ASSERT_TRUE(*(uint8_t *)FREE_MEM == 0x12)
     */
    struct binary_calculation strbt_test[TEST_SIZE] = {
        {0, 0x12, 0x12},
        {1, 0x34, 0x34},
        {3, 0x78, 0x78}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        __STRBT(strbt_test[i].op2, (uint8_t *)(tst_addr + strbt_test[i].op1));
        ASSERT_TRUE(*(uint8_t *)(tst_addr + strbt_test[i].op1) == strbt_test[i].result);
    }

    return 0;
}
