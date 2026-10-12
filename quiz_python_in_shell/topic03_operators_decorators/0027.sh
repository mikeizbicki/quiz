cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass
class Vec:
    x: int
    y: int
    def __lt__(self, other):
        return (self.x, self.y) < (other.x, other.y)
a = Vec(1, 2)
b = Vec(3, 4)
print('a < b:', a < b)
try:
    print('a >= b:', a >= b)
except TypeError:
    print('TypeError')
EOF
python3 foo.py
