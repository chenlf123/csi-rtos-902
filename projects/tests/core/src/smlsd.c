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

int test_smlsd(void)
{
    int i = 0;

    printf("Testing functions __SMLSD\n");

    /*
     * SMLSD
     * 前两个操作数都是由两个16位有符号数组成，将它们的高低半字各自相乘
     * 得到结果，然后再把两个结果相减，最后与第三个操作数相加
     *
     * ASSERT_TRUE(__SMLSD (0x12345678, 0x12345678, 0x12345678) == 0x2E1DD428)
     */
    struct ternary_calculation smlsd_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678, 0x2E1DD428},
        {0x12341234, 0x12341234, 0x12341234, 0x12341234},
        {0x12345678, 0x12341234, 0x56781234, 0x5B52B804}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLSD(smlsd_test[i].op1, smlsd_test[i].op2, smlsd_test[i].op3) == smlsd_test[i].result);
    }


    return 0;
}
