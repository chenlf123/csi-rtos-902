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

int test_qadd(void)
{
    int i = 0;

    printf("Testing functions __QADD\n");

    /*
     * QADD
     * 获取两个整数和的饱和值
     *
     * ASSERT_TRUE(__QADD(0x12345678, 0x70000000) == 0x7FFFFFFF)
     */
    struct binary_calculation qadd_test[TEST_SIZE] = {
        {0x12345678, 0x70000000, 0x7FFFFFFF},
        {0x12345678, 0x12345678, 0x2468ACF0},
        {0x12345678, 0xEDCBA988,        0x0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QADD(qadd_test[i].op1, qadd_test[i].op2) == qadd_test[i].result);
    }


    return 0;
}
