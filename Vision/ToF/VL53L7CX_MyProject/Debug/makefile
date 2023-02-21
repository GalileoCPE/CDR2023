################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include TOF/Target/subdir.mk
-include TOF/App/subdir.mk
-include Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include Drivers/BSP/STM32F4xx_Nucleo/subdir.mk
-include Drivers/BSP/Components/vl53l7cx/porting/subdir.mk
-include Drivers/BSP/Components/vl53l7cx/modules/subdir.mk
-include Drivers/BSP/Components/vl53l7cx/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := VL53L7CX_MyProject
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
VL53L7CX_MyProject.elf \

MAP_FILES += \
VL53L7CX_MyProject.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
VL53L7CX_MyProject.list \

OBJCOPY_HEX += \
VL53L7CX_MyProject.hex \

OBJCOPY_BIN += \
VL53L7CX_MyProject.bin \


# All Target
all: main-build

# Main-build Target
main-build: VL53L7CX_MyProject.elf secondary-outputs

# Tool invocations
VL53L7CX_MyProject.elf VL53L7CX_MyProject.map: $(OBJS) $(USER_OBJS) C:\Users\alixd\STM32CubeIDE\workspace_1.10.1\VL53L7CX_MyProject\STM32F401RETX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "VL53L7CX_MyProject.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"C:\Users\alixd\STM32CubeIDE\workspace_1.10.1\VL53L7CX_MyProject\STM32F401RETX_FLASH.ld" --specs=nosys.specs -Wl,-Map="VL53L7CX_MyProject.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

VL53L7CX_MyProject.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "VL53L7CX_MyProject.list"
	@echo 'Finished building: $@'
	@echo ' '

VL53L7CX_MyProject.hex: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O ihex $(EXECUTABLES) "VL53L7CX_MyProject.hex"
	@echo 'Finished building: $@'
	@echo ' '

VL53L7CX_MyProject.bin: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "VL53L7CX_MyProject.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) VL53L7CX_MyProject.bin VL53L7CX_MyProject.elf VL53L7CX_MyProject.hex VL53L7CX_MyProject.list VL53L7CX_MyProject.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_HEX) $(OBJCOPY_BIN)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
