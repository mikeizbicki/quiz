cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    pass
class B(A):
    def f(self):
        return 'B.f'
class C(B):
    pass
print('C().f()=', C().f())
print('mro=', [cls.__name__ for cls in C.__mro__])
EOF
python3 foo.py
