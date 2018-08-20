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

int test_uxtab16(void)
{
    int i = 0;

    printf("Testing functions __UXTAB16\n");

    /*
     * UXTAB16
     * 将第二个操作数两个8位数零扩展到16位数，然后与第一个操作数的两个16位数相加
     *
     * ASSERT_TRUE(__UXTB16 (0x56785678, 0x00F00170) == 0x576856E8)
     */
    struct binary_calculation uxtab16_test[TEST_SIZE] = {
        {0x12345678, 0x00F00170, 0x132456E8},
        {0x12341234, 0xF0000000, 0x12341234},
        {0x12345678, 0x12341234, 0x126856AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UXTAB16(uxtab16_test[i].op1, uxtab16_test[i].op2) == uxtab16_test[i].result);
    }


    return 0;
}
