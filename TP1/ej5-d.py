import numpy as np
import matplotlib.pyplot as plt


def u(t):
    return np.where(t >= 0, 1, 0)


def x(t):
    return 3 * t * (u(t) - u(t - 2))


t = np.linspace(-1, 3, 1000)
y = x(t)
plt.plot(t, y)
plt.grid(True)
plt.savefig("output/ej5-d.png")
