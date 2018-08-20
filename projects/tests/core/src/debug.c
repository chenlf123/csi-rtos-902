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

int test_debug(void)
{
#ifdef DEBUG_HAD
    printf("Testing debug access\n");

    /*
     * to host
     */
    HAD_SendChar("h");
    HAD_SendChar("e");
    HAD_SendChar("l");
    HAD_SendChar("l");
    HAD_SendChar("o");

    /*
     * from host
     */
    printf("%c ", HAD_ReceiveChar());
    printf("%c ", HAD_ReceiveChar());
    printf("%c ", HAD_ReceiveChar());
    printf("%c ", HAD_ReceiveChar());
    printf("%c ", HAD_ReceiveChar());
    printf("\n");

    /*
     * check buf
     */
    printf("%d ", HAD_CheckChar());
    printf("%d ", *(unsigned int *)0xe001103c);
    ASSERT_TRUE(HAD_CheckChar() == *(unsigned int *)0xe001103c);
    printf("%d ", HAD_CheckChar());
    printf("%d ", *(unsigned int *)0xe001103c);
    ASSERT_TRUE(HAD_CheckChar() == *(unsigned int *)0xe001103c);
    printf("%d ", HAD_CheckChar());
    printf("%d ", *(unsigned int *)0xe001103c);
    ASSERT_TRUE(HAD_CheckChar() == *(unsigned int *)0xe001103c);
    printf("%d ", HAD_CheckChar());
    printf("%d ", *(unsigned int *)0xe001103c);
    ASSERT_TRUE(HAD_CheckChar() == *(unsigned int *)0xe001103c);
    printf("%d ", HAD_CheckChar());
    printf("%d ", *(unsigned int *)0xe001103c);
    ASSERT_TRUE(HAD_CheckChar() == *(unsigned int *)0xe001103c);
    printf("\n");

#endif
    return 0;
}
