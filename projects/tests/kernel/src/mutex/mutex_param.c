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
 * @file     mutex_param.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "mutex_test.h"

#define MODULE_NAME "mutex_param"

static void task_mutex_entry_private(void)
{
    k_status_t     ret;

    test_mutex = csi_kernel_mutex_new();
    MYASSERT(test_mutex != NULL);

    ret = csi_kernel_mutex_lock(NULL, NO_WAIT);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_mutex_lock(test_mutex, NO_WAIT);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_mutex_unlock(NULL);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_mutex_unlock(test_mutex);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_mutex_del(test_mutex);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_mutex_del(NULL);
    MYASSERT(ret == -EINVAL);

    test_case_success++;
    PRINT_RESULT(MODULE_NAME, PASS);

    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void mutex_param_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_mutex_entry_private, MODULE_NAME, 0, TASK_MUTEX_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_mutex);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }

    next_test_case_wait();
}
