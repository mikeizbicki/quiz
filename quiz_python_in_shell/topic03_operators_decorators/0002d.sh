cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    def f(self):
        return 'A.f'
class B(A):
    def f(self):
        return 'B.f'
b = B()
print('b.f()=', b.f())
print('A.f(b)=', A.f(b))
EOF
python3 foo.py
