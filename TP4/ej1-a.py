import numpy as np
import matplotlib.pyplot as plt


def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)


t = np.linspace(-4, 4, 1000)

f = 5
y = triangle(t) * np.cos(2 * np.pi * f * t)

plt.plot(t, y)
plt.grid(True)
plt.show()
