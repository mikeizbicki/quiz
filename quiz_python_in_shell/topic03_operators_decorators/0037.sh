cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass, FrozenInstanceError
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
try:
    B(1, 2).y = 10
except AttributeError as e:
    print('set y ->', type(e).__name__)
print('len({B(1, 2), B(1, 2)}):', len({B(1, 2), B(1, 2)}))
print('issubclass(FrozenInstanceError, AttributeError):',
      issubclass(FrozenInstanceError, AttributeError))
EOF
python3 foo.py
