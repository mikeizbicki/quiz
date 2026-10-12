cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __le__(self, other):
        return self.x <= other.x and self.y <= other.y
    def __repr__(self):
        return f'Vec({self.x}, {self.y})'
a = Vec(1, 2)
b = Vec(2, 1)
print('a <= b:', a <= b)
print('b <= a:', b <= a)
print('a <= a:', a <= a)
EOF
python3 foo.py
