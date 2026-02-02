x = 10
def foo(x):
    if x - 5:
        return 1
    else:
        x += 1
    return x
x += foo(4)
x += foo(5)
x += foo(6)
print("x=", x)
