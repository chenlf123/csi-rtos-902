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
 * @file     task_test.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/
#include <test_util.h>
#include "dtest.h"

extern void task_sleep_test(void);
extern void task_suspend_test(void);
extern void task_yield_test(void);
extern void task_create_test(void);
extern void task_param_test(void);

void task_test(void)
{
#if 0
    /*Added by Csky Test Team*/
    task_create_test();
    next_test_case_wait();
    task_param_test();
    next_test_case_wait();
    /*----------------------*/
    task_sleep_test();
    next_test_case_wait();
    task_suspend_test();
    next_test_case_wait();
    task_yield_test();
    next_test_case_wait();
#else
    dtest_suite_info_t test_suite_info = {
        "test_task", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "task_create_test", task_create_test, 1 },
        { "task_param_test", task_param_test, 1 },
        { "task_sleep_test", task_sleep_test, 1 },
        { "task_suspend_test", task_suspend_test, 1 },
#ifndef CONFIG_KERNEL_UCOS
        { "task_yield_test", task_yield_test, 1 },
#endif
        { NULL, NULL, 0 }
    };

    dtest_add_cases(test_suite, test_case_info_array);
#endif
}

