cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass(frozen=True)
class Vec:
    x: int
    y: int
a = Vec(1, 2)
b = Vec(1, 2)
print('a == b:', a == b)
print('len({a, b}):', len({a, b}))
try:
    a.x = 5
    print('a.x =', a.x)
except Exception as e:
    print(type(e).__name__)
EOF
python3 foo.py
