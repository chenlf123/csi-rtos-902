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
 * @file     example_cache.c
 * @brief    the main function for the timer driver
 * @version  V1.0
 * @date     25. March 2017
 ******************************************************************************/

#include <stdint.h>
#include <stdio.h>
#include <soc.h>
#include <csi_core.h>

int example_cache(void)
{
    printf("cache example:\n");
    csi_dcache_clean_invalid();
    csi_icache_disable();
    printf("enable instruction cache.\n");
    csi_icache_enable();
    csi_dcache_disable();
    printf("enable data cache.\n");
    csi_dcache_enable();

    printf("run cache example successfully.\n");
    return 0;
}

int main(void)
{
    return example_cache();
}
