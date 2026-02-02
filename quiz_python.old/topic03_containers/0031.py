x = 10
def foo(x):
    x += 1
    return x
x += foo(9 + 39 // 10) * 2
print("x=", x)
