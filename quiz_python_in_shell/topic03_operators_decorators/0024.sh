cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass
class Vec:
    x: int
    y: int
    def __add__(self, other):
        return Vec(self.x + other.x, self.y + other.y)
xs = [Vec(1, 2), Vec(3, 4), Vec(5, 6)]
try:
    print('sum(xs) =', sum(xs))
except TypeError:
    print('TypeError')
print('sum(xs, Vec(0, 0)) =', sum(xs, Vec(0, 0)))
EOF
python3 foo.py
