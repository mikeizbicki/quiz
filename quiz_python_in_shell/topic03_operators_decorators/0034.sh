cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def algebraic(fields):
    def decorate(cls):
        def __add__(self, other):
            return cls(*[getattr(self, f) + getattr(other, f) for f in fields])
        cls.__add__ = __add__
        return cls
    return decorate

@algebraic(fields=('x', 'y'))
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __repr__(self):
        return f'Vec({self.x}, {self.y})'

print('Vec(1, 2) + Vec(3, 4) =', Vec(1, 2) + Vec(3, 4))
EOF
python3 foo.py
