xs = [1, 2, 3]
try:
    result = xs[3]
except IndexError:
    result = -1
print('result=', result)

