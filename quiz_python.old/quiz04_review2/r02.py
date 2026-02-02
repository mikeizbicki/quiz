xss = [[1, 3, 5], [2, 4], [0, 1, 2, 3, 4, 5]]
total = 0
for i in range(2):
    total -= xss[i][i]
print('total=', total)

