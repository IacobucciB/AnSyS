import numpy as np
import matplotlib.pyplot as plt

n = np.arange(-1,8)

x_n = np.zeros(n.shape)

signal = (n - 1 >= 0) & (n - 1 <= 4)
x_n[signal] = 1

plt.stem(n,x_n,basefmt=" ")
plt.grid(True)
plt.gca().tick_params(labelsize=18)
plt.show()