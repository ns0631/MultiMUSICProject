################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/Lapack/Blas/daxpy.c \
../Core/Src/Lapack/Blas/dcabs1.c \
../Core/Src/Lapack/Blas/dcopy.c \
../Core/Src/Lapack/Blas/ddot.c \
../Core/Src/Lapack/Blas/dgemm.c \
../Core/Src/Lapack/Blas/dgemv.c \
../Core/Src/Lapack/Blas/dger.c \
../Core/Src/Lapack/Blas/dnrm2.c \
../Core/Src/Lapack/Blas/drot.c \
../Core/Src/Lapack/Blas/dscal.c \
../Core/Src/Lapack/Blas/dswap.c \
../Core/Src/Lapack/Blas/dtrmm.c \
../Core/Src/Lapack/Blas/dtrmv.c \
../Core/Src/Lapack/Blas/dtrsm.c \
../Core/Src/Lapack/Blas/dzasum.c \
../Core/Src/Lapack/Blas/dznrm2.c \
../Core/Src/Lapack/Blas/idamax.c \
../Core/Src/Lapack/Blas/isamax.c \
../Core/Src/Lapack/Blas/izamax.c \
../Core/Src/Lapack/Blas/lsame.c \
../Core/Src/Lapack/Blas/saxpy.c \
../Core/Src/Lapack/Blas/scopy.c \
../Core/Src/Lapack/Blas/sdot.c \
../Core/Src/Lapack/Blas/sgemm.c \
../Core/Src/Lapack/Blas/sgemv.c \
../Core/Src/Lapack/Blas/sger.c \
../Core/Src/Lapack/Blas/snrm2.c \
../Core/Src/Lapack/Blas/srot.c \
../Core/Src/Lapack/Blas/sscal.c \
../Core/Src/Lapack/Blas/sswap.c \
../Core/Src/Lapack/Blas/strmm.c \
../Core/Src/Lapack/Blas/strmv.c \
../Core/Src/Lapack/Blas/strsm.c \
../Core/Src/Lapack/Blas/xerbla.c \
../Core/Src/Lapack/Blas/zaxpy.c \
../Core/Src/Lapack/Blas/zcopy.c \
../Core/Src/Lapack/Blas/zdotc.c \
../Core/Src/Lapack/Blas/zdotu.c \
../Core/Src/Lapack/Blas/zdscal.c \
../Core/Src/Lapack/Blas/zgemm.c \
../Core/Src/Lapack/Blas/zgemv.c \
../Core/Src/Lapack/Blas/zgerc.c \
../Core/Src/Lapack/Blas/zscal.c \
../Core/Src/Lapack/Blas/zswap.c \
../Core/Src/Lapack/Blas/ztrmm.c \
../Core/Src/Lapack/Blas/ztrmv.c \
../Core/Src/Lapack/Blas/ztrsv.c 

