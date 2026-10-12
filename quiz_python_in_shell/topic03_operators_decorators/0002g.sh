cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    def __init__(self, x):
        self.x = x
        print('A.__init__')
class B(A):
    def __init__(self, x):
        super().__init__(x)
        print('B.__init__')
class C(B):
    def __init__(self, x):
        super().__init__(x)
        print('C.__init__')
c = C(1)
print('c.x=', c.x)
EOF
python3 foo.py
