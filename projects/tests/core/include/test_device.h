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
#ifndef TEST_DEVICE_H
#define TEST_DEVICE_H

#include <stdint.h>
#include "soc.h"
#include "csi_core.h"

struct unary_calculation {
    uint32_t op1;
    uint32_t result;
};

struct binary_calculation {
    uint32_t op1;
    uint32_t op2;
    uint32_t result;
};

struct ternary_calculation {
    uint32_t op1;
    uint32_t op2;
    uint32_t op3;
    uint32_t result;
};

struct ternary64_calculation {
    uint32_t op1;
    uint32_t op2;
    uint64_t op3;
    uint64_t result;
};

#define TEST_SIZE 3
//#ifdef __NO_TESTCODE__
extern unsigned int *tst_addr;
//#else
//unsigned int tst_addr = 0x2000cff8;
//#endif

#endif  /* TEST_DEVICE_H */
