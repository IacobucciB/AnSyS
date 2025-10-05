import numpy as np
import matplotlib.pyplot as plt


def u(n):
    return np.where(n >= 0, 1, 0)


def rect(n, width=1):
    return np.where((n >= -width / 2) & (n <= width / 2), 1, 0)


def x(n):
    return rect(n, 3)


def h(n):
    return rect(n, 3)


n = np.arange(-2, 3)
x_n = x(n)
h_n = h(n)
y_n = np.convolve(x_n, h_n, mode="full")

n_y = np.arange(n[0] + n[0], n[-1] + n[-1] + 1)


fig, axes = plt.subplot_mosaic([["x", "h"], ["y", "y"]], figsize=(9, 6))
ax_x = axes["x"]
ax_h = axes["h"]
ax_y = axes["y"]


ax_x.stem(n, x_n, basefmt=" ")
ax_x.set_title(r"$x[n] = \mathrm{rect}(n, 3)$")
ax_x.set_xlabel("n")
ax_x.set_ylabel("x[n]")
ax_x.grid(True)

ax_h.stem(n, h_n, basefmt=" ", linefmt="C1-", markerfmt="C1o")
ax_h.set_title(r"$h[n] = \mathrm{rect}(n, 3)$")
ax_h.set_xlabel("n")
ax_h.set_ylabel("h[n]")
ax_h.grid(True)

ax_y.stem(n_y, y_n, basefmt=" ", linefmt="C2-", markerfmt="C2o")
ax_y.set_title(r"Convolución $y[n]=x[n]*h[n]$")
ax_y.set_xlabel("n")
ax_y.set_ylabel("y[n]")
ax_y.grid(True)

fig.tight_layout()
plt.savefig("output/ej4-aiv.png")
