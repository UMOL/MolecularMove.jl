import matplotlib as mpl
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
import matplotlib.pyplot as plt

mpl.rcParams['legend.fontsize'] = 10

fig = plt.figure()
ax = fig.gca(projection='3d')
theta = np.linspace(-4 * np.pi, 4 * np.pi, 100)
z = np.linspace(-2, 2, 100)
r = z**2 + 1
x = r * np.sin(theta)
y = r * np.cos(theta)


def partial_fibo(n, radius, zmin, zmax):
    delta_phi = np.pi * (3. - np.sqrt(5))
    N = int(n * 2 * radius / (zmax - zmin)) 
    delta_z = 2./N * radius
    z_start = radius - delta_z/2.
    i_offset = np.floor((radius - zmax)/delta_z)
    def compute(index):
        i = index + i_offset
        z = z_start - i * delta_z
        r = np.sqrt(radius*radius-z*z)
        phi = i*delta_phi
        return [np.cos(phi)*r, np.sin(phi)*r, z]

    return [compute(i) for i in range(n)]

def fibo(N, radius):
    delta_phi = np.pi * (3. - np.sqrt(5))
    delta_z = 2./N * radius
    z_start = radius - delta_z/2.
    def compute(i):
        z = z_start - i * delta_z
        r = np.sqrt(radius*radius-z*z)
        phi = i*delta_phi
        return [np.cos(phi)*r, np.sin(phi)*r, z]

    return [compute(i) for i in range(n)]

import math, random
def fibonacci_sphere(samples=1,randomize=False):
    rnd = 1.
    if randomize:
        rnd = random.random() * samples
    points = []
    offset = 2./samples
    increment = math.pi * (3. - math.sqrt(5.));
    for i in range(samples):
        y = ((i * offset) - 1) + (offset / 2);
        r = math.sqrt(1 - pow(y,2))
        phi = ((i + rnd) % samples) * increment
        x = math.cos(phi) * r
        z = math.sin(phi) * r
        points.append([x,y,z])
    return points

def fibo2(N):
    dz = 2./N 
    da = math.pi * (3. - math.sqrt(5.))

    points = []
    for i in range(N):
        z = ((i*dz - 1.)) + dz/2.
        r = math.sqrt(1-z*z)
        phi = i * da 
        x = math.cos(phi) * r 
        y = math.sin(phi) * r 
        points.append([x,y,z])
    return points 

gen_data = partial_fibo
R = 10
zmin = -5
zmax = 5
data = np.array(gen_data(5, R, zmin, zmax))
np.set_printoptions(precision=15)
print(data)

# for i in range(np.shape(data)[0]):
#     print("0.5x", data[i,:] * 0.5)
#     print("1.5x", data[i,:] * 1.5)
ax.scatter(data[:,0], data[:,1], data[:,2], label='parametric curve')
ax.legend()

# plt.show()
