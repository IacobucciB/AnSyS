import numpy as np
import matplotlib.pyplot as plt


def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)


t = np.linspace(-4, 4, 1000)
dt = t[1] - t[0]

f = 5
y = triangle(t) * np.cos(2 * np.pi * f * t)

Y = np.fft.fft(y)
freq = np.fft.fftfreq(len(t), dt)

Y = np.fft.fftshift(Y)
freq = np.fft.fftshift(freq)

Y = np.abs(Y) * dt

plt.plot(freq, Y)
plt.grid(True)
plt.show()
