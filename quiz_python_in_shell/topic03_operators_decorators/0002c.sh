cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def norm2(self):
        return self.x ** 2 + self.y ** 2
class B(A):
    def __init__(self, x, y, z):
        self.x = x
        self.z = z
try:
    print('B(3, 4, 5).norm2()=', B(3, 4, 5).norm2())
except AttributeError:
    print('AttributeError')
EOF
python3 foo.py
