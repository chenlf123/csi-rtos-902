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

int test_ldrt(void)
{
    int i = 0;
    unsigned int test_mem[20];
    tst_addr = test_mem;

    printf("Testing functions __LDRT\n");

    /*
     * LDRT
     * 以非特权模式获取一个32位的值
     *
     * *FREE_MEM = 0x12345678
     * *(uint32_t *)FREE_MEM = __LDRT(FREE_MEM)
     */
    struct binary_calculation ldrt_test[TEST_SIZE] = {
        {0, 0x12345678, 0x12345678},
        {0, 0xFEDCBA09, 0xFEDCBA09},
        {0, 0x87654321, 0x87654321}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        *(uint32_t *)tst_addr = ldrt_test[i].op2;
        ASSERT_TRUE(__LDRT((uint32_t *)(tst_addr + ldrt_test[i].op1)) == ldrt_test[i].result);
    }


    return 0;
}
