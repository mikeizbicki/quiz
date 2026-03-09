class Foo:
    def __init__(self, xs=None):
        if not xs:
            xs = []
        self.xs = xs
        xs.append('init')
a = Foo(['hello'])
b = Foo()
c = Foo(b.xs)
d = Foo()
x = len(d.xs)
print('x=', x)

