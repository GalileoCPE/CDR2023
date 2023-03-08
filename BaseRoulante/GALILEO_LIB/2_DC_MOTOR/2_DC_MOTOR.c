/*
 * File: 2_DC_MOTOR.c
 * Driver Name: [[ 2 DC MOTOR ]]
 * Created on:
 * Ver: 1.0
 * Author:     Galileo CPE
 *
 *	Le timer 1 doit être paramétré à ~72-80MHz
 *	Le 1er PWM doit être sur le PWM GENERATION CH1
 *	et le 2eme sur PWM GENERATION CH2N
 *
 *	Les pins A et B de direction des moteurs
 *	doivent avoir le label "MCC_Xy" avec X=(1 ou 2) et y=(a ou b)
 */
#include "2_DC_MOTOR.h"
#include "../../Core/Inc/main.h"
#include "../../Drivers/STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal.h"
TIM_HandleTypeDef htim1;

void DC_MOTORS_move(uint8_t au8_DIR, uint16_t au16_SPEED)
{
	DC_MOTOR_1_Start(au8_DIR, au16_SPEED);
	DC_MOTOR_2_Start(au8_DIR, au16_SPEED);
}

void DC_MOTORS_turn(uint8_t au8_DIR, uint16_t au16_SPEED)
{
	if (au8_DIR == DIR_R){
		DC_MOTOR_1_Start(DIR_FW, au16_SPEED);
		DC_MOTOR_2_Start(DIR_BW, au16_SPEED);
	}else{
		DC_MOTOR_1_Start(DIR_BW, au16_SPEED);
		DC_MOTOR_2_Start(DIR_FW, au16_SPEED);
	}

}

void DC_MOTORS_stop()
{
	DC_MOTOR_1_Stop();
	DC_MOTOR_2_Stop();
}

void DC_MOTORS_Init(TIM_HandleTypeDef h)
{
	htim1 = h;
	HAL_TIM_PWM_Start( &htim1,TIM_CHANNEL_1 );
	HAL_TIMEx_PWMN_Start( &htim1,TIM_CHANNEL_2 );
}

// ---------------------------
// Motor 1
// ---------------------------

void DC_MOTOR_1_Start(uint8_t au8_DIR, uint16_t au16_SPEED) // u16_SPEED is a percentage (0-100)
{
	DC_MOTOR_1_Set_Speed(au16_SPEED);
	DC_MOTOR_1_Set_Dir(au8_DIR);
}

void DC_MOTOR_1_Set_Speed(uint16_t au16_SPEED) // u16_SPEED is a percentage (0-100)
{
	__HAL_TIM_SetCompare( &htim1,TIM_CHANNEL_1,au16_SPEED);
}

void DC_MOTOR_1_Set_Dir(uint8_t au8_DIR)
{
	if (au8_DIR == DIR_FW){
		HAL_GPIO_WritePin(MCC_1a_GPIO_Port, MCC_1a_Pin, GPIO_PIN_RESET);
		HAL_GPIO_WritePin(MCC_1b_GPIO_Port, MCC_1b_Pin, GPIO_PIN_SET);
	} else {
		HAL_GPIO_WritePin(MCC_1a_GPIO_Port, MCC_1a_Pin, GPIO_PIN_SET);
		HAL_GPIO_WritePin(MCC_1b_GPIO_Port, MCC_1b_Pin, GPIO_PIN_RESET);
	}
}

void DC_MOTOR_1_Stop()
{
	HAL_GPIO_WritePin(MCC_1a_GPIO_Port, MCC_1a_Pin, GPIO_PIN_SET);
	HAL_GPIO_WritePin(MCC_1b_GPIO_Port, MCC_1b_Pin, GPIO_PIN_SET);
}


// ---------------------------
// Motor 2
// ---------------------------

void DC_MOTOR_2_Start(uint8_t au8_DIR, uint16_t au16_SPEED)
{
	DC_MOTOR_2_Set_Speed(au16_SPEED);
	DC_MOTOR_2_Set_Dir(au8_DIR);
}

void DC_MOTOR_2_Set_Speed(uint16_t au16_SPEED) // u16_SPEED is a percentage (0-100)
{
	__HAL_TIM_SetCompare( &htim1,TIM_CHANNEL_2,au16_SPEED);
}

void DC_MOTOR_2_Set_Dir(uint8_t au8_DIR)
{
	if (au8_DIR == DIR_FW){
		HAL_GPIO_WritePin(MCC_2a_GPIO_Port, MCC_2a_Pin, GPIO_PIN_RESET);
		HAL_GPIO_WritePin(MCC_2b_GPIO_Port, MCC_2b_Pin, GPIO_PIN_SET);
	} else {
		HAL_GPIO_WritePin(MCC_2a_GPIO_Port, MCC_2a_Pin, GPIO_PIN_SET);
		HAL_GPIO_WritePin(MCC_2b_GPIO_Port, MCC_2b_Pin, GPIO_PIN_RESET);
	}
}

void DC_MOTOR_2_Stop()
{
	HAL_GPIO_WritePin(MCC_2a_GPIO_Port, MCC_2a_Pin, GPIO_PIN_SET);
	HAL_GPIO_WritePin(MCC_2b_GPIO_Port, MCC_2b_Pin, GPIO_PIN_SET);
}
