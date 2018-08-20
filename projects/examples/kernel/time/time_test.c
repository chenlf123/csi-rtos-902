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

/******************************************************************************
 * @file     time_test.c
 * @brief    the main function for the time test
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include "test_kernel.h"
#include <csi_kernel.h>
#include <stdint.h>

extern k_task_handle_t k_api_example_arr[];

void example_k_TransformTime(void)
{
    uint64_t uwMs;
    uint64_t uwTick;
    uwTick = csi_kernel_ms2tick(10000);
    printf("10000 ms to Tick = %llu \n", uwTick);
    uwMs = csi_kernel_tick2ms(100);
    printf("100 tick to ms = %llu \n", uwMs);

    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void example_main(void)
{
    uint64_t uwTickCount = 0;
    uint32_t cnt;

    cnt = 20;
    printf("print cnt every 1s for %d times\n", cnt);

    while (cnt--) {
        uwTickCount += 100;
        csi_kernel_delay(100);
        printf("-----%d\n", cnt);
    }

    cnt = 10;
    printf("print cnt every 10s for %d times\n", cnt);

    while (cnt--) {
        uwTickCount += 1000;
        csi_kernel_delay(1000);
        printf("-----%d\n", cnt);
    }

    csi_kernel_delay(200);
    uwTickCount = csi_kernel_get_ticks();

    if (0 != uwTickCount) {
        printf("csi_kernel_get_ticks = %d \n", (uint32_t)uwTickCount);
    }

    csi_kernel_delay(200);
    uwTickCount = csi_kernel_get_ticks();

    if (0 != uwTickCount) {
        printf("csi_kernel_get_ticks after delay = %d \n", (uint32_t)uwTickCount);
    }

    printf("test kernel time successfully!\n");
    csi_kernel_task_del(csi_kernel_task_get_cur());
}
