import numpy as np
import matplotlib.pyplot as plt

def triangle(t):
    return np.where(np.abs(t) <= 1, 1 - np.abs(t), 0)

T = 2
t = np.linspace(-2, 2, 1000)
y = 0.25 * T * triangle(2*t) + 0.5*T 

plt.plot(t, y)
plt.grid(True)
plt.ylim(-0.5, max(y) + 0.5)
plt.show()