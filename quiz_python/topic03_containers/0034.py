x = 10
def foo(x):
    x += 2
    return x
x += foo(9 + 39 // 10) * 3
x += foo(9 + 39 // 10) * 2
print("x=", x)
