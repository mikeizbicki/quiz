class Foo:
    def __init__(self, xs=[]):
        self.xs = xs
        xs.append('init')
a = Foo(['hello'])
b = Foo()
c = Foo(['hola'])
d = Foo()
x = len(d.xs)
print('x=', x)

