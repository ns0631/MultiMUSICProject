################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/Lapack/Install/dlamch.c \
../Core/Src/Lapack/Install/slamch.c 

OBJS += \
./Core/Src/Lapack/Install/dlamch.o \
./Core/Src/Lapack/Install/slamch.o 

C_DEPS += \
./Core/Src/Lapack/Install/dlamch.d \
./Core/Src/Lapack/Install/slamch.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/Lapack/Install/%.o Core/Src/Lapack/Install/%.su Core/Src/Lapack/Install/%.cyclo: ../Core/Src/Lapack/Install/%.c Core/Src/Lapack/Install/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I"/home/nikhil/STM32CubeIDE/workspace_1.13.2/microphonesampler/Drivers/CMSIS/DSP_DRIVERS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-Lapack-2f-Install

clean-Core-2f-Src-2f-Lapack-2f-Install:
	-$(RM) ./Core/Src/Lapack/Install/dlamch.cyclo ./Core/Src/Lapack/Install/dlamch.d ./Core/Src/Lapack/Install/dlamch.o ./Core/Src/Lapack/Install/dlamch.su ./Core/Src/Lapack/Install/slamch.cyclo ./Core/Src/Lapack/Install/slamch.d ./Core/Src/Lapack/Install/slamch.o ./Core/Src/Lapack/Install/slamch.su

.PHONY: clean-Core-2f-Src-2f-Lapack-2f-Install

