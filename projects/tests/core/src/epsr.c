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

int test_epsr(void)
{
    int i = 0;

    printf("Testing functions __get_EPSR and __set_EPSR\n");

    /*
     * set_EPSR, get_EPSR
     * 获取EPSR的值
     *
     * __set_EPSR(0x12345678)
     * ASSERT_TRUE(__get_EPSR()  == 0x12345678)
     */
#if __CK80X >= 3
    struct unary_calculation epsr_test[TEST_SIZE] = {
        {       0x0,        0x0},	// not all bits can be set
        {0x80000000, 0x80000000},
        {       0x0,        0x0}
    };
#else
#if (__CK80X == 1) || (__CK80X == 2)
    struct unary_calculation epsr_test[TEST_SIZE] = {
        {0x10345789, 0x00340381},	// not all bits can be set
        {0x80000000, 0x80000000},
        {      0x12,        0x0}
    };
#else
    struct unary_calculation epsr_test[TEST_SIZE] = {
        {0x80000000, 0x80000000},
    };
#endif
#endif

    for (i = 0; i < TEST_SIZE; i++) {
        __set_EPSR(epsr_test[i].op1);
        //mask for secure
        ASSERT_TRUE((__get_EPSR() & 0xbfffffff) == (epsr_test[i].result & 0xbfffffff));
    }

    return 0;
}
