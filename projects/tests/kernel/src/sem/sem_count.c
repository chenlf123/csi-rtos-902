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
 * @file     sem_count.c
 * @brief    the main function for the kernel sched
 * @version  V1.0
 * @date     20. July 2016
 ******************************************************************************/

#include <test_util.h>
#include "sem_test.h"

#define MODULE_NAME "sem_count"

static void task_sem_entry_private(void)
{
    k_status_t     ret;
    int32_t cnt;

    test_sem = csi_kernel_sem_new(3, 3);
    MYASSERT(test_sem != NULL);

    cnt = csi_kernel_sem_get_count(test_sem);
    MYASSERT(cnt == 3);

    ret = csi_kernel_sem_wait(test_sem, NO_WAIT);
    MYASSERT(ret == K_OK);

    cnt = csi_kernel_sem_get_count(test_sem);
    MYASSERT(cnt == 2);

    ret = csi_kernel_sem_del(test_sem);
    MYASSERT(ret == K_OK);

    test_case_success++;
    PRINT_RESULT(MODULE_NAME, PASS);

    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void sem_count_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_sem_entry_private, MODULE_NAME, 0, TASK_SEM_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_sem);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }

    next_test_case_wait();
}
