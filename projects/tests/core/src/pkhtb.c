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

int test_pkhtb(void)
{
    int i = 0;

    printf("Testing functions __PKHTB\n");

    /*
     * PKHTB
     * 将一个寄存器中的16位数与另外一个寄存器中的16位数组合在一起。第二个寄存器中的数可以在组合前先右移
     *
     * ASSERT_TRUE(__PKHBT(0x5678, 0x8888, 1) == 0x56791110)
     */
    struct ternary_calculation pkhtb_test[TEST_SIZE] = {
        {0x56780000, 0x8888,  1, 0x56784444},
        {0x12340000, 0x5678,  0, 0x12345678},
        {0x56780000, 0x6789, 16, 0x56780000}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__PKHTB(pkhtb_test[i].op1, pkhtb_test[i].op2, pkhtb_test[i].op3) == pkhtb_test[i].result);
    }


    return 0;
}
