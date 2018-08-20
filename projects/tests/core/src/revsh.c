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

int test_revsh(void)
{
    int i = 0;

    printf("Testing functions __REVSH\n");

    /*
     * REVSH
     * 按字节顺序翻转带符号的16位值，翻转后扩展为32位数.
     *
     * ASSERT_TRUE(__REVSH(0x5688) == 0xFFFF8856)
     */
    struct unary_calculation revsh_test[TEST_SIZE] = {
        {0x5688, 0xFFFF8856},
        {0x4a5a, 0x00005a4a},
        {0x3445, 0x00004534}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__REVSH(revsh_test[i].op1) == revsh_test[i].result);
    }


    return 0;
}
