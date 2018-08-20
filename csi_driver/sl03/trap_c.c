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
 * @file     trap_c.c
 * @brief    source file for the trap process
 * @version  V1.0
 * @date     12. December 2017
 ******************************************************************************/

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <csi_config.h>

void trap_c(uint32_t *regs)
{
    int i = 0, j = 0;
    int32_t inc = 0;
    uint32_t vec = 0;
//    asm volatile(
//        "mfcr    %0, psr \n"
//        "lsri    %0, 16 \n"
//        "sextb   %0 \n"
//        :"=r"(vec):);

    printf("CPU Exception : %d", vec);
    printf("\n");

#ifdef __CSKY_HARD_FLOAT__
    for (i = 0; i < 16; i++) {
        printf("vr%d: %08x\t", i, regs[i]);

        if ((i % 5) == 4) {
            printf("\n");
        }
    }
    inc += 16;
#endif

    for (; i < (16 + inc); i++, j++) {
        printf("r%d: %08x\t", j, regs[i]);

        if ((i % 5) == 4) {
            printf("\n");
        }
    }
    inc += 16;

#ifdef __CSKY_DSPV2__
    for (; i < (16 + inc); i++, j++) {
        printf("r%d: %08x\t", j, regs[i]);

        if ((i % 5) == 4) {
            printf("\n");
        }
    }
#endif

    printf("\n");
    printf("epsr: %8x\n", regs[i]);
    printf("epc : %8x\n", regs[i + 1]);

    while (1);
}

