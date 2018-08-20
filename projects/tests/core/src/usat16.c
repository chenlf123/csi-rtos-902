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

int test_usat16(void)
{
    int i = 0;

    printf("Testing functions __USAT16\n");

    /*
     * USAT16
     * 第一个操作数由两个16位无符号数组成，第二个操作数指明饱和的位数。
     * 用第二个操作数指明的饱和位数，处理第一个操作数中的两个无符号数
     *
     * ASSERT_TRUE(__USAT16 (0x12345678, 8) == 0xFF00FF)
     */
    struct binary_calculation usat16_test[TEST_SIZE] = {
        {0x12345678,  8, 0x00FF00FF},
        {0x12341234, 15, 0x12341234},
        {0x12345678,  1, 0x00010001}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__USAT16(usat16_test[i].op1, usat16_test[i].op2) == usat16_test[i].result);
    }


    return 0;
}
