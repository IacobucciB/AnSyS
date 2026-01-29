import numpy as np
import matplotlib.pyplot as plt


def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)


def h(t):
    return 2 * triangle(((t - 1) / 2))


def odd_part(h, t):
    return (h(t) - h(-t)) / 2


def even_part(h, t):
    return (h(t) + h(-t)) / 2


t = np.linspace(-4, 4, 1000)
y = even_part(h, t)
plt.plot(t, y)
plt.grid(True)
plt.show()
