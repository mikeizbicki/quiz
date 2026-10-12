cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass
class Vec:
    x: int
    y: int
    def __add__(self, other):
        if isinstance(other, Vec):
            return Vec(self.x + other.x, self.y + other.y)
        return Vec(self.x + other, self.y + other)
print('Vec(1, 2) + Vec(3, 4) =', Vec(1, 2) + Vec(3, 4))
print('Vec(1, 2) + 10 =', Vec(1, 2) + 10)
EOF
python3 foo.py
