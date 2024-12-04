import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(-3, 3, 1000)
x_t = 2 * np.cos(2 * np.pi * t) * np.sin(10 * t)

plt.figure(figsize=(10, 6))
plt.plot(t, x_t, label=r"$x(t) = 2\cos(2\pi t) * \sin(10t)$", color='blue')
plt.title("Gráfica de $x(t) = 2\cos(2\pi t) * \sin(10t)$", fontsize=14)
plt.xlabel("t (s)", fontsize=12)
plt.ylabel("x(t)", fontsize=12)
plt.axhline(0, color='black', linewidth=0.8, linestyle='dashed')
plt.grid(True)

plt.legend()
plt.show()