OBJS += \
./Core/Src/Lapack/Blas/daxpy.o \
./Core/Src/Lapack/Blas/dcabs1.o \
./Core/Src/Lapack/Blas/dcopy.o \
./Core/Src/Lapack/Blas/ddot.o \
./Core/Src/Lapack/Blas/dgemm.o \
./Core/Src/Lapack/Blas/dgemv.o \
./Core/Src/Lapack/Blas/dger.o \
./Core/Src/Lapack/Blas/dnrm2.o \
./Core/Src/Lapack/Blas/drot.o \
./Core/Src/Lapack/Blas/dscal.o \
./Core/Src/Lapack/Blas/dswap.o \
./Core/Src/Lapack/Blas/dtrmm.o \
./Core/Src/Lapack/Blas/dtrmv.o \
./Core/Src/Lapack/Blas/dtrsm.o \
./Core/Src/Lapack/Blas/dzasum.o \
./Core/Src/Lapack/Blas/dznrm2.o \
./Core/Src/Lapack/Blas/idamax.o \
./Core/Src/Lapack/Blas/isamax.o \
./Core/Src/Lapack/Blas/izamax.o \
./Core/Src/Lapack/Blas/lsame.o \
./Core/Src/Lapack/Blas/saxpy.o \
./Core/Src/Lapack/Blas/scopy.o \
./Core/Src/Lapack/Blas/sdot.o \
./Core/Src/Lapack/Blas/sgemm.o \
./Core/Src/Lapack/Blas/sgemv.o \
./Core/Src/Lapack/Blas/sger.o \
./Core/Src/Lapack/Blas/snrm2.o \
./Core/Src/Lapack/Blas/srot.o \
./Core/Src/Lapack/Blas/sscal.o \
./Core/Src/Lapack/Blas/sswap.o \
./Core/Src/Lapack/Blas/strmm.o \
./Core/Src/Lapack/Blas/strmv.o \
./Core/Src/Lapack/Blas/strsm.o \
./Core/Src/Lapack/Blas/xerbla.o \
./Core/Src/Lapack/Blas/zaxpy.o \
./Core/Src/Lapack/Blas/zcopy.o \
./Core/Src/Lapack/Blas/zdotc.o \
./Core/Src/Lapack/Blas/zdotu.o \
./Core/Src/Lapack/Blas/zdscal.o \
./Core/Src/Lapack/Blas/zgemm.o \
./Core/Src/Lapack/Blas/zgemv.o \
./Core/Src/Lapack/Blas/zgerc.o \
./Core/Src/Lapack/Blas/zscal.o \
./Core/Src/Lapack/Blas/zswap.o \
./Core/Src/Lapack/Blas/ztrmm.o \
./Core/Src/Lapack/Blas/ztrmv.o \
./Core/Src/Lapack/Blas/ztrsv.o 

C_DEPS += \
./Core/Src/Lapack/Blas/daxpy.d \
./Core/Src/Lapack/Blas/dcabs1.d \
./Core/Src/Lapack/Blas/dcopy.d \
./Core/Src/Lapack/Blas/ddot.d \
./Core/Src/Lapack/Blas/dgemm.d \
./Core/Src/Lapack/Blas/dgemv.d \
./Core/Src/Lapack/Blas/dger.d \
./Core/Src/Lapack/Blas/dnrm2.d \
./Core/Src/Lapack/Blas/drot.d \
./Core/Src/Lapack/Blas/dscal.d \
./Core/Src/Lapack/Blas/dswap.d \
./Core/Src/Lapack/Blas/dtrmm.d \
./Core/Src/Lapack/Blas/dtrmv.d \
./Core/Src/Lapack/Blas/dtrsm.d \
./Core/Src/Lapack/Blas/dzasum.d \
./Core/Src/Lapack/Blas/dznrm2.d \
./Core/Src/Lapack/Blas/idamax.d \
./Core/Src/Lapack/Blas/isamax.d \
./Core/Src/Lapack/Blas/izamax.d \
./Core/Src/Lapack/Blas/lsame.d \
./Core/Src/Lapack/Blas/saxpy.d \
./Core/Src/Lapack/Blas/scopy.d \
./Core/Src/Lapack/Blas/sdot.d \
./Core/Src/Lapack/Blas/sgemm.d \
./Core/Src/Lapack/Blas/sgemv.d \
./Core/Src/Lapack/Blas/sger.d \
./Core/Src/Lapack/Blas/snrm2.d \
./Core/Src/Lapack/Blas/srot.d \
./Core/Src/Lapack/Blas/sscal.d \
./Core/Src/Lapack/Blas/sswap.d \
./Core/Src/Lapack/Blas/strmm.d \
./Core/Src/Lapack/Blas/strmv.d \
./Core/Src/Lapack/Blas/strsm.d \
./Core/Src/Lapack/Blas/xerbla.d \
./Core/Src/Lapack/Blas/zaxpy.d \
./Core/Src/Lapack/Blas/zcopy.d \
./Core/Src/Lapack/Blas/zdotc.d \
./Core/Src/Lapack/Blas/zdotu.d \
./Core/Src/Lapack/Blas/zdscal.d \
./Core/Src/Lapack/Blas/zgemm.d \
./Core/Src/Lapack/Blas/zgemv.d \
./Core/Src/Lapack/Blas/zgerc.d \
./Core/Src/Lapack/Blas/zscal.d \
./Core/Src/Lapack/Blas/zswap.d \
./Core/Src/Lapack/Blas/ztrmm.d \
./Core/Src/Lapack/Blas/ztrmv.d \
./Core/Src/Lapack/Blas/ztrsv.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/Lapack/Blas/%.o Core/Src/Lapack/Blas/%.su Core/Src/Lapack/Blas/%.cyclo: ../Core/Src/Lapack/Blas/%.c Core/Src/Lapack/Blas/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../Drivers/CMSIS/Include -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I"/home/nikhil/STM32CubeIDE/workspace_1.13.2/microphonesampler/Drivers/CMSIS/DSP_DRIVERS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-Lapack-2f-Blas

