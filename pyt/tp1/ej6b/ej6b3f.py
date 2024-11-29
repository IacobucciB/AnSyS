import numpy as np
import matplotlib.pyplot as plt

n = np.arange(-1, 8)

x_n = np.zeros(n.shape)

signal = (n >= 0) & (n <= 4)
x_n[signal] = 1

even_indices = (n % 2 == 0)
n_even = n[even_indices]
x_n_even = x_n[even_indices]

plt.stem(n_even, x_n_even, basefmt=" ")

plt.grid(True)
plt.gca().tick_params(labelsize=18)

plt.show()
