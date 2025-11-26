import numpy as np
import matplotlib.pyplot as plt


def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)


def rect(t):
    return np.where((t >= -0.5) & (t <= 0.5), 1, 0)


def X(f):
    return triangle(f * T)


T = 2
K = 5
fs = 1 / T
f = np.linspace(-1, 1, 1000)
t = np.linspace(-1, 1, 1000)

X_f = triangle(f*T)
LPF = rect(f*T)


plt.plot(f, X_f)
plt.plot(f, LPF)
plt.grid(True)
plt.show()

X_f_filtered = X_f * LPF

plt.plot(f, X_f_filtered)
plt.grid(True)
plt.show()


X_ff_tri = 0.5 * triangle(2*f*T)
X_ff_rect = 0.5 * rect(f*T)
X_ff = X_ff_tri + X_ff_rect


plt.plot(f, X_ff_tri, linestyle='--')
plt.plot(f, X_ff_rect, linestyle='--')
plt.plot(f, X_ff)
plt.grid(True)
plt.show()