cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass
class A:
    x: int
    y: int
@dataclass
class B(A):
    z: int
class P:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __eq__(self, other):
        return isinstance(other, P) and (self.x, self.y) == (other.x, other.y)
class Q(P):
    def __init__(self, x, y, z):
        super().__init__(x, y)
        self.z = z
print('A(1, 2) == B(1, 2, 3):', A(1, 2) == B(1, 2, 3))
print('P(1, 2) == Q(1, 2, 3):', P(1, 2) == Q(1, 2, 3))
print('Q(1, 2, 3) == P(1, 2):', Q(1, 2, 3) == P(1, 2))
EOF
python3 foo.py
