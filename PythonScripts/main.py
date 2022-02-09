import numpy as np
import cv2

print("\n\nsWorking")

a = np.array([[1, 2, 3]])
b = np.array([[4], [5], [6]])

c = np.matmul(a, b)

print(a)
print(b)
print(c)