class Foo:
    def __init__(self, message):
        Foo.message = message
a = Foo('hello world')
b = Foo('hola mundo')
b.message = 'salve mundo'
print('a.message=', a.message)
