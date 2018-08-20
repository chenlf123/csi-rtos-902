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
 * @file     task_create.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/
#include <test_util.h>
#include "dtest.h"
#include "task_test.h"

#define HERE_TEST_TASK_NUM    8
k_task_handle_t task[HERE_TEST_TASK_NUM];
static int g_here_i = 0;

static uint8_t test_task_2_entry(void *arg)
{
    MYASSERT(g_here_i == (int)arg);
    test_case_success++;
    PRINT_RESULT("task_create", PASS);
#if 0
    next_test_case_notify();
#endif
    g_here_i ++;
    csi_kernel_task_del(task[(int)arg]);
    return 0;
}

void task_create_test(void)
{
    int i = 0;

    int ret;

    for (i = 0; i < HERE_TEST_TASK_NUM; i++) {
        ret = csi_kernel_task_new((k_task_entry_t)test_task_2_entry, "test_create_task", (void *)i, 14, 0, NULL, TEST_CASE_TASK_SIZE, &task[i]);
    }

    if (ret != K_OK) {
        printf("Error in thread#1 creation\n");
        test_case_fail++;
        PRINT_RESULT("task_create", FAIL);
        return;
    }

#if 0
    next_test_case_wait();
#endif
}
