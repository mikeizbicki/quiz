cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __eq__(self, other):
        return self.x == other.x and self.y == other.y
a = Vec(1, 2)
b = Vec(1, 2)
c = a
print('a is b:', a is b)
print('a is c:', a is c)
print('a == b:', a == b)
print('c == a:', c == a)
print('256 is 256:', 256 is 256)
print('[] is []:', [] is [])
print('None is None:', None is None)
EOF
python3 foo.py
