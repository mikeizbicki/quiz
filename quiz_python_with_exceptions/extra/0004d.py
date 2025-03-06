y = 5

def foo(x):
    return 'x' + y

def bar(z):
    total = foo
    return z

glurb = bar(7)
print('glurb=', glurb)

