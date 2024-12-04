import numpy as np
import matplotlib.pyplot as plt

def sistema_s4(x, no):
    """
    Simula el sistema discreto S4 con ecuación:
    y[n] = sum(x[k]) for k = n-no to n+no

    Parámetros:
        x: numpy array
            Señal de entrada x[n].
        no: int
            Parámetro que determina el tamaño de la ventana.

    Retorna:
        y: numpy array
            Señal de salida y[n].
    """

    y = np.zeros_like(x)
    for n in range(no, len(x)-no):
        y[n] = np.sum(x[n-no:n+no+1])
    return y

# Generar una señal de entrada seno discreta
n = np.arange(0, 100)
f = 0.05  # Frecuencia en Hz
x = np.sin(2 * np.pi * f * n)

# Aplicar el sistema S4 con no=5
y = sistema_s4(x, 5)

# Visualizar las señales
plt.figure(figsize=(12, 6))
plt.plot(n, x, label='Entrada x[n] (seno)')
plt.plot(n[5:-5], y[5:-5], label='Salida y[n]')
plt.legend()
plt.xlabel('n')
plt.ylabel('Amplitud')
plt.grid(True)
plt.show()
