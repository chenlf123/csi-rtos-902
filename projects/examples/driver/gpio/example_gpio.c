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
 * @file     example_gpio.c
 * @brief    the main function for the GPIO driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include <stdio.h>
#include "soc.h"
#include "drv_gpio.h"
#include "pin_name.h"
#include "pin.h"

volatile static bool int_flag = 1;

static void gpio_interrupt_handler(int32_t idx)
{
    int_flag = 0;
}

void example_pin_gpio_init(void)
{
    drv_pinmux_config(EXAMPLE_GPIO_PIN, EXAMPLE_GPIO_PIN_FUNC);
}

void gpio_falling_edge_interrupt(pin_name_e gpio_pin)
{
    gpio_pin_handle_t *pin = NULL;

    example_pin_gpio_init();

    printf("please change the gpio pin %s from high to low\r\n", EXAMPLE_BOARD_GPIO_PIN_NAME);
    pin = csi_gpio_pin_initialize(gpio_pin, gpio_interrupt_handler);

    csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
    csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_INPUT);
    csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);

    while (int_flag);

    int_flag = 1;
    csi_gpio_pin_uninitialize(pin);
    printf("gpio falling_edge test successfully!!!\n");
    printf("test gpio successfully\n");
}

/*****************************************************************************
test_gpio: main function of the gpio test

INPUT: NULL

RETURN: NULL

*****************************************************************************/
int example_gpio(pin_name_e gpio_pin)
{
    gpio_falling_edge_interrupt(gpio_pin);
    return 0;
}

int main(void)
{
    return example_gpio(EXAMPLE_GPIO_PIN);
}
