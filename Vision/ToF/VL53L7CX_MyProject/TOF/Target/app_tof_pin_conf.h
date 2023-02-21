/**
 ******************************************************************************
 * @file    app_tof_pin_conf.h
 * @author  IMG SW Application Team
 * @brief   This file contains definitions for TOF pins
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2022 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __APP_TOF_PIN_CONF_H__
#define __APP_TOF_PIN_CONF_H__

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"

/* Exported symbols ----------------------------------------------------------*/
#define TOF_INT_EXTI_PIN    (GPIO_PIN_4)
#define TOF_INT_EXTI_PORT   (GPIOA)

#ifdef __cplusplus
}
#endif

#endif /* __APP_TOF_PIN_CONF_H__ */
