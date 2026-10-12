cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def add_arithmetic(cls):
    def __add__(self, other):
        return cls(self.x + other.x, self.y + other.y)
    def __radd__(self, other):
        return self
    cls.__add__ = __add__
    cls.__radd__ = __radd__
    return cls

@add_arithmetic
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __repr__(self):
        return f'Vec({self.x}, {self.y})'

xs = [Vec(1, 2), Vec(3, 4), Vec(5, 6)]
print('sum(xs) =', sum(xs))
EOF
python3 foo.py
