cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __lt__(self, other):
        return self.x <= other.x and self.y <= other.y and (self.x, self.y) != (other.x, other.y)
    def __repr__(self):
        return f'Vec({self.x}, {self.y})'
xs = [Vec(3, 3), Vec(1, 1), Vec(2, 2)]
print('sorted(xs):', sorted(xs))
EOF
python3 foo.py
