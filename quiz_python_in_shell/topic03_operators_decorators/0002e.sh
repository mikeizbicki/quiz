cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    def f(self):
        return 'A'
class B(A):
    def f(self):
        return 'B+' + super().f()
class C(B):
    def f(self):
        return 'C+' + super().f()
print('C().f()=', C().f())
EOF
python3 foo.py
