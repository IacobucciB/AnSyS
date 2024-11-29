import numpy as np
import matplotlib.pyplot as plt

def tri1(t):
    h = (t + 1) * (np.logical_and(t >= -1, t < 1)) + (-t + 3) * (np.logical_and(t >= 1, t < 3))
    return h

t = np.arange(-2,4,0.001)
h = tri1(t)

plt.plot(t,h)
plt.savefig('tp1-ej6a.png', bbox_inches='tight')
plt.show()