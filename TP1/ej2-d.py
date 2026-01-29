import numpy as np
import matplotlib.pyplot as plt


def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)


def u(t):
    return np.where(t >= 0, 1, 0)


def h(t):
    return 2 * triangle(((t - 1) / 2))


t = np.linspace(-5, 5, 1000)
y = h(t * 0.5) * (u(t + 2) - u(t - 2))
plt.plot(t, y)
plt.grid(True)
plt.show()
