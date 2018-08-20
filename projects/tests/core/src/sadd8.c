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

int test_sadd8(void)
{
    int i = 0;

    printf("Testing functions __SADD8\n");

    /*
     * SADD8
     * 四组8位有符号整数相加
     *
     * ASSERT_TRUE(__SADD8(0x12341234, 0x70FF0000) == 0x82331234)
     */
    struct binary_calculation sadd8_test[TEST_SIZE] = {
        {0x12341234, 0x70FF0000, 0x82331234},
        {0x1234F234, 0x10000000, 0x2234F234},
        {0x12341234, 0x12341234, 0x24682468}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SADD8(sadd8_test[i].op1, sadd8_test[i].op2) == sadd8_test[i].result);
    }



    return 0;
}
