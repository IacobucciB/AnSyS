import numpy as np
import matplotlib.pyplot as plt


def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)


def h(t):
    return 2 * triangle(((t - 1) / 2))


t = np.linspace(0, 4, 1000)
y = h((2 * t) - 3)
plt.plot(t, y)
plt.grid(True)
plt.show()
