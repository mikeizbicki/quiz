class Foo:
    pass
a = Foo()
a.message = 'hello world'
b = Foo()
b.message = 'hola mundo'
Foo.message = 'salve munde'
print('a.message=', a.message)
