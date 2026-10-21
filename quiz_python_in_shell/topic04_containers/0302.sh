cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class FooBar:
    def __init__(self, x, y=None):
        self.x = x
        self.y = y

    def wob(self, n):
        if n == 0:
            return 0
        return self.x + self.y.wob(n - 1)

t = FooBar(5)
t.y = t
try:
    print(t.y.y.x)
    print(t.wob(4))
except RecursionError:
    print('RecursionError')
except AttributeError:
    print('AttributeError')
except TypeError:
    print('TypeError')
EOF
python3 foo.py
