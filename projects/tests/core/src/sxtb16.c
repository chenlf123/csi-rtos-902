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

int test_sxtb16(void)
{
    int i = 0;

    printf("Testing functions __SXTB16\n");

    /*
     * SXTB16
     * 有符号扩展操作数中的两个8位数到16位
     * ASSERT_TRUE(__SXTB16 (0x00F0 0070) == 0xFFF00070)
     */
    struct unary_calculation sxtb16_test[TEST_SIZE] = {
        {0x00F00070, 0xFFF00070},
        {0x12341234, 0x00340034},
        {0x12345678, 0x00340078}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SXTB16(sxtb16_test[i].op1) == sxtb16_test[i].result);
    }


    return 0;
}
