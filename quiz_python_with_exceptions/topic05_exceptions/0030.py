def bar(xs):
    assert(len(xs) > 0)
    return len(xs)*2

result = 0
try:
    result += bar([1,2,3])
    result += bar([2,3])
    result += bar()
    result += bar([5])
except AssertionError:
    result += 1
except TypeError:
    result += 5

print('result=', result)
