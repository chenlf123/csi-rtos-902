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

int test_shasx(void)
{
    int i = 0;

    printf("Testing functions __SHASX\n");

    /*
     * SHASX
     * 每个操作数都是由两个16位有符号数组成。交换第二个操作数的两个半字，然后两个操作数的高低半字各自相减，最后都除2
     *
     * ASSERT_TRUE(__SHASX (0x12345678, 0x12341234) == 0x12342222)
     */
    struct binary_calculation shasx_test[TEST_SIZE] = {
        {0x12341234, 0x12345678, 0x34560000},
        {0x12341234, 0x12341234, 0x12340000},
        {0x12345678, 0x12341234, 0x12342222}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SHASX(shasx_test[i].op1, shasx_test[i].op2) == shasx_test[i].result);
    }


    return 0;
}
