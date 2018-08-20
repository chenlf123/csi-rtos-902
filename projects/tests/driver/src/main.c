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
 * @file     main.c
 * @brief    CSI Source File for main
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include <csi_config.h>
#include "dtest.h"
#include <stdint.h>
#include "test_driver_config.h"

extern int test_usart(void);
extern int test_spu_usart(void);
extern int test_usi_usart(void);
extern int test_trng(void);
extern int test_crc(void);
extern int test_eflash(void);
extern int test_spiflash(void);
extern int test_timer(void);
extern int test_gpio(void);
extern int test_aes(void);
extern int test_iic(void);
extern int test_spu_iic(void);
extern int test_usi_iic(void);
extern int test_rsa(void);
extern int test_rtc(void);
extern int test_spi(void);
extern int test_spu_spi(void);
extern int test_usi_spi(void);
extern int test_wdt(void);
extern int test_sha(void);
extern int test_pwm(void);
extern int test_dmac(void);
extern int test_eth(void);
extern int test_i2s(void);

extern void syslog_init(void);

int dtest(void)
{
#if defined(TEST_USART)
    test_usart();
#endif

#if defined(TEST_SPU_USART)
    test_spu_usart();
#endif

#if defined(TEST_USI_USART)
    test_usi_usart();
#endif

#if defined(TEST_SPI)
    test_spi();
#endif

#if defined(TEST_SPU_SPI)
    test_spu_spi();
#endif

#if defined(TEST_USI_SPI)
    test_usi_spi();
#endif
#if defined(TEST_TRNG)
    test_trng();
#endif

#if defined(TEST_CRC)
    test_crc();
#endif

#if defined(TEST_EFLASH)
    test_eflash();
#endif

#if defined(TEST_SPIFLASH)
    test_spiflash();
#endif

#if defined(TEST_TIMER)
    test_timer();
#endif

#if defined(TEST_GPIO)
    test_gpio();
#endif

#if defined(TEST_AES)
    test_aes();
#endif

#if defined(TEST_IIC)
    test_iic();
#endif

#if defined(TEST_SPU_IIC)
    test_spu_iic();
#endif

#if defined(TEST_USI_IIC)
    test_usi_iic();
#endif

#if defined(TEST_RSA)
    test_rsa();
#endif

#if defined(TEST_RTC)
    test_rtc();
#endif

#if defined(TEST_SHA)
    test_sha();
#endif

#if defined(TEST_PWM)
    test_pwm();
#endif

#if defined(TEST_DMAC)
    test_dmac();
#endif

#if defined(TEST_WDT)
    test_wdt();
#endif

#if defined(TEST_ETH)
    test_eth();
#endif

#if defined(TEST_I2S)
    test_i2s();
#endif
    return 0;
}

int __attribute__((weak)) main(void)
{
    dtest_init();

    dtest();

    dtest_run();

    dtest_print_result();

    dtest_cleanup();

    return 0;
}
