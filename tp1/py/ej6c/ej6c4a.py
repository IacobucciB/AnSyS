import numpy as np
import matplotlib.pyplot as plt

# Period
omega = -0.2
T = (2 * np.pi) / abs(omega)

# Signal start point
phi = (5*np.pi) / 3
t_0 = phi / abs(omega)

t = np.linspace(t_0,t_0+T,1000000)
x_t = -2 * np.sin(omega*t + phi)

plt.plot(t,x_t)
plt.show()