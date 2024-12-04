import numpy as np
import matplotlib.pyplot as plt

n = np.arange(-8, 9, 1)
x_n = np.exp(1j * (np.pi / 2 * n - np.pi))

real_part_n = np.real(x_n)
imag_part_n = np.imag(x_n)
magnitude_n = np.abs(x_n)

# Grafica de la parte real, imaginaria y magnitud usando stem
plt.figure(figsize=(10, 6))
plt.stem(n, real_part_n, linefmt="blue", markerfmt="bo", basefmt="black", label="Parte Real")
plt.stem(n, imag_part_n, linefmt="orange", markerfmt="o", basefmt="black", label="Parte Imaginaria")
# plt.stem(n, magnitude_n, linefmt="green", markerfmt="go", basefmt="black", label="Magnitud")

plt.title("Señal discreta x[n] = e^(j(π/2 * n - π))", fontsize=14)
plt.xlabel("n", fontsize=12)
plt.ylabel("x[n]", fontsize=12)
plt.axhline(0, color='black', linewidth=0.8, linestyle='dashed')

plt.legend()
plt.grid(True)
plt.show()

# Grafica de x[n] en el plano complejo
plt.figure(figsize=(8, 8))

plt.stem(real_part_n, imag_part_n, linefmt="purple", markerfmt="o", basefmt="black", label="Puntos en el plano complejo")

plt.scatter(0, 0, color='black', label='Origen')

plt.title("Plano complejo de x[n] = e^(j(π/2 * n - π))", fontsize=14)
plt.xlabel("Parte Real", fontsize=12)
plt.ylabel("Parte Imaginaria", fontsize=12)
plt.axhline(0, color='black', linewidth=0.8, linestyle='dashed')
plt.axvline(0, color='black', linewidth=0.8, linestyle='dashed')

plt.legend()
plt.grid(True)
plt.axis('equal')
plt.show()
