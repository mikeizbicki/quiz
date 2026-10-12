cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass
class VecA:
    x: int
    y: int
@dataclass(frozen=True)
class VecB:
    x: int
    y: int
try:
    hash(VecA(1, 2))
    print('hash(VecA) works')
except TypeError:
    print('TypeError for VecA')
try:
    hash(VecB(1, 2))
    print('hash(VecB) works')
except TypeError:
    print('TypeError for VecB')
EOF
python3 foo.py
