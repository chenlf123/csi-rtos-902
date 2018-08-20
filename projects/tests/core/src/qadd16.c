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

int test_qadd16(void)
{
    int i = 0;

    printf("Testing functions __QADD16\n");

    /*
     * QADD16
     * 同时操作两组16位整数相加
     *
     * ASSERT_TRUE(__QADD16(0x12341234, 0x00007000) == 0x12347FFF)
     */
    struct binary_calculation qadd16_test[TEST_SIZE] = {
        {0x12341234, 0x70000000, 0x7FFF1234},
        {0x12341234, 0x00007000, 0x12347FFF},
        {0x12345678, 0x87654321, 0x99997FFF}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QADD16(qadd16_test[i].op1, qadd16_test[i].op2) == qadd16_test[i].result);
    }


    return 0;
}
