import numpy as np
import matplotlib.pyplot as plt


def rect(t):
    return np.where((t >= -0.5) & (t <= 0.5), 1, 0)


def x(t):
    return rect(t)


def h1(t):
    return rect(t + 0.5)


def h2(t):
    return rect(t - 0.5)


t = np.linspace(-2.5, 2.5, 1000)
dt = t[1] - t[0]

x_t = x(t)

h_t1 = h1(t)
h_t2 = h2(t)
h_t = h_t1 + h_t2


y1_conv = np.convolve(x_t, h_t1, mode="same") * dt
y2_conv = np.convolve(x_t, h_t2, mode="same") * dt
y_conv = np.convolve(x_t, h_t, mode="same") * dt

fig, axes = plt.subplot_mosaic([["x", "h"], ["y", "y"]], figsize=(9, 6))
ax_x = axes["x"]
ax_h = axes["h"]
ax_y = axes["y"]

ax_x.plot(t, x_t, color="C0")
ax_x.set_title(r"$x(t) = \operatorname{rect}(t)$")
ax_x.set_xlabel("t")
ax_x.set_ylabel("x(t)")
ax_x.grid(True)

ax_h.plot(t, h_t, color="C1", lw=2, label=r"$h(t)=h_1(t)+h_2(t)$")
ax_h.plot(
    t,
    h_t1,
    color="C3",
    ls="--",
    label=r"$h_1(t)=\operatorname{rect}(t+0.5)$",
    alpha=0.8,
)
ax_h.plot(
    t, h_t2, color="C4", ls=":", label=r"$h_2(t)=\operatorname{rect}(t-0.5)$", alpha=0.8
)
ax_h.set_title(r"$h(t)$ y sus componentes $h_1,h_2$")
ax_h.set_xlabel("t")
ax_h.set_ylabel("h(t)")
ax_h.grid(True)
ax_h.legend()

ax_y.plot(t, y_conv, color="C2", lw=2, label=r"$y(t)=x*h$")
ax_y.plot(t, y1_conv, color="C5", ls="--", label=r"$y_1(t)=x*h_1$")
ax_y.plot(t, y2_conv, color="C6", ls=":", label=r"$y_2(t)=x*h_2$")
ax_y.set_title(r"Convolución $y(t)=x(t)*h(t)$ y componentes")
ax_y.set_xlabel("t")
ax_y.set_ylabel("y(t)")
ax_y.grid(True)
ax_y.legend()
fig.tight_layout()
plt.show()
