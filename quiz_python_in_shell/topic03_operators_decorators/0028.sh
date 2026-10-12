cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import functools
from dataclasses import dataclass
@functools.total_ordering
@dataclass
class Vec:
    x: int
    y: int
    def __lt__(self, other):
        return (self.x, self.y) < (other.x, other.y)
a = Vec(1, 2)
b = Vec(3, 4)
print('a < b:', a < b)
print('a >= b:', a >= b)
print('a <= b:', a <= b)
print('a > b:', a > b)
EOF
python3 foo.py
