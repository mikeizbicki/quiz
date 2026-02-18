def foo(xs):
    assert(len(xs) > 0)

result = 0
try:
    result += foo([1,2,3])
except AssertionError:
    result -= 1
print('result=', result)
