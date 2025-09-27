import numpy as np
import matplotlib.pyplot as plt


def deltaK(n):
    return np.where(n == 0, 1, 0)


def x(n):
    return deltaK(n) + deltaK(n - 1) + deltaK(n - 2) + deltaK(n - 3) + deltaK(n - 4)


n = np.arange(-10, 7)
x_n = x(-n - 3)
y = x_n


plt.stem(n, y, basefmt=" ")
plt.grid(True)
plt.savefig("output/ej3-d.png")
