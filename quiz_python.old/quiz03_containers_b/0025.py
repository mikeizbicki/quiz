xss = [[1, 3, 5], [2, 4], [0, 1, 2, 3, 4, 5]] 
total = 0 
total += xss[1][0]
total += xss[2][1]
total += xss[0][1]
print('total=', total)
