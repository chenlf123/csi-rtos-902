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

int test_vbr(void)
{
    int i;

    printf("Testing functions __get_VBR and __set_VBR\n");

    /*
     * set_VBR, get_VBR
     * 获取VBR的值, VBR寄存器用来保存异常向量的基址
     *
     * __set_VBR(0x12345F78)
     * ASSERT_TRUE(__get_VBR()  == 0x12345700)
     */
    struct unary_calculation vbr_test[TEST_SIZE] = {
        {0x12345F78, 0x12345C00},
        {0x82000000, 0x82000000},
        {      0x12,        0x0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        __set_VBR(vbr_test[i].op1);
        ASSERT_TRUE(__get_VBR() == vbr_test[i].result);
    }


    return 0;
}
