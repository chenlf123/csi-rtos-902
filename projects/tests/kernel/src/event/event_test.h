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
 * @file     event_test.h
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#ifndef EVENT_TEST_H
#define EVENT_TEST_H

#include "dtest.h"

#define TASK_EVENT_PRI       16

//#define MYASSERT(value) do {ASSERT_TRUE(value);if ((int)(value) == 0) { printf("xxxx: %d \n", __LINE__); return 1; }} while (0)
#define MYASSERT(value) do {ASSERT_TRUE(value); if ((int)(value) == 0) \
        { \
            test_case_critical_enter(); \
            test_case_check_err++;  \
            test_case_critical_exit(); \
            printf("kernel event test is [FAIL %d], func %s, line %d\n", \
                   ++test_case_check_err, __FUNCTION__, __LINE__); \
        }  \
    } while (0)

extern k_task_handle_t   task_event;
extern k_task_handle_t   task_event_co1;
extern k_task_handle_t   task_event_co2;
extern k_event_handle_t  test_event;
extern k_event_handle_t  test_event_ext;

typedef uint8_t (*test_func_t)(void);

void task_event_entry_register(const char *name, test_func_t *runner, uint8_t casenum);
void task_event_entry(void *arg);
void event_test(void);
void event_param_test(void);
void event_opr_test(void);
void event_break_test(void);
void event_reinit_test(void);
void event_coopr_test(void);

#endif /* EVENT_TEST_H */

