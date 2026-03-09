class Foo:
    message = 'salve munde'
    def __init__(self, message):
        message = message
a = Foo('hello world')
b = Foo('hola mundo')
print('a.message=', a.message)
