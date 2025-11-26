import numpy as np
import matplotlib.pyplot as plt


def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)


def X(f):
    return triangle(f * T)


T = 2
K = 5
fs = 1 / T
f = np.linspace(-2, 2, 1000)
t = np.linspace(-2, 2, 1000)

X_f = triangle(f*T)

plt.plot(f, X_f)
plt.grid(True)
plt.show()

Xs = np.zeros_like(f)

for k in range(-K, K + 1):
    X_sk = (1/T) * X(f - k * fs)
    Xs += (1/T) * X(f - k * fs)
    plt.plot(f, X_sk, linestyle='--')

plt.plot(f, Xs)
plt.grid(True)
plt.ylim(0, max(Xs) + 0.5)
plt.show()