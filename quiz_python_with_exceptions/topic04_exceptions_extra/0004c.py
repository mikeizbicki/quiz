y = 5

def foo(x):
    return 'x' + y

def bar(z):
    total = foo(x)
    return total

glurb = foo(7)
print('glurb=', glurb)
