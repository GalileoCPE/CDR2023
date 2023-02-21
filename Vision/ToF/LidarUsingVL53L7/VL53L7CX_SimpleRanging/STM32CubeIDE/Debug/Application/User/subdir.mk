################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/app_tof.c \
C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/app_tof_pin_conf.c \
C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/custom_ranging_sensor.c \
C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/main.c \
C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/stm32f4xx_hal_msp.c \
C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/stm32f4xx_it.c \
C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/stm32f4xx_nucleo.c \
C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/stm32f4xx_nucleo_bus.c \
../Application/User/syscalls.c \
../Application/User/sysmem.c 

OBJS += \
./Application/User/app_tof.o \
./Application/User/app_tof_pin_conf.o \
./Application/User/custom_ranging_sensor.o \
./Application/User/main.o \
./Application/User/stm32f4xx_hal_msp.o \
./Application/User/stm32f4xx_it.o \
./Application/User/stm32f4xx_nucleo.o \
./Application/User/stm32f4xx_nucleo_bus.o \
./Application/User/syscalls.o \
./Application/User/sysmem.o 

C_DEPS += \
./Application/User/app_tof.d \
./Application/User/app_tof_pin_conf.d \
./Application/User/custom_ranging_sensor.d \
./Application/User/main.d \
./Application/User/stm32f4xx_hal_msp.d \
./Application/User/stm32f4xx_it.d \
./Application/User/stm32f4xx_nucleo.d \
./Application/User/stm32f4xx_nucleo_bus.d \
./Application/User/syscalls.d \
./Application/User/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/app_tof.o: C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/app_tof.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../../Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/Components/vl53l7cx/modules -I../../../../../../../Drivers/BSP/Components/vl53l7cx/porting -I../../../../../../../Drivers/BSP/Components/vl53l7cx -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/app_tof.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/app_tof_pin_conf.o: C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/app_tof_pin_conf.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../../Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/Components/vl53l7cx/modules -I../../../../../../../Drivers/BSP/Components/vl53l7cx/porting -I../../../../../../../Drivers/BSP/Components/vl53l7cx -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/app_tof_pin_conf.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/custom_ranging_sensor.o: C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/custom_ranging_sensor.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../../Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/Components/vl53l7cx/modules -I../../../../../../../Drivers/BSP/Components/vl53l7cx/porting -I../../../../../../../Drivers/BSP/Components/vl53l7cx -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/custom_ranging_sensor.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/main.o: C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/main.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../../Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/Components/vl53l7cx/modules -I../../../../../../../Drivers/BSP/Components/vl53l7cx/porting -I../../../../../../../Drivers/BSP/Components/vl53l7cx -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/main.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stm32f4xx_hal_msp.o: C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/stm32f4xx_hal_msp.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../../Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/Components/vl53l7cx/modules -I../../../../../../../Drivers/BSP/Components/vl53l7cx/porting -I../../../../../../../Drivers/BSP/Components/vl53l7cx -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/stm32f4xx_hal_msp.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stm32f4xx_it.o: C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/stm32f4xx_it.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../../Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/Components/vl53l7cx/modules -I../../../../../../../Drivers/BSP/Components/vl53l7cx/porting -I../../../../../../../Drivers/BSP/Components/vl53l7cx -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/stm32f4xx_it.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stm32f4xx_nucleo.o: C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/stm32f4xx_nucleo.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../../Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/Components/vl53l7cx/modules -I../../../../../../../Drivers/BSP/Components/vl53l7cx/porting -I../../../../../../../Drivers/BSP/Components/vl53l7cx -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/stm32f4xx_nucleo.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/stm32f4xx_nucleo_bus.o: C:/Users/alixd/Documents/Development/Galileo/Lidar\ using\ L53L7/VL53L7CX_SimpleRanging/Src/stm32f4xx_nucleo_bus.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../../Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/Components/vl53l7cx/modules -I../../../../../../../Drivers/BSP/Components/vl53l7cx/porting -I../../../../../../../Drivers/BSP/Components/vl53l7cx -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Application/User/stm32f4xx_nucleo_bus.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/%.o Application/User/%.su: ../Application/User/%.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../../Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc -I../../../../../../../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../../../../../../../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/Components/vl53l7cx/modules -I../../../../../../../Drivers/BSP/Components/vl53l7cx/porting -I../../../../../../../Drivers/BSP/Components/vl53l7cx -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-User

clean-Application-2f-User:
	-$(RM) ./Application/User/app_tof.d ./Application/User/app_tof.o ./Application/User/app_tof.su ./Application/User/app_tof_pin_conf.d ./Application/User/app_tof_pin_conf.o ./Application/User/app_tof_pin_conf.su ./Application/User/custom_ranging_sensor.d ./Application/User/custom_ranging_sensor.o ./Application/User/custom_ranging_sensor.su ./Application/User/main.d ./Application/User/main.o ./Application/User/main.su ./Application/User/stm32f4xx_hal_msp.d ./Application/User/stm32f4xx_hal_msp.o ./Application/User/stm32f4xx_hal_msp.su ./Application/User/stm32f4xx_it.d ./Application/User/stm32f4xx_it.o ./Application/User/stm32f4xx_it.su ./Application/User/stm32f4xx_nucleo.d ./Application/User/stm32f4xx_nucleo.o ./Application/User/stm32f4xx_nucleo.su ./Application/User/stm32f4xx_nucleo_bus.d ./Application/User/stm32f4xx_nucleo_bus.o ./Application/User/stm32f4xx_nucleo_bus.su ./Application/User/syscalls.d ./Application/User/syscalls.o ./Application/User/syscalls.su ./Application/User/sysmem.d ./Application/User/sysmem.o ./Application/User/sysmem.su

.PHONY: clean-Application-2f-User

