cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __eq__(self, other):
        if not isinstance(other, Vec):
            return NotImplemented
        return self.x == other.x and self.y == other.y
v = Vec(1.0, 2.0)
print('v == v:', v == v)
print('1.0 == v:', 1.0 == v)
print('v == 1.0:', v == 1.0)
EOF
python3 foo.py
