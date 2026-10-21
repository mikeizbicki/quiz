cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class FooBar:
    def __init__(self, x, y=None):
        self.x = x
        self.y = y if y is not None else self

    def wob(self):
        if self.y is None:
            return self.x
        return self.x + self.y.wob()

t = FooBar(10)
try:
    print(t.y.x)
    print(t.wob())
except RecursionError:
    print('RecursionError')
EOF
python3 foo.py
