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
 * @file     msg_queue_test.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "dtest.h"
#include "msg_queue_test.h"

void buf_queue_test(void)
{
#if 0
    task_buf_queue_recv_test();
    next_test_case_wait();

    task_buf_queue_del_test();
    next_test_case_wait();

    task_buf_queue_flush_test();
    next_test_case_wait();

    task_buf_queue_dyn_create_test();
    next_test_case_wait();
#else
    dtest_suite_info_t test_suite_info = {
        "buf_queue_test", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "task_buf_queue_recv_test", (void *)task_buf_queue_recv_test, 1 },
        { "task_buf_queue_del_test", (void *)task_buf_queue_del_test, 1 },
        { "task_buf_queue_flush_test", (void *)task_buf_queue_flush_test, 1 },
        { "task_buf_queue_dyn_create_test", (void *)task_buf_queue_dyn_create_test, 1 },
        { NULL, NULL, 0 }
    };

    dtest_add_cases(test_suite, test_case_info_array);
#endif
}

