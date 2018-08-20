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

int test_rrx(void)
{
    int i = 0;
    uint32_t psr;

    printf("Testing functions __RRX\n");

    /*
     * RRX
     * 带扩展向右循环移位.原则上不支持此函数，只有相当于c位是0的效果，即向右移1位
     *
     * ASSERT_TRUE(0x7FFFFFFF== __RRX(0xFFFFFFFF))
     */
    struct unary_calculation rrx_test[TEST_SIZE] = {
        {0x12345678, 0x91A2B3C },
        {       0x1,        0x0},
        {0xFFFFFFFF, 0x7FFFFFFF}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        psr = __get_PSR();
        __set_PSR(psr & 0xfffffffe);
        ASSERT_TRUE(__RRX(rrx_test[i].op1) == rrx_test[i].result);
    }


    return 0;
}
