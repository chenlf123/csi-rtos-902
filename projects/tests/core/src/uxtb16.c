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

int test_uxtb16(void)
{
    int i = 0;

    printf("Testing functions __UXTB16\n");

    /*
     * UXTB16
     * 零扩展操作数中的两个8位数到16位数
     *
     * ASSERT_TRUE(__UXTB16 (0x00F00170) == 0x00F00070)
     */
    struct unary_calculation uxtb16_test[TEST_SIZE] = {
        {0x00F00170, 0x00F00070},
        {0xF0000000,        0x0},
        {0x12341234, 0x00340034}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UXTB16(uxtb16_test[i].op1) == uxtb16_test[i].result);
    }


    return 0;
}
