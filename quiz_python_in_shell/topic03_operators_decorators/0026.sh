cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass
class Vec:
    x: int
    y: int
    def __add__(self, other):
        return Vec(self.x + other.x, self.y + other.y)
    def __iadd__(self, other):
        self.x += other.x
        self.y += other.y
a = Vec(1, 2)
a += Vec(3, 4)
print('a =', a)
EOF
python3 foo.py
