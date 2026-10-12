cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass
class Vec:
    x: int
    y: int
@dataclass
class Vec3(Vec):
    z: int
v = Vec3(1, 2, 3)
print('v =', v)
print('v.x =', v.x)
EOF
python3 foo.py
