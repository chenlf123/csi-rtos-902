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
 * @file     task_sleep.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>

#define LOOP_CNT 1

k_task_handle_t task_0_test;
static uint32_t cnt;

void task_sleep_entry(void *arg)
{
    while (1) {
        csi_kernel_delay(100);
        cnt++;

        if (cnt == LOOP_CNT) {
            test_case_success++;
            cnt = 0u;
            PRINT_RESULT("task_sleep", PASS);
            next_test_case_notify();
            csi_kernel_task_del(csi_kernel_task_get_cur());
        }
    }
}

void task_sleep_test(void)
{
    if (csi_kernel_task_new((k_task_entry_t)task_sleep_entry, "task_sleep_test", 0, 10, 0,
                            NULL, TEST_CASE_TASK_SIZE, &task_0_test) != K_OK) {
        printf("task_sleep_test failed \n");
    }

    next_test_case_wait();
}
