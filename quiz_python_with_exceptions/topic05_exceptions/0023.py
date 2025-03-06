def foo(xs):
    assert(len(xs) > 0)

try:
    foo([1,2,3])
except AssertionError:
    pass
