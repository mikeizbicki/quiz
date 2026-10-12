cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    def __init__(self, x):
        self.x = x
    def __eq__(self, other):
        return isinstance(other, A) and self.x == other.x
class B(A):
    pass
print('B(1) == B(1):', B(1) == B(1))
print('B(1) == A(1):', B(1) == A(1))
print('A(1) == B(1):', A(1) == B(1))
EOF
python3 foo.py
