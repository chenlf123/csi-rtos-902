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

int test_ccr(void)
{
#if (__MPU_PRESENT == 1)
    int i = 0;

    printf("Testing functions __get_CCR and __set_CCR\n");

    /*
     * set_CCR, get_CCR
     * 高速缓存配置寄存器(CCR)用来配置内存保护区，Endian模式，以及系统和处理器的时钟比
     *
     * __set_CCR(0x12345678)
     * ASSERT_TRUE(__get_CCR()  == 0x12345678)
     */
    struct unary_calculation ccr_test[TEST_SIZE] = {
        {0x12345789, 0x12345789},
        {0x82000000, 0x82000000},
        {      0x12,       0x12}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        __set_CCR(ccr_test[i].op1);
        ASSERT_TRUE(__get_CCR() == ccr_test[i].result);
    }


    return 0;
#else
    printf("Testing functions ##skip## __get_CCR and __set_CCR\n");
    return 0;
#endif
}
