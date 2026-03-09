class Foo:
    pass
a = Foo()
b = Foo()
b.message = 'hola mundo'
Foo.message = 'salve munde'
print('a.message=', a.message)
