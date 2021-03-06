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

int test_clz(void)
{
    int i = 0;

    printf("Testing functions CLZ\n");
    /*
     * CLZ
     * 计算在一个32位值中，第一个1前有多少个位是零.
     *
     * ASSERT_TRUE(__CLZ(0x00008234) == 16)
     */
    struct unary_calculation clz_test[TEST_SIZE] = {
        {0x92345678,  0},
        {0x00008234, 16},
        {       0x0, 32}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__CLZ(clz_test[i].op1) == clz_test[i].result);
    }


    return 0;
}
