cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
a = Vec(1, 2)
b = Vec(1, 2)
print('a == b:', a == b)
print('a == a:', a == a)
print('hash(a) == hash(b):', hash(a) == hash(b))
EOF
python3 foo.py
