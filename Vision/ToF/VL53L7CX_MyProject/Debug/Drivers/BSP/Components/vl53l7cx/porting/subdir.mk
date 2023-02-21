################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/vl53l7cx/porting/platform.c 

OBJS += \
./Drivers/BSP/Components/vl53l7cx/porting/platform.o 

C_DEPS += \
./Drivers/BSP/Components/vl53l7cx/porting/platform.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/vl53l7cx/porting/%.o Drivers/BSP/Components/vl53l7cx/porting/%.su: ../Drivers/BSP/Components/vl53l7cx/porting/%.c Drivers/BSP/Components/vl53l7cx/porting/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../TOF/App -I../TOF/Target -I../Core/Inc -I../Drivers/BSP/STM32F4xx_Nucleo -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Drivers/BSP/Components/vl53l7cx/modules -I../Drivers/BSP/Components/vl53l7cx/porting -I../Drivers/BSP/Components/vl53l7cx -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-vl53l7cx-2f-porting

clean-Drivers-2f-BSP-2f-Components-2f-vl53l7cx-2f-porting:
	-$(RM) ./Drivers/BSP/Components/vl53l7cx/porting/platform.d ./Drivers/BSP/Components/vl53l7cx/porting/platform.o ./Drivers/BSP/Components/vl53l7cx/porting/platform.su

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-vl53l7cx-2f-porting

