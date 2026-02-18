def bar(xs):
    if not len(xs) > 0:
        raise ValueError('input list must be non-empty')
    return len(xs)*2

result = 0
try:
    result += bar([1,2,3])
    result += bar([2,3])
    result += bar()
    result += bar([5])
except ValueError:
    result += 1
except TypeError:
    result += 5

print('result=', result)
