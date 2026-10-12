cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass
class Vec:
    x: int
    y: int
a = Vec(1, 2)
b = Vec(1, 2)
print('a =', a)
print('a == b:', a == b)
try:
    print('hash(a):', hash(a))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
