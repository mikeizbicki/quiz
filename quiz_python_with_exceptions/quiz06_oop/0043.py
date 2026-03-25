class Foo:
    def __init__(self):
        self.xs = []
    def bar(self, x):
        self.xs.append(x)
a = Foo()
a.bar(b.xs)
b = Foo()
b.bar('mundo')
x = len(a.xs)
print('x=', x)
