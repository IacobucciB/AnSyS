import numpy as np
import matplotlib.pyplot as plt


def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)



t = np.linspace(-2, 2, 1000)


y = triangle(t)


plt.plot(t, y)
plt.grid(True)
plt.savefig("output/ej2-0a.png")
plt.close()


t = np.linspace(-2, 4, 1000)
h_t = 2 * triangle(((t - 1) / 2))
plt.plot(t, h_t)
plt.grid(True)
plt.savefig("output/ej2-0b.png")
plt.close()

