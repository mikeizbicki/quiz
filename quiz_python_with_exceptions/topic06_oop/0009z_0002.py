xs = [1, 2, 3]
def foo(xs=[]):
    xs.append(len(xs) + 1)
    return len(xs)
y = foo()
y = foo()
y = foo()
y = foo()
print('y=', y)
