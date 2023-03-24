/*
 * File: 2_DC_MOTOR.h
 * Driver Name: [[ 2 DC MOTOR ]]
 * Created on:
 * Ver: 1.0
 * Author:     Galileo CPE
 *
 *
 *	Les pins de données des capteurs suiveurs de lignes
 *	doivent avoir le label "TRIG_Line_Right" et "TRIG_Line_Left"
 */

#include "../../Core/Inc/main.h"

uint8_t isRightLineBlack(){
	return HAL_GPIO_ReadPin(TRIG_Line_Right_GPIO_Port, TRIG_Line_Right_Pin) != 0;
}

uint8_t isLeftLineBlack(){
	return HAL_GPIO_ReadPin(TRIG_Line_Left_GPIO_Port, TRIG_Line_Left_Pin) != 0;
}
