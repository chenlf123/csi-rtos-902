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

int test_rbit(void)
{
    int i = 0;

    printf("Testing functions __RBIT\n");

    /*
     * RBIT
     * 按位翻转
     *
     * ASSERT_TRUE(0x88888888 == __RBIT(0x11111111))
     */
    struct unary_calculation rbit_test[TEST_SIZE] = {
        {0x88888888, 0x11111111},
        {0x5a5a5a5a, 0x5a5a5a5a},
        {0x22222222, 0x44444444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__RBIT(rbit_test[i].op1) == rbit_test[i].result);
    }

    return 0;
}
