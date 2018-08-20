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
#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

#define TEST_4KB    0x1000
#define TEST_8KB    0x2000
#define TEST_16KB   0x4000

#define TEST_BASE0    (CSKY_SRAM_BASE)
#define TEST_BASE1    (TEST_BASE0 + REGION_SIZE_4KB)
#define TEST_BASE2    (TEST_BASE1 + REGION_SIZE_8KB)
#define TEST_BASE3    (TEST_BASE2 + REGION_SIZE_16KB)
#define TEST_BASE4    (TEST_BASE3 + REGION_SIZE_8KB)

int test_mpu(void)
{
    mpu_region_attr_t  attr_test;
    attr_test.nx = 0;
    attr_test.ap = AP_BOTH_RW;
    attr_test.s = 0;

    csi_mpu_config_region(0, TEST_BASE0, REGION_SIZE_4GB, attr_test, 1);
    csi_mpu_enable();

    attr_test.nx = 0;
    attr_test.ap = AP_BOTH_RW;
    attr_test.s = 0;

    csi_mpu_config_region(1, TEST_BASE0, REGION_SIZE_4KB, attr_test, 1);
    csi_mpu_enable_region(1);

    csi_mpu_config_region(2, TEST_BASE1, REGION_SIZE_8KB, attr_test, 1);
    csi_mpu_enable_region(2);

    csi_mpu_config_region(3, TEST_BASE2, REGION_SIZE_16KB, attr_test, 1);
    csi_mpu_enable_region(3);

    printf("three mpu region has been confiured and enabled.\n\r");
    printf("region 0: 0x%x--0x%x, region 1: 0x%x--0x%x, region 2: 0x%x--0x%x\n",
           (uint32_t)TEST_BASE0, (uint32_t)(TEST_BASE0 + TEST_4KB),
           (uint32_t)(TEST_BASE0 + TEST_4KB), (uint32_t)(TEST_BASE0 + TEST_4KB + TEST_8KB),
           (uint32_t)(TEST_BASE0 + TEST_4KB + TEST_8KB), (uint32_t)(TEST_BASE0 + TEST_4KB + TEST_8KB + TEST_16KB));

    csi_mpu_disable();
    csi_mpu_disable_region(0);
    csi_mpu_disable_region(1);
    csi_mpu_disable_region(2);
    csi_mpu_disable_region(3);

    ASSERT_TRUE(1);
    return 0;
}
