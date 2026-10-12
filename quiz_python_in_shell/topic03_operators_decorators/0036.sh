cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __add__(self, other):
        return type(self)(self.x + other.x, self.y + other.y)
    def __repr__(self):
        return f'{type(self).__name__}(x={self.x}, y={self.y})'
class B(A):
    def __add__(self, other):
        result = super().__add__(other)
        result.y += 10
        return result
print('A(1, 2) + A(3, 4) =', A(1, 2) + A(3, 4))
print('B(1, 2) + B(3, 4) =', B(1, 2) + B(3, 4))
print('type(B(1, 2) + B(3, 4)) =', type(B(1, 2) + B(3, 4)).__name__)
EOF
python3 foo.py
