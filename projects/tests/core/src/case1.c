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

static volatile int tick_count;

//static int count;
//static int check;

int test_case1(void)
{
    printf("Testing functions case1 !\n");
    csi_coret_config(10000, CORET_IRQn);
    csi_vic_enable_irq(CORET_IRQn);
    __enable_irq();
    ASSERT_TRUE(_FLD2VAL(PSR_IE, __get_PSR()) == 1);

    __set_PSR(__get_PSR() & ~(_VAL2FLD(PSR_EE, 0x1)));
    ASSERT_TRUE(_FLD2VAL(PSR_EE, __get_PSR()) == 0);

    __set_PSR(__get_PSR() | _VAL2FLD(PSR_EE, 0x1));
    ASSERT_TRUE(_FLD2VAL(PSR_EE, __get_PSR()) == 1);


    while (1) {
        //printf("%d\n",tick_count);
        if (tick_count > 10000) {
            break;
        }
    }

    /*
    __enable_irq();
    tick_count=0;
    check = 1;
    count=0;
        while (check == 1) {
        count++;
        printf("==%d\n",count);
        __WFI();
        }
    ASSERT_TRUE(check==0);
    */

    __disable_irq();
    ASSERT_TRUE(_FLD2VAL(PSR_IE, __get_PSR()) == 0);
    tick_count = 0;

    while (1) {
        //printf("%d\n",tick_count);
        if (tick_count == 0) {
            ASSERT_TRUE(tick_count == 0);
            break;
        }

    }

    __enable_excp_irq();
    ASSERT_TRUE(_FLD2VAL(PSR_IE, __get_PSR()) == 1);
    ASSERT_TRUE(_FLD2VAL(PSR_EE, __get_PSR()) == 1);
    tick_count = 0;

    while (1) {
        //printf("%d\n",tick_count);
        if (tick_count > 10000) {
            break;
        }
    }

    __disable_excp_irq();
    ASSERT_TRUE(_FLD2VAL(PSR_IE, __get_PSR()) == 0);
    ASSERT_TRUE(_FLD2VAL(PSR_EE, __get_PSR()) == 0);
    tick_count = 0;

    while (1) {
        //printf("%d\n",tick_count);
        if (tick_count == 0) {
            break;
        }
    }

    return 0;
}
