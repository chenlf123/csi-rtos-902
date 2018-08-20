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
 * @file     msg_queue_test.h
 * @brief
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#ifndef BUF_QUEUE_TEST_H
#define BUF_QUEUE_TEST_H

#include "dtest.h"

#define FRONT 1
#define BACK  0

#define BUFQUEUE_VAL_CHK(value) do {ASSERT_TRUE(value); if ((int)(value) == 0) \
        { \
            test_case_critical_enter(); \
            test_case_check_err++;  \
            test_case_critical_exit(); \
            printf("message queue test is [FAIL %d], func %s, line %d\n", \
                   ++test_case_check_err, __FUNCTION__, __LINE__); \
        }  \
    } while (0)

k_status_t task_buf_queue_send_test(void);
k_status_t task_buf_queue_recv_test(void);
k_status_t task_buf_queue_del_test(void);
k_status_t task_buf_queue_flush_test(void);
k_status_t task_buf_queue_dyn_create_test(void);

#endif /* BUF_QUEUE_TEST_H */
