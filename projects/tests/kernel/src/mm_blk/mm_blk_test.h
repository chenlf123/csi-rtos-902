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
 * @file     mm_blk_test.h
 * @brief    the head file
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/

#ifndef MM_BLK_TEST_H
#define MM_BLK_TEST_H

#include "dtest.h"

#define TASK_MM_BLK_PRI      16

#define MBLK_POOL_SIZE       64

#define MYASSERT(value) do {ASSERT_TRUE(value);  if((int)(value) == 0) {printf("ERROR: %s:%d, ERROR-NO: %d\n", __FUNCTION__, __LINE__, value); }} while (0)

extern k_mpool_handle_t mblk_pool_test;
extern char mblk_pool[MBLK_POOL_SIZE];

typedef uint8_t (*test_func_t)(void);

void task_mm_blk_entry_register(const char *name, test_func_t *runner, uint8_t casenum);
void task_mm_blk_entry(void *arg);
void mm_blk_test(void);
void mm_blk_param_test(void);
void mm_blk_opr_test(void);
void mm_blk_break_test(void);
void mm_blk_reinit_test(void);
void mm_blk_fragment_test(void);
void mm_blk_coopr_test(void);

#endif /* MM_BLK_TEST_H */

