class Foo:
    def __init__(self, message=None):
        self.message = message
a = Foo()
b = Foo('hola mundo')
print('a.message=', a.message)
