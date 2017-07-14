import numpy
from numpy._distributor_init import NUMPY_MKL
import scipy.io as sio


intersections = sio.loadmat('intersections.mat')

intersections = intersections.get('intersections')
arr = []
count = 0
for element in intersections:
	if ((element[0],element[1]) not in arr):
		arr.append((element[0],element[1]))
		count = count +1
	else :
		print "found duplicate  at ",element[0],","