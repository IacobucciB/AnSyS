import numpy as np
import matplotlib.pyplot as plt


def u(n):
    return np.where(n >= 0, 1, 0)


def deltaK(n):
    return np.where(n == 0, 1, 0)


def x(n):
    return u(n) - u(n - 3)


def h(n):
    return (
        deltaK(n + 1)
        + 2 * deltaK(n)
        + 1.5 * deltaK(n - 1)
        + 1.5 * deltaK(n - 2)
        + 1.5 * deltaK(n - 3)
        + 1.5 * deltaK(n - 4)
        + 0.5 * deltaK(n - 5)
    )


n = np.arange(-2, 6)

x_n = x(n)
y_n = h(n)


fig, axes = plt.subplots(1, 2, figsize=(10, 4))

axes[0].stem(n, x_n, basefmt=" ")
axes[0].set_title("x(n) = u(n) - u(n-3)")
axes[0].set_xlabel("n")
axes[0].set_ylabel("Amplitude")
axes[0].legend(["x(n)"])
axes[0].grid(True)

axes[1].stem(n, y_n, basefmt=" ")
axes[1].set_title("y(n)")
axes[1].set_xlabel("n")
axes[1].legend(["y(n)"])
axes[1].grid(True)

plt.tight_layout()
plt.savefig("output/ej2-e.png")
