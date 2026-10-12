cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
from dataclasses import dataclass, field
@dataclass
class Foo:
    xs: list = field(default_factory=list)
a = Foo()
b = Foo()
a.xs.append('A')
print('a.xs=', a.xs)
print('b.xs=', b.xs)
EOF
python3 foo.py
