import numpy as np
import matplotlib.pyplot as plt

omega = -0.2
T = (2 * np.pi) / abs(omega)

phi = (5 * np.pi) / 3
t_0 = phi / abs(omega)

n_samples = 100
t = np.linspace(t_0, t_0 + T, n_samples)
x_t = -2 * np.sin(omega * t + phi)

plt.stem(t, x_t, basefmt=" ")
plt.grid(True)
plt.show()
