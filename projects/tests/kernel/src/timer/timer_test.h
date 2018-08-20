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
 * @file     timer_test.h
 * @brief    the head file
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#ifndef TIMER_TEST_H
#define TIMER_TEST_H

#define TASK_TEST_STACK_SIZE 1024

#define TIMER_VAL_CHK(value) do {ASSERT_TRUE(value); if ((int)(value) == 0) \
        {printf("timer test is [FAIL %d], func %s, line %d\n", \
                (int)++test_case_fail,__FUNCTION__, __LINE__);}}while(0)

k_status_t task_timer_create_del_test(void);
k_status_t task_timer_start_stop_test(void);

#endif /* TIMER_TEST_H */
