grades={
    'alice':{'hw1':99,'hw2':88},
    'bob':{'hw1':82,'hw2':91},
}
try:
    for k, v in sorted(grades.items()):
        print(v[hw3])
except TypeError:
    print('oops')
