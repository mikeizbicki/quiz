xs = [1, 2, 3]
def foo(xs=[]):
    xs.append(len(xs) + 1)
    return len(xs)
y = foo([1])
y = foo([1, 2, 3])
y = foo([1, 2])
y = foo()
print('y=', y)
