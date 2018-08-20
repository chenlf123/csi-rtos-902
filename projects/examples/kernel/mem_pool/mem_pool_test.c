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
 * @file     mem_pool_test.c
 * @brief    the main function for the mem_pool test
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include "test_kernel.h"
#include <csi_kernel.h>
#include <stdint.h>

void example_main(void)
{
    int32_t *p_blk = NULL;
    int32_t uwBlkSize = 20, uwBlkCnt = 5;
    int32_t uwRet;
    int32_t pBoxMem[100];
    k_mpool_handle_t mp_handle = csi_kernel_mpool_new(&pBoxMem[0], uwBlkCnt, uwBlkSize);

    if (mp_handle == NULL) {
        printf("fail to create memory pool!\n");
        return;
    } else {
        printf("cerate memory pool successfully!\n");
    }

    p_blk = csi_kernel_mpool_alloc(mp_handle, 0);

    if (NULL == p_blk) {
        printf("failt to allocate block!\n");
        return;
    }

    printf("allocate block successfully!\n");

    int32_t *p_w = p_blk;
    *p_w = 444;

    printf("write block done.\n");

    uwRet = csi_kernel_mpool_free(mp_handle, p_blk);

    if (0 == uwRet) {
        printf("block free successfully!\n");
    } else {
        printf("fail to free block!\n");
    }

    csi_kernel_task_del(csi_kernel_task_get_cur());
}
