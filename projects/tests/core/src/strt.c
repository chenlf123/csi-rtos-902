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

int test_strt(void)
{
    int i = 0;
    unsigned int test_mem[20];
    tst_addr = test_mem;

    printf("Testing functions __STRT\n");

    /*
     * STRT
     * 非特权模式下的32位数值存储
     *
     * __STRT(0x12345678, FREE_MEM)
     * ASSERT_TRUE(*(uint32_t *)FREE_MEM == 0x12345678)
     */
    struct binary_calculation strt_test[TEST_SIZE] = {
        {0, 0x12345678, 0x12345678},
        {4, 0xFEDCBA09, 0xFEDCBA09},
        {0, 0x56781234, 0x56781234}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        __STRT(strt_test[i].op2, (uint32_t *)(tst_addr + strt_test[i].op1));
        ASSERT_TRUE(*(uint32_t *)(tst_addr + strt_test[i].op1) == strt_test[i].result);
    }


    return 0;
}
