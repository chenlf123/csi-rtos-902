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

int test_smlsldx(void)
{
    int i = 0;

    printf("Testing functions __SMLSLDX\n");

    /*
     * SMLSLDX
     * 前两个操作数都是由两个16位有符号数组成，第三个操作数是64位整数，
     * 先将第二个操作数的高低半字交换，再将前两个操作数的高低半字各自相乘得到结果，
     * 然后再把两个结果相减，最后与第三个操作数相加
     *
     * ASSERT_TRUE(__SMLSLDX (0x12345678, 0x12345678, 0x1234567890) == 0x1234567890)
     */
    struct ternary64_calculation smlsldx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x1234567890, 0x1234567890},
        {0x12341234, 0x12341234, 0x1234123490, 0x1234123490},
        {0x12345678, 0x12341234, 0x5678123490, 0x567CECDA60}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLSLDX(smlsldx_test[i].op1, smlsldx_test[i].op2, smlsldx_test[i].op3) == smlsldx_test[i].result);
    }


    return 0;
}
