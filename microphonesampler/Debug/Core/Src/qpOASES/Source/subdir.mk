################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/qpOASES/Source/Bounds.c \
../Core/Src/qpOASES/Source/Constraints.c \
../Core/Src/qpOASES/Source/Flipper.c \
../Core/Src/qpOASES/Source/Indexlist.c \
../Core/Src/qpOASES/Source/Matrices.c \
../Core/Src/qpOASES/Source/MessageHandling.c \
../Core/Src/qpOASES/Source/OQPinterface.c \
../Core/Src/qpOASES/Source/Options.c \
../Core/Src/qpOASES/Source/QProblem.c \
../Core/Src/qpOASES/Source/QProblemB.c \
../Core/Src/qpOASES/Source/Utils.c 

OBJS += \
./Core/Src/qpOASES/Source/Bounds.o \
./Core/Src/qpOASES/Source/Constraints.o \
./Core/Src/qpOASES/Source/Flipper.o \
./Core/Src/qpOASES/Source/Indexlist.o \
./Core/Src/qpOASES/Source/Matrices.o \
./Core/Src/qpOASES/Source/MessageHandling.o \
./Core/Src/qpOASES/Source/OQPinterface.o \
./Core/Src/qpOASES/Source/Options.o \
./Core/Src/qpOASES/Source/QProblem.o \
./Core/Src/qpOASES/Source/QProblemB.o \
./Core/Src/qpOASES/Source/Utils.o 

C_DEPS += \
./Core/Src/qpOASES/Source/Bounds.d \
./Core/Src/qpOASES/Source/Constraints.d \
./Core/Src/qpOASES/Source/Flipper.d \
./Core/Src/qpOASES/Source/Indexlist.d \
./Core/Src/qpOASES/Source/Matrices.d \
./Core/Src/qpOASES/Source/MessageHandling.d \
./Core/Src/qpOASES/Source/OQPinterface.d \
./Core/Src/qpOASES/Source/Options.d \
./Core/Src/qpOASES/Source/QProblem.d \
./Core/Src/qpOASES/Source/QProblemB.d \
./Core/Src/qpOASES/Source/Utils.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/qpOASES/Source/%.o Core/Src/qpOASES/Source/%.su Core/Src/qpOASES/Source/%.cyclo: ../Core/Src/qpOASES/Source/%.c Core/Src/qpOASES/Source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I"/home/nikhil/STM32CubeIDE/workspace_1.13.2/microphonesampler/Drivers/CMSIS/DSP_DRIVERS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-qpOASES-2f-Source

clean-Core-2f-Src-2f-qpOASES-2f-Source:
	-$(RM) ./Core/Src/qpOASES/Source/Bounds.cyclo ./Core/Src/qpOASES/Source/Bounds.d ./Core/Src/qpOASES/Source/Bounds.o ./Core/Src/qpOASES/Source/Bounds.su ./Core/Src/qpOASES/Source/Constraints.cyclo ./Core/Src/qpOASES/Source/Constraints.d ./Core/Src/qpOASES/Source/Constraints.o ./Core/Src/qpOASES/Source/Constraints.su ./Core/Src/qpOASES/Source/Flipper.cyclo ./Core/Src/qpOASES/Source/Flipper.d ./Core/Src/qpOASES/Source/Flipper.o ./Core/Src/qpOASES/Source/Flipper.su ./Core/Src/qpOASES/Source/Indexlist.cyclo ./Core/Src/qpOASES/Source/Indexlist.d ./Core/Src/qpOASES/Source/Indexlist.o ./Core/Src/qpOASES/Source/Indexlist.su ./Core/Src/qpOASES/Source/Matrices.cyclo ./Core/Src/qpOASES/Source/Matrices.d ./Core/Src/qpOASES/Source/Matrices.o ./Core/Src/qpOASES/Source/Matrices.su ./Core/Src/qpOASES/Source/MessageHandling.cyclo ./Core/Src/qpOASES/Source/MessageHandling.d ./Core/Src/qpOASES/Source/MessageHandling.o ./Core/Src/qpOASES/Source/MessageHandling.su ./Core/Src/qpOASES/Source/OQPinterface.cyclo ./Core/Src/qpOASES/Source/OQPinterface.d ./Core/Src/qpOASES/Source/OQPinterface.o ./Core/Src/qpOASES/Source/OQPinterface.su ./Core/Src/qpOASES/Source/Options.cyclo ./Core/Src/qpOASES/Source/Options.d ./Core/Src/qpOASES/Source/Options.o ./Core/Src/qpOASES/Source/Options.su ./Core/Src/qpOASES/Source/QProblem.cyclo ./Core/Src/qpOASES/Source/QProblem.d ./Core/Src/qpOASES/Source/QProblem.o ./Core/Src/qpOASES/Source/QProblem.su ./Core/Src/qpOASES/Source/QProblemB.cyclo ./Core/Src/qpOASES/Source/QProblemB.d ./Core/Src/qpOASES/Source/QProblemB.o ./Core/Src/qpOASES/Source/QProblemB.su ./Core/Src/qpOASES/Source/Utils.cyclo ./Core/Src/qpOASES/Source/Utils.d ./Core/Src/qpOASES/Source/Utils.o ./Core/Src/qpOASES/Source/Utils.su

.PHONY: clean-Core-2f-Src-2f-qpOASES-2f-Source

