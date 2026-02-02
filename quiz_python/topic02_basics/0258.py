def foo(x):
    total = 0
    while x > 0:
        total += 1
        x //= 10
    return total
x = foo(100)
x += foo(1234567)
x += foo(3)
print("x=", x)
