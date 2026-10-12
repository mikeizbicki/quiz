cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class A:
    pass
class B(A):
    pass
print('issubclass(B, A):', issubclass(B, A))
print('issubclass(A, B):', issubclass(A, B))
print('issubclass(B, B):', issubclass(B, B))
EOF
python3 foo.py
