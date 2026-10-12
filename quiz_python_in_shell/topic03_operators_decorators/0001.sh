cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    pass
class B(A):
    def __init__(self, x):
        self.x = x
try:
    b = B(5)
    print('b.x=', b.x)
except AttributeError:
    print('AttributeError')
EOF
python3 foo.py
