MUSIC.py - Python3 program running on main computer. Responsible for FIR filter, MUSIC algorithm, aggregating estimates, and sending aggregated estimates to stm32f4 microcontroller
microphonesampler - stm32 software package running on stm32g4 microcontroller. Responsible for data acquisition, FFTs, and passing data onto main computer via RS232.
mics - Zephyr RTOS software package running on stm32f4 microcontroller. Responsible for controlling/orienting servo toward received estimate from computer.
