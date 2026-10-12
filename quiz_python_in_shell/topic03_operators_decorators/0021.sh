cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass
class Vec:
    x: int
    y: int
try:
    print('Vec(1, 2) + Vec(3, 4) =', Vec(1, 2) + Vec(3, 4))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
