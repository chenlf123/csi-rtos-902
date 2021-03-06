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

int test_uqsax(void)
{
    int i = 0;

    printf("Testing functions __UQSAX\n");

    /*
     * UQSAX
     * 两个操作数都是由两个16位无符号数组成，先交换第二个操作数的高低半字，
     * 然后两个操作数的高半字饱和相减，低半字饱和相加
     *
     * ASSERT_TRUE(__UQSAX (0x12345678, 0x12345678) == 0xBBBC68AC)
     */
    struct binary_calculation uqsax_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x000068AC},
        {0x12341234, 0xF0000000, 0x1234FFFF},
        {0x12345678, 0x12341234, 0x000068AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UQSAX(uqsax_test[i].op1, uqsax_test[i].op2) == uqsax_test[i].result);
    }


    return 0;
}
