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

int test_uadd8(void)
{
    int i = 0;

    printf("Testing functions __UADD8\n");

    /*
     * UADD8
     * 四组8位无符号整数相加
     *
     * ASSERT_TRUE(__UADD16(0x12345678, 0x12345678) == 0x2468ACF0)
     */
    struct binary_calculation uadd8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x2468ACF0},
        {0x12341234, 0x12341234, 0x24682468},
        {0x12345678, 0x12341234, 0x246868AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UADD8(uadd8_test[i].op1, uadd8_test[i].op2) == uadd8_test[i].result);
    }


    return 0;
}
