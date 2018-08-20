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
 * @file     task_yield_test.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <csi_kernel.h>
#include <test_util.h>

k_task_handle_t task_1_test;
k_task_handle_t task_2_test;

void task_yield_1_entry(void *arg)
{
    while (1) {
        csi_kernel_task_yield();
    }
}

void task_yield_2_entry(void *arg)
{
    while (1) {
        test_case_success++;
        PRINT_RESULT("task_yield", PASS);
        next_test_case_notify();
        csi_kernel_task_del(task_1_test);
        csi_kernel_task_del(csi_kernel_task_get_cur());
    }
}

void task_yield_test(void)
{
    csi_kernel_sched_suspend();

    csi_kernel_task_new((k_task_entry_t)task_yield_1_entry, "task_yield_test_1", 0, 20, 0,
                        NULL, TEST_CASE_TASK_SIZE, &task_1_test);

    csi_kernel_task_new((k_task_entry_t)task_yield_2_entry, "task_yield_test_2", 0, 20, 0,
                        NULL, TEST_CASE_TASK_SIZE, &task_2_test);

    csi_kernel_sched_resume(0);

    next_test_case_wait();
}
