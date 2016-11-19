import math as m
A = []

for i in range(1000000):
	A.append(i)
	A[i]=m.cos(A[i])
	A[i]=m.sin(A[i])