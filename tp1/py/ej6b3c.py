import numpy as np
import matplotlib.pyplot as plt

n = np.arange(-5, 8)

x_n = np.zeros(n.shape)

signal = (n**2 >= 0) & (n**2 <= 4)
x_n[signal] = 1

plt.stem(n, x_n, basefmt=" ")

plt.grid(True)
plt.gca().tick_params(labelsize=18)

plt.show()
