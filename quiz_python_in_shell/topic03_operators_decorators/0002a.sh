cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    def __init__(self, x):
        self.x = x
class B(A):
    def double(self):
        return 2 * self.x
b = B(5)
print('b.x=', b.x)
print('b.double()=', b.double())
EOF
python3 foo.py
