cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class FooBar:
    def __init__(self, x, y=None, z=None):
        self.x = x
        self.y = y
        self.z = z

    def wob(self):
        if self.y is None:
            return self.x
        return self.x + self.y.wob()

t = FooBar(1)
u = FooBar(2)
t.y = u
t.z = t
try:
    print(t.z.z.z.z.x)
    print(t.wob())
except RecursionError:
    print('RecursionError')
except AttributeError:
    print('AttributeError')
except TypeError:
    print('TypeError')
EOF
python3 foo.py
