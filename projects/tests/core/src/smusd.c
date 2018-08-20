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

int test_smusd(void)
{
    int i = 0;

    printf("Testing functions __SMUSD\n");

    /*
     * SMUSD
     * 两个操作数都是由两个16位有符号数组成，两个操作数的低半字和高半字分别相乘，然后相减
     *
     * ASSERT_TRUE(__SMUSD(0x12345678, 0x12345678) == 0xE4168250)
     */
    struct binary_calculation smusd_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x1BE97DB0},
        {0x12341234, 0x12341234,        0x0},
        {0x12345678, 0x12341234, 0x04DAA5D0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMUSD(smusd_test[i].op1, smusd_test[i].op2) == smusd_test[i].result);
    }

    return 0;
}
