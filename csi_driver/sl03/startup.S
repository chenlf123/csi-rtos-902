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
 * @file     startup.S
 * @brief    startup file for smartl-ck803. Should use with
 *           GCC for CSKY Embedded Processors
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/

#include <csi_config.h>

#undef  VIC_TSPR
#define VIC_TSPR  0xE000EC10

#.import tspend_handler
#.import CORET_IRQHandler
#.import Default_Handler
#
#    .section .vectors
#    .align  10
#    .globl  __Vectors
#    .type   __Vectors, @object
#__Vectors:
#    .long   Reset_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
##ifndef CONFIG_KERNEL_NONE
#    .long   tspend_handler
##else
#    .long   Default_Handler
##endif
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#    .long   Default_Handler
#
#    /* External interrupts */
#    .long    USART_IRQHandler        /*  0:  UART         */
#    .long    CORET_IRQHandler        /*  1:  CoreTIM      */
#    .long    TIM0_IRQHandler         /*  2:  Timer0       */
#    .long    TIM1_IRQHandler         /*  3:  Timer1       */
#    .long    TIM2_IRQHandler         /*  4:  Timer2       */
#    .long    TIM3_IRQHandler         /*  5:  Timer3       */
#    .long    Default_Handler
#    .long    GPIO0_IRQHandler        /*  7:  GPIO0        */
#    .long    GPIO1_IRQHandler        /*  8:  GPIO1        */
#    .long    GPIO2_IRQHandler        /*  9:  GPIO2        */
#    .long    GPIO3_IRQHandler        /*  10: GPIO3        */
#    .long    GPIO4_IRQHandler        /*  11: GPIO4        */
#    .long    GPIO5_IRQHandler        /*  12: GPIO5        */
#    .long    GPIO6_IRQHandler        /*  13: GPIO6        */
#    .long    GPIO7_IRQHandler        /*  14: GPIO7        */
#    .long    Default_Handler
#    .long    STIM0_IRQHandler        /*  16: STimer0      */
#    .long    STIM1_IRQHandler        /*  17: STimer1      */
#    .long    STIM2_IRQHandler        /*  18: STimer2      */
#    .long    STIM3_IRQHandler        /*  19: STimer3      */
#    .long    PAD_IRQHandler          /*  20: pad          */
#
#    .size    __Vectors, . - __Vectors

    .text
    .align   1
_start:
    .text
    .align   1
    .globl   Reset_Handler
    .type    Reset_Handler, %function
Reset_Handler:
//    li       a0, 0
//    csrw     mstatus, a0

    li       a0, 0x800
    csrw     mie, a0

    la       a0, trap
    csrw     mtvec, a0

    la       x2, g_top_irqstack

/*
 *  The ranges of copy from/to are specified by following symbols
 *    __etext: LMA of start of the section to copy from. Usually end of text
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
#    lrw     r1, __erodata
#    lrw     r2, __data_start__
#    lrw     r3, __data_end__
#
#    subu    r3, r2
#    cmpnei  r3, 0
#    bf      .L_loop0_done
#
#.L_loop0:
#    ldw     r0, (r1, 0)
#    stw     r0, (r2, 0)
#    addi    r1, 4
#    addi    r2, 4
#    subi    r3, 4
#    cmpnei  r3, 0
#    bt      .L_loop0
#
#.L_loop0_done:

/*
 *  The BSS section is specified by following symbols
 *    __bss_start__: start of the BSS section.
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
    la      x3, __bss_start__
    la      x4, __bss_end__

    li      x5, 0

    sub    x4, x4, x3
    beqz    x4, .L_loop1_done

.L_loop1:
    sw      x5, 0(x3)
    addi    x3, x3, 4
    addi    x4, x4, -4
    bnez    x4, .L_loop1

.L_loop1_done:

#if defined(CONFIG_SEPARATE_IRQ_SP) && !defined(CONFIG_KERNEL_NONE)
    /* init hardware separate interrupt sp*/
    #lrw     r0, g_top_irqstack
    #mtcr    r0, cr<15, 1>

    #mfcr    r0, cr<31, 0>
    #bseti   r0, 14
    #mtcr    r0, cr<31, 0>
#endif

#ifndef __NO_SYSTEM_INIT
    jal    SystemInit
#endif

#ifndef __NO_BOARD_INIT
    jal    board_init
#endif

#ifndef CONFIG_KERNEL_NONE
#    lrw     r0, VIC_TSPR
#    movi    r1, 0xb00
#    stw     r1, (r0)
#endif

    jal    main
    .size   Reset_Handler, . - Reset_Handler

__exit:
    j __exit

.section .bss

    .align  2
    .globl  g_intstackalloc
    .global g_intstackbase
    .global g_top_irqstack
g_intstackalloc:
g_intstackbase:
    .space  CONFIG_ARCH_INTERRUPTSTACK
g_top_irqstack:

    .end
