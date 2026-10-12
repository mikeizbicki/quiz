cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    pass
class B(A):
    pass
a = A()
b = B()
print('isinstance(b, A):', isinstance(b, A))
print('isinstance(b, B):', isinstance(b, B))
print('isinstance(a, B):', isinstance(a, B))
EOF
python3 foo.py
