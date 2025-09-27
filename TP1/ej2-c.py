import numpy as np
import matplotlib.pyplot as plt


def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)


def h(t):
    return 2 * triangle(((t - 1) / 2))


t = np.linspace(-17, -5, 1000)
y = 2 * h(-0.5 * (t + 10))
plt.plot(t, y)
plt.grid(True)
plt.savefig("output/ej2-c.png")

