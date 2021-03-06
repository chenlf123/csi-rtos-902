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
 * @file     task_suspend_test.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>

k_task_handle_t task_1_test;
k_task_handle_t task_2_test;

void task_suspend_entry(void *arg)
{
    while (1) {
        csi_kernel_task_suspend(csi_kernel_task_get_cur());

        test_case_success++;
        PRINT_RESULT("task_suspend", PASS);

        csi_kernel_task_del(csi_kernel_task_get_cur());
    }
}

void task_resume_entry(void *arg)
{
    while (1) {
        csi_kernel_task_resume(task_1_test);
        next_test_case_notify();
        csi_kernel_task_del(csi_kernel_task_get_cur());
    }
}

void task_suspend_test(void)
{
    csi_kernel_task_new((k_task_entry_t)task_suspend_entry, "task_suspend_test_1", 0, 10, 0,
                        NULL, TEST_CASE_TASK_SIZE, &task_1_test);

    csi_kernel_task_new((k_task_entry_t)task_resume_entry, "task_suspend_test_2", 0, 11, 0,
                        NULL, TEST_CASE_TASK_SIZE, &task_2_test);

    next_test_case_wait();
}
