/******************************************************************************
 * @file     dhry_timer_port.c
 * @brief    the systimer for the Dhrystone
 * @version  V1.0
 * @date     20. July 2016
 ******************************************************************************/
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
#include "drv_timer.h"
#include "soc.h"


/* APB frequence definition */
#define APB_FREQ       SYSTEM_CLOCK
#define TIMER_LOADTIMER           100000000 /* 10s */
#define TIMER_LOADCOUNT           TIMER_LOADTIMER * (APB_FREQ / 1000000)


static unsigned int SysTimer_LoopCount = 0;

static timer_handle_t timer_handle;

/*
 * Callback function for TIMER0 interrupt, set timer_flag.
 */
static void timer_cb_fun(int32_t idx,timer_event_e event)
{
	SysTimer_LoopCount++;
}

unsigned  long long Timer_CurrentValue()
{
  unsigned int cv;
  csi_timer_get_current_value (timer_handle, &cv);
  return (unsigned long long)(SysTimer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv -1;
}

/*
 *start  systimer
 *
 */
void Timer_Open()
{
    timer_handle = csi_timer_initialize(0, timer_cb_fun);
    csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    csi_timer_set_timeout(timer_handle, TIMER_LOADTIMER);
}

void Timer_Start()
{
    csi_timer_start(timer_handle);
}
void Timer_Stop()
{
    csi_timer_stop(timer_handle);
}

void Timer_Close()
{
    csi_timer_uninitialize(timer_handle);
}

/* time(uS) since run */
unsigned long long  clock_gettime()
{

    unsigned long long  systimer_val, systimer_us;
    systimer_val = Timer_CurrentValue();
    systimer_us  = systimer_val * 1000000/ APB_FREQ;
    return  systimer_us;
}

/* run time since run (seconds)*/
 long time()
{
    unsigned long long systimer_val;
    systimer_val = Timer_CurrentValue();
    return (long)(systimer_val / APB_FREQ);
}

