/*
 * File: 2_DC_MOTOR.h
 * Driver Name: [[ 2 DC MOTOR ]]
 * Created on:
 * Ver: 1.0
 * Author:     Galileo CPE
 *
 */

#define HAL_TIM_MODULE_ENABLED

// DC Motor Rotation Directions
#define DIR_FW    0 // forward direction
#define DIR_BW   1 // backward direction
#define DIR_R    0 // right direction
#define DIR_L   1 // left direction

/*-----[ Prototypes For All Functions ]-----*/

void DC_MOTORS_Init();

void DC_MOTORS_move(uint8_t au8_DIR, uint16_t au16_SPEED);
void DC_MOTORS_turn(uint8_t au8_DIR, uint16_t au16_SPEED);
void DC_MOTORS_stop();

void DC_MOTOR_1_Start(uint8_t au8_DIR, uint16_t au16_SPEED);
void DC_MOTOR_1_Set_Speed(uint16_t au16_SPEED);
void DC_MOTOR_1_Set_Dir(uint8_t au8_DIR);
void DC_MOTOR_1_Stop();

void DC_MOTOR_2_Start(uint8_t au8_DIR, uint16_t au16_SPEED);
void DC_MOTOR_2_Set_Speed(uint16_t au16_SPEED);
void DC_MOTOR_2_Set_Dir(uint8_t au8_DIR);
void DC_MOTOR_2_Stop();

