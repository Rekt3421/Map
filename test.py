from collections import defaultdict
x = [1,2,1,3,1]
D = defaultdict(list)
for i,item in enumerate(x):
    D[item].append(i)
D = {k:v for k,v in D.items() if len(v)>1}
print D[1]