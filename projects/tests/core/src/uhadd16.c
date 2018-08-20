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

int test_uhadd16(void)
{
    int i = 0;

    printf("Testing functions __UHADD16\n");

    /*
     * UHADD16
     * 两个操作数都是由两个16位无符号数组成，先将两个操作数的高低半字相加，再将结果除以2
     *
     * ASSERT_TRUE(__UHADD16 (0x12345678, 0x12345678) == 0x 12345678)
     */
    struct binary_calculation uhadd16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678},
        {0x12341234, 0x12341234, 0x12341234},
        {0x12345678, 0x12341234, 0x12343456}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UHADD16(uhadd16_test[i].op1, uhadd16_test[i].op2) == uhadd16_test[i].result);
    }


    return 0;
}
