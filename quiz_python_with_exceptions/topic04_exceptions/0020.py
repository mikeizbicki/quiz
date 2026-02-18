grades={
    'alice':{'hw1':99,'hw2':88},
    'bob':{'hw1':82,'hw2':91},
}
try:
    output = "grade=" + grades['charlie']['hw1']
except KeyError:
    output = 'oops'
print('output=', output)
