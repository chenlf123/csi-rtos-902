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

int test_qsub(void)
{
    int i = 0;

    printf("Testing functions __QSUB\n");
    /*
     * QSUB
     * 获取两个数相减后的饱和值
     *
     * ASSERT_TRUE(__QSUB(0x92341234, 0x20000000) == 0x80000000)
     */
    struct binary_calculation qsub_test[TEST_SIZE] = {
        {0x92341234, 0x20007000, 0x80000000},
        {0x1234F234, 0x10000000, 0x0234F234},
        {0x12341234, 0x12341234, 0x00000000}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QSUB(qsub_test[i].op1, qsub_test[i].op2) == qsub_test[i].result);
    }



    return 0;
}
