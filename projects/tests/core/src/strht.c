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

int test_strht(void)
{
    int i = 0;
    unsigned int test_mem[20];
    tst_addr = (unsigned int *)&test_mem;

    printf("Testing functions __STRHT\n");

    /*
     * STRHT
     * 非特权模式下的16位数值存储
     *
     * __STRBT(0x1234, FREE_MEM)
     * ASSERT_TRUE(*(uint16_t *)FREE_MEM == 0x1234)
     */
    struct binary_calculation strht_test[TEST_SIZE] = {
        {0, 0x1234, 0x1234},
        {2, 0xFEDC, 0xFEDC},
        {0, 0x5678, 0x5678}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        __STRHT(strht_test[i].op2, (uint16_t *)(tst_addr + strht_test[i].op1));
        ASSERT_TRUE(*(uint16_t *)(tst_addr + strht_test[i].op1) == strht_test[i].result);
    }


    return 0;
}
