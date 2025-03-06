def bar(xs):
    if not len(xs) > 0:
        raise ValueError('input list must be non-empty')
    return len(xs)*2

result = 0
result += bar

print('result=', result)
