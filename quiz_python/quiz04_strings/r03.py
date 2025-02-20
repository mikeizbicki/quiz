def foo(x):
    total = x + 1
    return total
x = foo(1)
x += foo(2)
x += foo(3)
print("x=", x)

