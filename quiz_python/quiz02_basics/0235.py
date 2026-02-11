xss = [[1, 3, 5], [2, 4], [0, 1, 2, 3, 4, 5]]
total = 0
for xs in xss:
    total += xs[0]
    for x in xs:
        total += x
print('total=', total)
