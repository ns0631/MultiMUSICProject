from pyargus.directionEstimation import *
import matplotlib.pyplot as plt
import numpy as np
import serial, sys
import time
from scipy.signal import hilbert, butter, lfilter, filtfilt
import scipy.fftpack
import peakutils

fir_coeffs = np.genfromtxt('fir_coeffs.txt')

def butter_bandpass(lowcut, highcut, fs, order=5):
    return butter(order, [lowcut, highcut], fs=fs, btype='band')

def butter_bandpass_filter(data, lowcut, highcut, fs, order=4):
    b, a = butter_bandpass(lowcut, highcut, fs, order=order)
    #y = lfilter(b, a, data)
    #y = filtfilt(fir_coeffs, [1.0], data)
    y = filtfilt(b, a, data)
    return y

numtaps = 256

freq = 9000
c = 343
width = 1.49e-2

fs = 125000
order = 5
lowcut = 8.9e3 #freq - 100
highcut = 9.1e3 #freq + 100

M = 3  # number of antenna elements in the antenna system (ULA)
N = 2**10

cutoff = np.array([lowcut, highcut])
fir_coeffs = scipy.signal.firwin(numtaps, cutoff, pass_zero='bandpass', fs=fs, window='hamming')

wavelength = c / freq
d = width / wavelength
t0 = time.time()

#array_alignment = np.arange(0, M, 1)* d
incident_angles= np.arange(0,181,1)
#ula_scanning_vectors = gen_ula_scanning_vectors(array_alignment, incident_angles)

# Generate scanning vectors with the general purpose function
x = np.arange(0, M, 1) * d  # x coordinates
y = np.zeros(M) # y coordinates
scanning_vectors = gen_scanning_vectors(M, x, y, incident_angles)

ser = serial.Serial('/dev/ttyUSB0', 921600, timeout=2)
f4 = serial.Serial('/dev/ttyACM2', 115200, timeout=2)

samples = list()
failed = False
i = 0

phone1 = np.zeros(N, dtype=np.float32)
phone2 = np.zeros(N, dtype=np.float32)
phone3 = np.zeros(N, dtype=np.float32)
iteration = 0

#Kalman filter stuff
#z = np.random.normal(x,15,size=sz) # observations (normal about x, sigma=0.1)

while True:
    i %= 1024
    dataline = ser.readline(110)

    try:
        parsed = dataline.decode()

        if 'start' in parsed:
            failed = False

            phone1 = np.zeros(N, dtype=np.float32)
            phone2 = np.zeros(N, dtype=np.float32)
            phone3 = np.zeros(N, dtype=np.float32)
            i = 0

            xhat = [0] * 30
            Q = 1e-5 # process variance
            # allocate space for arrays
            Pminus=0#np.zeros(sz)    # a priori error estimate
            K=0#np.zeros(sz)         # gain or blending factor
            R_ = 0.08**2 # estimate of measurement variance, change to see effect
            P = 1.0

        elif 'end' in parsed:
            if failed:
                continue
            iteration += 1

            #plt.plot(phone1)
            #plt.plot(phone2)
            #plt.plot(phone3)
            #plt.show()

            roi_1 = filtfilt(fir_coeffs, [1.0], phone1) #butter_bandpass_filter(phone1, lowcut, highcut, fs)
            roi_2 = filtfilt(fir_coeffs, [1.0], phone2) #butter_bandpass_filter(phone2, lowcut, highcut, fs)
            roi_3 = filtfilt(fir_coeffs, [1.0], phone3) #butter_bandpass_filter(phone3, lowcut, highcut, fs)

            rec_signal = hilbert(np.array([roi_1, roi_2, roi_3]))

            R = corr_matrix_estimate(rec_signal.T, imp='fast')

            MUSIC_spectrum = DOA_MUSIC(R, scanning_vectors, signal_dimension = 1)
            estimate = np.argmax(MUSIC_spectrum)
            samples = samples[-24:] + [estimate]

            print('Estimated AoA:', estimate)
            print('Rolling average:', sum(samples) / len(samples))
            print('Time interval:', time.time() - t0)

            if iteration % 25 == 0:
                """
                xhatminus = samples[0]
                for k in range(1,30):
                    Pminus = P + Q
                    K = Pminus / ( Pminus + R_ )
                    xhat[k] = xhatminus + K * (samples[k] - xhatminus)
                    P = (1 - K) * Pminus
                    #xhatminus = xhat[k]
                print(samples, xhat)
                """
                #breakpoint()
                f4.write(bytes(f'{sum(samples) / len(samples)}\r\n', 'UTF-8'))
                #f4.write(bytes(f'{round(xhat[-1], 2)}\r\n', 'UTF-8'))
                time.sleep(1.0)
        else:
            if failed:
                continue

            data = parsed[4:-2].split(' ')
            if len(data) < 3:
                continue
            #breakpoint()
            try:
                phone1[i] = float(data[0]) / 8192
                phone2[i] = float(data[1]) / 8192
                phone3[i] = float(data[2]) / 8192
            except ValueError:
                failed = True
                print(data)

            i += 1
    except UnicodeDecodeError:
        print('MUSIC terminated due to unicode decode error.')
        break
