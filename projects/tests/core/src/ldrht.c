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

int test_ldrht(void)
{
    int i = 0;
    unsigned int test_mem[20];
    tst_addr = (unsigned int *)&test_mem;

    printf("Testing functions __LDRHT\n");

    /*
     * LDRHT
     * 以非特权模式获取一个16位的值
     *
     * *FREE_MEM = 0x12345678
     * *(uint16_t *)FREE_MEM = __LDRHT(FREE_MEM)
     */
    struct binary_calculation ldrht_test[TEST_SIZE] = {
        {0, 0x5678, 0x5678},
        {2, 0xFEDC, 0xFEDC},
        {0, 0x4321, 0x4321}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        *(uint16_t *)(tst_addr + ldrht_test[i].op1) = ldrht_test[i].op2;
        ASSERT_TRUE(__LDRHT((uint16_t *)(tst_addr + ldrht_test[i].op1)) == ldrht_test[i].result);
    }

    return 0;
}