clean-Core-2f-Src-2f-Lapack-2f-Blas:
	-$(RM) ./Core/Src/Lapack/Blas/daxpy.cyclo ./Core/Src/Lapack/Blas/daxpy.d ./Core/Src/Lapack/Blas/daxpy.o ./Core/Src/Lapack/Blas/daxpy.su ./Core/Src/Lapack/Blas/dcabs1.cyclo ./Core/Src/Lapack/Blas/dcabs1.d ./Core/Src/Lapack/Blas/dcabs1.o ./Core/Src/Lapack/Blas/dcabs1.su ./Core/Src/Lapack/Blas/dcopy.cyclo ./Core/Src/Lapack/Blas/dcopy.d ./Core/Src/Lapack/Blas/dcopy.o ./Core/Src/Lapack/Blas/dcopy.su ./Core/Src/Lapack/Blas/ddot.cyclo ./Core/Src/Lapack/Blas/ddot.d ./Core/Src/Lapack/Blas/ddot.o ./Core/Src/Lapack/Blas/ddot.su ./Core/Src/Lapack/Blas/dgemm.cyclo ./Core/Src/Lapack/Blas/dgemm.d ./Core/Src/Lapack/Blas/dgemm.o ./Core/Src/Lapack/Blas/dgemm.su ./Core/Src/Lapack/Blas/dgemv.cyclo ./Core/Src/Lapack/Blas/dgemv.d ./Core/Src/Lapack/Blas/dgemv.o ./Core/Src/Lapack/Blas/dgemv.su ./Core/Src/Lapack/Blas/dger.cyclo ./Core/Src/Lapack/Blas/dger.d ./Core/Src/Lapack/Blas/dger.o ./Core/Src/Lapack/Blas/dger.su ./Core/Src/Lapack/Blas/dnrm2.cyclo ./Core/Src/Lapack/Blas/dnrm2.d ./Core/Src/Lapack/Blas/dnrm2.o ./Core/Src/Lapack/Blas/dnrm2.su ./Core/Src/Lapack/Blas/drot.cyclo ./Core/Src/Lapack/Blas/drot.d ./Core/Src/Lapack/Blas/drot.o ./Core/Src/Lapack/Blas/drot.su ./Core/Src/Lapack/Blas/dscal.cyclo ./Core/Src/Lapack/Blas/dscal.d ./Core/Src/Lapack/Blas/dscal.o ./Core/Src/Lapack/Blas/dscal.su ./Core/Src/Lapack/Blas/dswap.cyclo ./Core/Src/Lapack/Blas/dswap.d ./Core/Src/Lapack/Blas/dswap.o ./Core/Src/Lapack/Blas/dswap.su ./Core/Src/Lapack/Blas/dtrmm.cyclo ./Core/Src/Lapack/Blas/dtrmm.d ./Core/Src/Lapack/Blas/dtrmm.o ./Core/Src/Lapack/Blas/dtrmm.su ./Core/Src/Lapack/Blas/dtrmv.cyclo ./Core/Src/Lapack/Blas/dtrmv.d ./Core/Src/Lapack/Blas/dtrmv.o ./Core/Src/Lapack/Blas/dtrmv.su ./Core/Src/Lapack/Blas/dtrsm.cyclo ./Core/Src/Lapack/Blas/dtrsm.d ./Core/Src/Lapack/Blas/dtrsm.o ./Core/Src/Lapack/Blas/dtrsm.su ./Core/Src/Lapack/Blas/dzasum.cyclo ./Core/Src/Lapack/Blas/dzasum.d ./Core/Src/Lapack/Blas/dzasum.o ./Core/Src/Lapack/Blas/dzasum.su ./Core/Src/Lapack/Blas/dznrm2.cyclo ./Core/Src/Lapack/Blas/dznrm2.d ./Core/Src/Lapack/Blas/dznrm2.o ./Core/Src/Lapack/Blas/dznrm2.su ./Core/Src/Lapack/Blas/idamax.cyclo ./Core/Src/Lapack/Blas/idamax.d ./Core/Src/Lapack/Blas/idamax.o ./Core/Src/Lapack/Blas/idamax.su ./Core/Src/Lapack/Blas/isamax.cyclo ./Core/Src/Lapack/Blas/isamax.d ./Core/Src/Lapack/Blas/isamax.o ./Core/Src/Lapack/Blas/isamax.su ./Core/Src/Lapack/Blas/izamax.cyclo ./Core/Src/Lapack/Blas/izamax.d ./Core/Src/Lapack/Blas/izamax.o ./Core/Src/Lapack/Blas/izamax.su ./Core/Src/Lapack/Blas/lsame.cyclo ./Core/Src/Lapack/Blas/lsame.d ./Core/Src/Lapack/Blas/lsame.o ./Core/Src/Lapack/Blas/lsame.su ./Core/Src/Lapack/Blas/saxpy.cyclo ./Core/Src/Lapack/Blas/saxpy.d ./Core/Src/Lapack/Blas/saxpy.o ./Core/Src/Lapack/Blas/saxpy.su ./Core/Src/Lapack/Blas/scopy.cyclo ./Core/Src/Lapack/Blas/scopy.d ./Core/Src/Lapack/Blas/scopy.o ./Core/Src/Lapack/Blas/scopy.su ./Core/Src/Lapack/Blas/sdot.cyclo ./Core/Src/Lapack/Blas/sdot.d ./Core/Src/Lapack/Blas/sdot.o ./Core/Src/Lapack/Blas/sdot.su ./Core/Src/Lapack/Blas/sgemm.cyclo ./Core/Src/Lapack/Blas/sgemm.d ./Core/Src/Lapack/Blas/sgemm.o ./Core/Src/Lapack/Blas/sgemm.su ./Core/Src/Lapack/Blas/sgemv.cyclo ./Core/Src/Lapack/Blas/sgemv.d ./Core/Src/Lapack/Blas/sgemv.o ./Core/Src/Lapack/Blas/sgemv.su ./Core/Src/Lapack/Blas/sger.cyclo ./Core/Src/Lapack/Blas/sger.d ./Core/Src/Lapack/Blas/sger.o ./Core/Src/Lapack/Blas/sger.su ./Core/Src/Lapack/Blas/snrm2.cyclo ./Core/Src/Lapack/Blas/snrm2.d ./Core/Src/Lapack/Blas/snrm2.o ./Core/Src/Lapack/Blas/snrm2.su ./Core/Src/Lapack/Blas/srot.cyclo ./Core/Src/Lapack/Blas/srot.d ./Core/Src/Lapack/Blas/srot.o ./Core/Src/Lapack/Blas/srot.su ./Core/Src/Lapack/Blas/sscal.cyclo ./Core/Src/Lapack/Blas/sscal.d ./Core/Src/Lapack/Blas/sscal.o ./Core/Src/Lapack/Blas/sscal.su ./Core/Src/Lapack/Blas/sswap.cyclo ./Core/Src/Lapack/Blas/sswap.d ./Core/Src/Lapack/Blas/sswap.o ./Core/Src/Lapack/Blas/sswap.su ./Core/Src/Lapack/Blas/strmm.cyclo ./Core/Src/Lapack/Blas/strmm.d ./Core/Src/Lapack/Blas/strmm.o ./Core/Src/Lapack/Blas/strmm.su ./Core/Src/Lapack/Blas/strmv.cyclo ./Core/Src/Lapack/Blas/strmv.d ./Core/Src/Lapack/Blas/strmv.o ./Core/Src/Lapack/Blas/strmv.su ./Core/Src/Lapack/Blas/strsm.cyclo ./Core/Src/Lapack/Blas/strsm.d ./Core/Src/Lapack/Blas/strsm.o ./Core/Src/Lapack/Blas/strsm.su ./Core/Src/Lapack/Blas/xerbla.cyclo ./Core/Src/Lapack/Blas/xerbla.d ./Core/Src/Lapack/Blas/xerbla.o ./Core/Src/Lapack/Blas/xerbla.su ./Core/Src/Lapack/Blas/zaxpy.cyclo ./Core/Src/Lapack/Blas/zaxpy.d ./Core/Src/Lapack/Blas/zaxpy.o ./Core/Src/Lapack/Blas/zaxpy.su ./Core/Src/Lapack/Blas/zcopy.cyclo ./Core/Src/Lapack/Blas/zcopy.d ./Core/Src/Lapack/Blas/zcopy.o ./Core/Src/Lapack/Blas/zcopy.su ./Core/Src/Lapack/Blas/zdotc.cyclo ./Core/Src/Lapack/Blas/zdotc.d ./Core/Src/Lapack/Blas/zdotc.o ./Core/Src/Lapack/Blas/zdotc.su ./Core/Src/Lapack/Blas/zdotu.cyclo ./Core/Src/Lapack/Blas/zdotu.d ./Core/Src/Lapack/Blas/zdotu.o ./Core/Src/Lapack/Blas/zdotu.su ./Core/Src/Lapack/Blas/zdscal.cyclo ./Core/Src/Lapack/Blas/zdscal.d ./Core/Src/Lapack/Blas/zdscal.o ./Core/Src/Lapack/Blas/zdscal.su ./Core/Src/Lapack/Blas/zgemm.cyclo ./Core/Src/Lapack/Blas/zgemm.d ./Core/Src/Lapack/Blas/zgemm.o ./Core/Src/Lapack/Blas/zgemm.su ./Core/Src/Lapack/Blas/zgemv.cyclo ./Core/Src/Lapack/Blas/zgemv.d ./Core/Src/Lapack/Blas/zgemv.o ./Core/Src/Lapack/Blas/zgemv.su ./Core/Src/Lapack/Blas/zgerc.cyclo ./Core/Src/Lapack/Blas/zgerc.d ./Core/Src/Lapack/Blas/zgerc.o ./Core/Src/Lapack/Blas/zgerc.su ./Core/Src/Lapack/Blas/zscal.cyclo ./Core/Src/Lapack/Blas/zscal.d ./Core/Src/Lapack/Blas/zscal.o ./Core/Src/Lapack/Blas/zscal.su ./Core/Src/Lapack/Blas/zswap.cyclo ./Core/Src/Lapack/Blas/zswap.d ./Core/Src/Lapack/Blas/zswap.o ./Core/Src/Lapack/Blas/zswap.su ./Core/Src/Lapack/Blas/ztrmm.cyclo ./Core/Src/Lapack/Blas/ztrmm.d ./Core/Src/Lapack/Blas/ztrmm.o ./Core/Src/Lapack/Blas/ztrmm.su ./Core/Src/Lapack/Blas/ztrmv.cyclo ./Core/Src/Lapack/Blas/ztrmv.d ./Core/Src/Lapack/Blas/ztrmv.o ./Core/Src/Lapack/Blas/ztrmv.su ./Core/Src/Lapack/Blas/ztrsv.cyclo
	-$(RM) ./Core/Src/Lapack/Blas/ztrsv.d ./Core/Src/Lapack/Blas/ztrsv.o ./Core/Src/Lapack/Blas/ztrsv.su

.PHONY: clean-Core-2f-Src-2f-Lapack-2f-Blas

