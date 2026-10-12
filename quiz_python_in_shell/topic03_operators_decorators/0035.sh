cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass
@dataclass
class A:
    x: int
    y: int
@dataclass
class B(A):
    z: int
print('A(1, 2) == B(1, 2, 3):', A(1, 2) == B(1, 2, 3))
EOF
python3 foo.py
