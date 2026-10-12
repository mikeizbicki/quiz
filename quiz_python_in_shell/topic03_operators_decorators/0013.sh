cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __eq__(self, other):
        return self.x == other.x and self.y == other.y
    def __hash__(self):
        return hash((self.x, self.y))
a = Vec(1, 2)
b = Vec(1, 2)
print('a == b:', a == b)
print('len({a, b}):', len({a, b}))
EOF
python3 foo.py
