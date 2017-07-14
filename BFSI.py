
import numpy
from numpy._distributor_init import NUMPY_MKL
import scipy.io as sio
import os
import math
from collections import defaultdict


def BFS(target,data,node):
	startnode = node[4]
	visited = []
	queue = [node]
##	if target == 191 or target == 31 :
##		print " Here 1 "
	
	done = 0	
	depth=0
	currnode = node[4]
	path = []
	curr_X = node[0]
	curr_y = node[1]
	turn = 0
	while not done and depth < 200:
		for x in queue:
			#curr_X = x[0]
			
			neighbours = []
			if (turn == 1 and len(queue)==1 ):
				queue.pop()
				done =1
				return []
		##		print queue
				
			if x [6] == 1 or turn == 0 and not target == currnode:
				if turn == 0:
					currnode = x[4]
				else:
					currnode = x[5]
				
				turn =1
			
				for y in data:
					flag = 1
					for z in queue:
						if ((z[4] == y[4] and y[5]==z[5])  or (z[5] == y[4] and y[5]==z[4]) ):
							flag = 0
					if (y[4] == currnode or y[5]==currnode) and flag and y[6] == 0 and not done:
						if y[4]==currnode:
							y[6]=1
							
							neighbours.append(y)
						else : 
							tmp =y[4]
							y[4]= y [5]
							y[5]=tmp
							y[6]=1
						##	print y[4]
						
							neighbours.append(y)	
						
						points = []
						if y[5] == target and not done :
							done = 1
						##	print " Break"
							path.append(y[5])
							path.append(y[4])
							points.append((node[0],node[1]))
							points.append((y[0],y[1]))
						if len(neighbours) > 0:
							distances = []
							for each in neighbours:
								distances.append(math.sqrt((curr_X-each[0])*(curr_X-each[0]) + (curr_y-each[1])*(curr_y-each[1])))
							sorteddistances = []
							sorteddistances = sorted(distances)
							
							
							indexes = []
							for each in sorteddistances:
								temp = distances.index(each)
								indexes.append(temp)
							for each in indexes:
								queue.append(neighbours[each])	




				depth = depth +1
	
	
	if done == 0 :
		return []
##	for item in queue :
##		print item	
##	print "target =" , target 
##	print "start =", startnode
##	print "path =", path
##	print " Start node = ",startnode
	
	currnode = path[1]

	while startnode not in path:
		for each in queue:
			if (currnode == each[5] and startnode not in path):
				currnode = each[4]
				path.append(each[4])
				points.append((each[0],each[1]))	

##	print path
	for each in data:
		each[6]= 0

	return path





intersections = sio.loadmat('intersections.mat')

intersections = intersections.get('intersections')
plots = []
count = 0
for each in intersections:
	if not each[4] == each[5]:
		
		res = (BFS(each[5],intersections,each))
		flagany = 1

		if res == None :
			a= [] 
		else : 	
			a = [i for i, x in enumerate(res) if res.count(x) > 1]
		if (len (a ) == 0 and res not in plots and len(res)>3 ):
			print res
			count = count +1	
			plots.append(res)
		tmp = each[4]
		each[4]=each[5]
		each[5]=tmp
		res = (BFS(each[5],intersections,each))
		flagany = 1
		if res == None :
			a= [] 
		else : 	
			a = [i for i, x in enumerate(res) if res.count(x) > 1]
		if (len (a ) == 0 and res not in plots and len(res)>3 ):
			print res
			count = count +1	
			plots.append(res)
			print "count =", count  		
			sio.savemat('C:\Users\Safi syed\Desktop\Map Proj\ blocks',mdict={'arr': plots},appendmat=True, format = '5')
