cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    pass
class B(A):
    pass
b = B()
print('type(b) is A:', type(b) is A)
print('type(b) is B:', type(b) is B)
print('isinstance(b, A):', isinstance(b, A))
EOF
python3 foo.py
