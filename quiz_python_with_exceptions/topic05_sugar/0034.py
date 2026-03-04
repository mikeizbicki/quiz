xss = [ i for x in [2, 3, 4]  if x%2 == 0 for i in range(x) ]
x = xss[-1][-2]
print('x=', x)
