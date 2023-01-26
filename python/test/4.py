import matplotlib.pyplot as plt
from samila import GenerativeImage
import random
import math
def f1(x, y):
    result = random.uniform(-1,1) * x**2  - math.sin(y**2) + abs(y-x)
    return result
def f2(x, y):
    result = random.uniform(-1,1) * y**3 - math.cos(x**2) + 2*x
    return result
g = GenerativeImage(f1, f2)
g.generate()
g.plot()
g.seed
188781
plt.show()
