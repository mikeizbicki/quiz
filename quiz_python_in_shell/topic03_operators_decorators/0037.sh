cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass(frozen=True)
class A:
    x: int
@dataclass(frozen=True)
class B(A):
    y: int
try:
    B(1, 2).x = 10
except AttributeError as e:
    print('set x ->', type(e).__name__)
EOF
python3 foo.py
