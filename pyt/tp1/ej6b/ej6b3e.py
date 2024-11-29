import numpy as np
import matplotlib.pyplot as plt

n = np.arange(-1, 8)

x_n = np.zeros(n.shape)

signal = (n >= 0) & (n <= 4)
x_n[signal] = 1

odd_indices = (n % 2 != 0)
n_odd = n[odd_indices]
x_n_odd = x_n[odd_indices]

plt.stem(n_odd, x_n_odd, basefmt=" ")

plt.grid(True)
plt.gca().tick_params(labelsize=18)

plt.show()
