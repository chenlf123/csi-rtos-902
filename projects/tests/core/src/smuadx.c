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

int test_smuadx(void)
{
    int i = 0;

    printf("Testing functions __SMUADX\n");

    /*
     * SMUADX
     * 两个操作数都是由两个16位有符号数组成，两个操作数的低半字和高半字交叉相乘，然后相加
     *
     * ASSERT_TRUE(__SMUADX (0x12345678, 0x12345678) == 0xC4C00C0)
     */
    struct binary_calculation smuadx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x0C4C00C0},
        {0x12341234, 0x12341234, 0x0296B520},
        {0x12345678, 0x12341234, 0x07715AF0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMUADX(smuadx_test[i].op1, smuadx_test[i].op2) == smuadx_test[i].result);
    }


    return 0;
}
