xs = [1, 3, 5]
ys = [2, 4, 6]
total = 0
for x in xs:
    total += x
    for y in ys:
        total -= x*y
print('total=', total)
