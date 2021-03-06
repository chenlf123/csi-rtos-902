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

int test_ror(void)
{
    int i = 0;

    printf("Testing functions __ROR\n");

    /*
     * ROR
     * 右移指定位.移位的范围是[1..31]
     *
     * ASSERT_TRUE(0x56781234 == __ROR(0x12345678, 16))
     */
    struct binary_calculation ror_test[TEST_SIZE] = {
        {0x12345678,  1, 0x91A2B3C },
        {0x12345678, 16, 0x56781234},
        {0x12345678, 31, 0x2468ACF0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__ROR(ror_test[i].op1, ror_test[i].op2) == ror_test[i].result);
    }


    return 0;
}
