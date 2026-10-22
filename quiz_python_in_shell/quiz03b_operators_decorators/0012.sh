cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __eq__(self, other):
        return self.y == other.y
a = Vec(1, 2)
b = Vec(3, 2)
try:
    print('a == b:', a == b)
except TypeError:
    print('TypeError')
EOF
python3 foo.py
