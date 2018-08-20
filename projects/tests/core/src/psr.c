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

int test_psr(void)
{
    printf("Testing functions __get_PSR and __set_PSR\n");

    /*
     * get_PSR
     * 从RSR寄存器中读取值
     *
     * Psrset ie
     * ASSERT_TRUE(_FLD2VAL(PSR_IE,__get_PSR()) == 1)
     * Psrclr ie
     * ASSERT_TRUE(_FLD2VAL(PSR_IE,__get_PSR()) == 0)
     */
    asm("psrset ie");
    ASSERT_TRUE(_FLD2VAL(PSR_IE, __get_PSR()) == 1);

    asm("psrclr ie");
    ASSERT_TRUE(_FLD2VAL(PSR_IE, __get_PSR()) == 0);

    /*
     * set_PSR
     * 设置RSR寄存器值
     *
     * __set_PSR(__get_PSR() | _VAL2FLD(PSR_IE, 0x1))
     * ASSERT_TRUE(_FLD2VAL(PSR_IE,__get_PSR()) == 1)
     * Psrclr ie
     */
    __set_PSR(__get_PSR() | _VAL2FLD(PSR_IE, 0x1));
    ASSERT_TRUE(_FLD2VAL(PSR_IE, __get_PSR()) == 1);
    asm("psrclr ie");

    return 0;
}
