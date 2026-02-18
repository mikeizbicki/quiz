grades={
    'alice':{'hw1':99,'hw2':88},
    'bob':{'hw1':82,'hw2':91},
}
total = 0
for i in grades:
    for j in i:
        total += 1
print('total=',total)
