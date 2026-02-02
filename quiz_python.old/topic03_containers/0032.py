x = 10
def foo(x):
    return x * 2
for i in range(3):
    x += foo(i)
print("x=", x)
