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

int test_sxtab16(void)
{
    int i = 0;

    printf("Testing functions __SXTAB16\n");

    /*
     * SXTAB16
     * 符号扩展第二个操作数的两个8位数(数据在[7:0] 和[23:16]),
     * 到两个16位数，然后与第一个操作数的高低半字相加
     *
     * ASSERT_TRUE(__SXTAB16 (0x56785678, 0x00F00070) == 0x566856E8)
     */
    struct binary_calculation sxtab16_test[TEST_SIZE] = {
        {0x56785678, 0x00F00070, 0x566856E8},
        {0x12341234, 0x12341234, 0x12681268},
        {0x12345678, 0x12341234, 0x126856AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SXTAB16(sxtab16_test[i].op1, sxtab16_test[i].op2) == sxtab16_test[i].result);
    }


    return 0;
}
