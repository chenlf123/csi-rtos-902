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
 * @file     vectors.S
 * @brief    define default vector handlers. Should use with
 *           GCC for CSKY Embedded Processors
 * @version  V1.0
 * @date     28. Nove 2017
 ******************************************************************************/

#include <csi_config.h>

.global trap_c

.section .bss
    .align  2
    .globl  g_trapstackalloc
    .global g_trapstackbase
    .global g_top_trapstack
g_trapstackalloc:
g_trapstackbase:
    .space 768
g_top_trapstack:

    .align 2
    .globl g_trap_sp
    .type  g_trap_sp, object
g_trap_sp:
    .long 0
    .size g_trap_sp, .-g_trap_sp

.text

/******************************************************************************
 * Functions:
 *     void trap(void);
 * default exception handler
 ******************************************************************************/
    .global trap
    .type   trap, %function
trap:
     j   trap
#    psrset  ee
#
#    subi    sp, 4
#    stw     r13, (sp)
#    addi    sp, 4
#
#    lrw     r13, g_trap_sp
#    stw     sp, (r13)
#
#    lrw     sp, g_top_trapstack
#
#    mov     r0, r0
#    subi    sp, 72
#    stm     r0-r12, (sp)
#
#    lrw     r0, g_trap_sp
#    ldw     r0, (r0)
#
#    subi    r0, 4
#    ldw     r13, (r0)
#
#    stw     r13, (sp, 52)
#
#    stw     r0, (sp, 56)
#    stw     r15, (sp, 60)
#    mfcr    r0, epsr
#    stw     r0, (sp, 64)
#    mfcr    r0, epc
#    stw     r0, (sp, 68)
#
#    mov     r0, sp
#
#    /* for backtrace */
#    subi    sp, 8
#    stw     r8, (sp, 0)
#    stw     r15, (sp, 4)
#    mov     r8, sp
#
#    lrw     r1, trap_c
#    jmp     r1


    .align  1
    .weak   Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    j      trap
    .size   Default_Handler, . - Default_Handler

/*    Macro to define default handlers. Default handler
 *    will be weak symbol and just dead loops. They can be
 *    overwritten by other handlers */
    .macro  def_irq_handler handler_name
    .weak   \handler_name
    .globl  \handler_name
    .set    \handler_name, Default_Handler
    .endm

    def_irq_handler CORET_IRQHandler
    def_irq_handler STIM0_IRQHandler
    def_irq_handler STIM1_IRQHandler
    def_irq_handler STIM2_IRQHandler
    def_irq_handler STIM3_IRQHandler
    def_irq_handler TIM0_IRQHandler
    def_irq_handler TIM1_IRQHandler
    def_irq_handler TIM2_IRQHandler
    def_irq_handler TIM3_IRQHandler
    def_irq_handler USART_IRQHandler
    def_irq_handler GPIO0_IRQHandler
    def_irq_handler GPIO1_IRQHandler
    def_irq_handler GPIO2_IRQHandler
    def_irq_handler GPIO3_IRQHandler
    def_irq_handler GPIO4_IRQHandler
    def_irq_handler GPIO5_IRQHandler
    def_irq_handler GPIO6_IRQHandler
    def_irq_handler GPIO7_IRQHandler
    def_irq_handler PAD_IRQHandler
