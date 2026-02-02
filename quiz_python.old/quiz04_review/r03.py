x = 10
def foo(x):
    total = 0
    for i in range(x):
        total += i
    return total
x += foo(1)
x += foo(2)
x += foo(3)
print("x=", x)

