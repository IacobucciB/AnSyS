import numpy as np
import matplotlib.pyplot as plt


def deltaK(n):
    return np.where(n == 0, 1, 0)


def x(n):
    return deltaK(n) + deltaK(n - 1) + deltaK(n - 2) + deltaK(n - 3) + deltaK(n - 4)


def odd_part(x_n, n):
    return (x_n(n) - x_n(-n)) / 2


def even_part(x_n, n):
    return (x_n(n) + x_n(-n)) / 2


n = np.arange(-6, 6)
x_o = odd_part(x, n)
x_e = even_part(x, n)


plt.stem(n, x_e, basefmt=" ")
plt.title("Ejercicio 3 - a)")
plt.xlabel("n")
plt.ylabel("Amplitud")
plt.grid(True)
plt.show()


plt.stem(n, x_o, basefmt=" ")
plt.title("Ejercicio 3 - a)")
plt.xlabel("n")
plt.ylabel("Amplitud")
plt.grid(True)
plt.show()
