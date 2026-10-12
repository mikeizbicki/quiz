cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    def __init__(self, xs):
        self.xs = xs
class B(A):
    def __init__(self, x):
        self.x = x
try:
    b = B(5)
    print('b.xs=', b.xs)
except AttributeError:
    print('AttributeError')
EOF
python3 foo.py
