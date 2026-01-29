import numpy as np
import matplotlib.pyplot as plt


def rect(t):
    return np.where((t >= -0.5) & (t <= 0.5), 1, 0)


def x(t):
    return (t + 2) ** 2 * rect((t + 1.5)) + t ** 2 * rect((t + 0.5))


t = np.linspace(-4, 2, 1000)
y = x(t)
plt.plot(t, y)
plt.grid(True)
plt.show()