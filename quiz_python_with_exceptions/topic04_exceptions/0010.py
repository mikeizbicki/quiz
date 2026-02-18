grades={
    'alice':{'hw1':99,'hw2':88},
    'bob':{'hw1':82,'hw2':91},
}
for k,v in sorted(grades.items()):
    print(v[0])
