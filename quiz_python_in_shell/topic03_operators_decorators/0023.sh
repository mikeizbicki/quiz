cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass
class Vec:
    x: int
    y: int
    def __mul__(self, other):
        return Vec(self.x * other, self.y * other)
print('Vec(1, 2) * 3 =', Vec(1, 2) * 3)
try:
    print('3 * Vec(1, 2) =', 3 * Vec(1, 2))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
