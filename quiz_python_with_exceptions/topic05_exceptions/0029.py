def bar(xs):
    assert(len(xs) > 0)
    return len(xs)*2

result = 0
try:
    result += bar([1,2,3])
    result += bar([2,3])
    result += bar([])
    result += bar([5])
except ValueError:
    pass

print('result=', result)
