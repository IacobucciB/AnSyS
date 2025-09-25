import numpy as np
import matplotlib.pyplot as plt


def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)


# Vector de tiempo centrado en 0
t = np.linspace(-2, 2, 1000)

# Llamada a la función
y = triangle(t)

# Gráfica
plt.plot(t, y)
plt.title("Función Triángulo")
plt.xlabel("Tiempo [s]")
plt.ylabel("Amplitud")
plt.grid(True)
plt.show()

# Figura del Ejericio
t = np.linspace(-2, 4, 1000)
h_t = 2 * triangle(((t - 1) / 2))
plt.plot(t, h_t)
plt.title("Ejercicio 2")
plt.xlabel("Tiempo [s]")
plt.ylabel("Amplitud")
plt.grid(True)
plt.show()
