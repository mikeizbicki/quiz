cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import functools
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __eq__(self, other):
        return self.x == other.x and self.y == other.y
@functools.lru_cache
def f(v):
    return v.x + v.y
try:
    print('f(Vec(1, 2))=', f(Vec(1, 2)))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
