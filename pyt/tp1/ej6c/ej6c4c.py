import numpy as np
import matplotlib.pyplot as plt

t = np.linspace(-2,2,1000)

x_t = np.exp(1j * (np.pi/2 * t - np.pi))

real_part = np.real(x_t)
imag_part = np.imag(x_t)

mag = np.abs(x_t)

# Grafica separada en parte Real e Imaginaria
plt.plot(t, real_part, label='Parte Real', color='blue')
plt.plot(t, imag_part, label='Parte Imaginaria', color='orange')
plt.plot(t, mag, label='Magnitud', linestyle='dashed', color='green')

plt.title("Gráfica de x(t) = e^(j(π/2 * t - π))", fontsize=14)
plt.xlabel("t", fontsize=12)
plt.ylabel("x(t)", fontsize=12)
plt.axhline(0, color='black', linewidth=0.8, linestyle='dashed')
plt.axvline(0, color='black', linewidth=0.8, linestyle='dashed')

plt.legend()
plt.grid(True)
plt.show()

# Grafica en el plano complejo
plt.figure(figsize=(8, 8))
plt.plot(real_part, imag_part, label="Trayectoria en el plano complejo", color="purple")
plt.scatter(0, 0, color='black', label='Origen')
plt.title("Plano complejo de x(t) = e^(j(π/2 * t - π))", fontsize=14)
plt.xlabel("Parte Real", fontsize=12)
plt.ylabel("Parte Imaginaria", fontsize=12)
plt.axhline(0, color='black', linewidth=0.8, linestyle='dashed')
plt.axvline(0, color='black', linewidth=0.8, linestyle='dashed')

plt.legend()
plt.grid(True)
plt.axis('equal')
plt.show()
