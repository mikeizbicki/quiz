y = 5

def foo(x):
    return x + y

def bar(z):
    total = foo(x)
    return total

glurb = foo(z)
print('glurb=', glurb)

