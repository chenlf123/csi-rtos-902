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

int test_rev(void)
{
    int i = 0;

    printf("Testing functions __REV\n");

    /*
     * REV
     * 按字节翻转
     *
     * ASSERT_TRUE(__RBIT(0x12345678) == 0x78563412)
     */
    struct unary_calculation rev_test[TEST_SIZE] = {
        {0x12345678, 0x78563412},
        {0x2a3a4a5a, 0x5a4a3a2a},
        {0x12233445, 0x45342312}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__REV(rev_test[i].op1) == rev_test[i].result);
    }

    return 0;
}
