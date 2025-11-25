import numpy as np
import matplotlib.pyplot as plt


def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)


T = 2


t = np.linspace(-2, 2, 1000)
X_f = triangle(t*T)
plt.plot(t, X_f)
plt.grid(True)
plt.show()


t = np.linspace(-5, 5, 1000)
x_t = 1/T * np.sinc(t / T)**2
plt.plot(t, x_t)
plt.grid(True)
plt.show()


t = np.linspace(-5, 5, 1000)
dt = t[1] - t[0]
X_ff = np.fft.fftshift(np.fft.fft(x_t)) * dt
f_fft = np.fft.fftshift(np.fft.fftfreq(len(t), dt))
plt.plot(f_fft, np.abs(X_ff))
plt.xlim(-2, 2)
plt.grid(True)
plt.show()