import numpy as np
import matplotlib.pyplot as plt

# Función para simular el sistema S2
def sistema_s2(x, a):
    """
    Simula el sistema discreto S2 con ecuación:
    y[n] = x[n] * (1 + a * y[n-1])
    
    Parámetros:
        x : array-like
            Señal de entrada x[n].
        a : float
            Coeficiente del sistema.
    
    Retorna:
        y : numpy array
            Señal de salida y[n].
    """
    y = np.zeros_like(x)  # Inicializar la salida con ceros
    for n in range(1, len(x)):  # Iterar desde n=1 hasta el final
        y[n] = x[n] * (1 + a * y[n-1])
    return y

# Prueba del sistema
n = np.arange(0, 50)  # Rango de tiempo discreto
x_n = np.sin(0.2 * np.pi * n)  # Señal de entrada: senoide discreta
a = 0.5  # Ganancia del sistema

# Simular el sistema
y_n = sistema_s2(x_n, a)

# Graficar las señales
plt.figure(figsize=(12, 6))

# Entrada x[n]
plt.subplot(2, 1, 1)
plt.stem(n, x_n, linefmt="blue", markerfmt="bo", basefmt="black", label="x[n]")
plt.title("Entrada x[n]")
plt.xlabel("n")
plt.ylabel("x[n]")
plt.grid(True)
plt.legend()

# Salida y[n]
plt.subplot(2, 1, 2)
plt.stem(n, y_n, linefmt="red", markerfmt="ro", basefmt="black", label="y[n]")
plt.title("Salida y[n]")
plt.xlabel("n")
plt.ylabel("y[n]")
plt.grid(True)
plt.legend()

plt.tight_layout()
plt.show()
