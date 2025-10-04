import numpy as np
import matplotlib.pyplot as plt


def deltaK(n):
    return np.where(n == 0, 1, 0)


def x1(n):
    return deltaK(n)


def median_filter(x, window_size):
    filtered = np.copy(x)
    half_window = window_size // 2
    for i in range(len(x)):
        start = max(0, i - half_window)
        end = min(len(x), i + half_window + 1)
        filtered[i] = np.median(x[start:end])
    return filtered


n = np.arange(-4, 5)
x_n = x1(n)
window_size = 3
y = median_filter(x_n, window_size)

fig, axs = plt.subplots(1, 2, figsize=(10, 4))

axs[0].stem(n, x_n, linefmt="b-", markerfmt="bo", basefmt=" ")
axs[0].set_title("x1(n)")
axs[0].grid(True)

axs[1].stem(n, y, linefmt="r-", markerfmt="ro", basefmt=" ")
axs[1].set_title("Filtro de mediana")
axs[1].grid(True)

plt.tight_layout()
plt.savefig("output/ej4-a.png")
