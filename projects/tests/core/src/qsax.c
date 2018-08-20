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

int test_qsax(void)
{
    int i = 0;

    printf("Testing functions __QSAX\n");

    /*
     * QSAX
     * 先交换第二个操作数的两个半字，然后与第一个操作数的高半字相减，低半字相加。最后的结果做饱和处理。
     *
     * ASSERT_TRUE(__QSAX(0xF2341234, 0x00007F00) == 0x80001234)
     */
    struct binary_calculation qsax_test[TEST_SIZE] = {
        {0xF2341234, 0x00007F00, 0x80001234},
        {0x1234F234, 0x70000000, 0x12346234},
        {0x12341234, 0x12341234, 0x00002468}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QSAX(qsax_test[i].op1, qsax_test[i].op2) == qsax_test[i].result);
    }


    return 0;
}
