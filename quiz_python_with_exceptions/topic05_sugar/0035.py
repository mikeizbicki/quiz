xss = [ i for x in [4, 5, 6]  if x%2 == 1 for i in range(x) if i%3== 1 ]
x = xss[-1]
print('x=', x)
