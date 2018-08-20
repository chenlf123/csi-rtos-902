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
 * @file     mm_blk_reinit.c
 * @brief    the main function for the kernel sched
 * @version  V1.0
 * @date     20. July 2016
 ******************************************************************************/

#include <test_util.h>
#include "mm_blk_test.h"

#define MODULE_NAME "mm_blk_reinit"
static k_task_handle_t task_mm_blk;

static uint8_t mm_blk_reinit_case1(void)
{
    int32_t    blktotal;

    blktotal = MBLK_POOL_SIZE / (MBLK_POOL_SIZE >> 2);

    mblk_pool_test = csi_kernel_mpool_new((void *)mblk_pool, blktotal, MBLK_POOL_SIZE >> 2);
    MYASSERT(mblk_pool_test != NULL);

    int32_t get_avail = blktotal - csi_kernel_mpool_get_count(mblk_pool_test);
    MYASSERT(get_avail == blktotal);

    blktotal = MBLK_POOL_SIZE / (MBLK_POOL_SIZE >> 3);
    mblk_pool_test = csi_kernel_mpool_new((void *)mblk_pool, blktotal, MBLK_POOL_SIZE >> 3);
    MYASSERT(mblk_pool_test != NULL);

    get_avail = blktotal - csi_kernel_mpool_get_count(mblk_pool_test);
    MYASSERT(get_avail == blktotal);

    return 0;
}

static void task_mm_blk_entry_private(void)
{
    mm_blk_reinit_case1();
    test_case_success++;
    PRINT_RESULT(MODULE_NAME, PASS);

    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void mm_blk_reinit_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_mm_blk_entry_private, MODULE_NAME, 0, TASK_MM_BLK_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_mm_blk);

    if ((ret != K_OK)) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }

    next_test_case_wait();
}
