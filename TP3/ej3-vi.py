import numpy as np
import matplotlib.pyplot as plt


def deltaD(t):
    d = np.zeros_like(t)
    d[np.argmin(np.abs(t))] = 1 / (t[1] - t[0])
    return d


def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)


def x(t):
    return 2 * triangle(t + 1)


def h(t):
    return deltaD(t - 0.5) + deltaD(t - 1.5)


t = np.linspace(-2.5, 2.5, 1000)
dt = t[1] - t[0]

x_t = x(t)
h_t = h(t)

y_conv = np.convolve(x_t, h_t, mode="same") * dt

fig, axes = plt.subplot_mosaic([["x", "h"], ["y", "y"]], figsize=(9, 6))
ax_x = axes["x"]
ax_h = axes["h"]
ax_y = axes["y"]

ax_x.plot(t, x_t, color="C0")
ax_x.set_title(r"$x(t) = 2*\operatorname{tri}(t+1)$")
ax_x.set_xlabel("t")
ax_x.set_ylabel("x(t)")
ax_x.grid(True)

ax_h.plot(t, h_t, color="C1")
ax_h.set_title(r"$h(t) = \delta(t-0.5) + \delta(t-1.5)$")
ax_h.set_xlabel("t")
ax_h.set_ylabel("h(t)")
ax_h.grid(True)

ax_y.plot(t, y_conv, color="C2")
ax_y.set_title(r"Convolución $y(t)=x(t)*h(t)$")
ax_y.set_xlabel("t")
ax_y.set_ylabel("y(t)")
ax_y.grid(True)
fig.tight_layout()
plt.savefig("output/ej3-bvi.png")
