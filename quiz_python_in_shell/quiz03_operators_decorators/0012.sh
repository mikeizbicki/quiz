cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
a = Vec(1, 2)
b = Vec(1, 2)
try:
    print('a == b:', a == b)
except TypeError:
    print('TypeError')
EOF
python3 foo.py
