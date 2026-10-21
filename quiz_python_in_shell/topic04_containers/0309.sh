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

t = FooBar(1)
u = FooBar(2)
v = FooBar(3)
t.y = u
u.y = v
v.y = t
try:
    print(t.y.y.x)
    print(t.wob(6))
except RecursionError:
    print('RecursionError')
EOF
python3 foo.py
