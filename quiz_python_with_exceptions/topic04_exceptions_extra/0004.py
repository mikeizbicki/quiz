y = 5

def foo(x):
    return x + y

def bar(z):
    total = foo(x)
    return total

glurb = bar(z)
print('glurb=', glurb)
