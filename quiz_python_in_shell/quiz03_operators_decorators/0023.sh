cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass
class Vec:
    x: int
    y: int
    def __rmul__(self, other):
        if not isinstance(other, int):
            return NotImplemented
        return Vec(other * self.x, other * self.y)
try:
    z = 3 * Vec(1, 2)
    print('z=', z)
except TypeError:
    print('TypeError')
EOF
python3 foo.py
