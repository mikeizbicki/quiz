def foo(xs=[1]):
    xs = xs + xs
    return len(xs)
y = foo()
y = foo()
y = foo()
y = foo()
print('y=', y)
