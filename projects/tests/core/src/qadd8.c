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

int test_qadd8(void)
{
    int i = 0;

    printf("Testing functions __QADD8\n");

    /*
     * QADD8
     * 四组8位数相加
     *
     * ASSERT_TRUE(__QADD8(0x12341234, 0xF0007060) == 0x02347F7F)
     */
    struct binary_calculation qadd8_test[TEST_SIZE] = {
        {0x12341234, 0xF0007060, 0x02347F7F},
        {0x12341234, 0xF0607000, 0x027F7F34},
        {0x12341234, 0x7000F060, 0x7F34027F}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QADD8(qadd8_test[i].op1, qadd8_test[i].op2) == qadd8_test[i].result);
    }


    return 0;
}
