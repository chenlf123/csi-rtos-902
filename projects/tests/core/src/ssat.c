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

int test_ssat(void)
{
    int i = 0;

    printf("Testing functions __SSAT\n");

    /*
     * SSAT
     * 饱和一个有符号数,饱和范围是1..31
     *
     * ASSERT_TRUE(0x7FFFFFF == __SSAT(0x12345678, 28))
     */
    struct binary_calculation ssat_test[TEST_SIZE] = {
        {0x12345678, 28,  0x7FFFFFF},
        {    0x1234, 28,     0x1234},
        {0xFFFFFFFF,  1, 0xFFFFFFFF}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SSAT(ssat_test[i].op1, ssat_test[i].op2) == ssat_test[i].result);
    }


    return 0;
}
