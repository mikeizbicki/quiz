xss = [ [ i for i in range(x) ] for x in [2, 3, 4]  if x%2 == 0 ]
x = xss[-1:][-2][1]
print('x=', x)

