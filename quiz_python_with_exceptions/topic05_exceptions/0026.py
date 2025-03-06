def foo(xs):
    assert(len(xs) > 0)

example = 0
try:
    example += foo([1,2,3])
    example += 1
except AssertionError:
    pass
print('example=', example)
