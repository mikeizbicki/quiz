cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import functools
class A:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __eq__(self, other):
        return (self.x, self.y) == (other.x, other.y)
    def __hash__(self):
        return hash((self.x, self.y))
class B(A):
    def __eq__(self, other):
        return (self.x, self.y) == (other.x, other.y)
@functools.lru_cache
def f(v):
    return v.x + v.y
print('A.__hash__ is None:', A.__hash__ is None)
print('B.__hash__ is None:', B.__hash__ is None)
print('f(A(1, 2)):', f(A(1, 2)))
try:
    print('f(B(1, 2)):', f(B(1, 2)))
except TypeError:
    print('f(B(1, 2)): TypeError')
print('issubclass(B, A):', issubclass(B, A))
EOF
python3 foo.py
