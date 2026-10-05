cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [3, 7, 1, 8, 5, 10, 2, 9, 4, 6]
def parity(x):
    return x % 2
print('sorted(xs, key=parity)=',sorted(xs, key=parity))
print('sorted(xs, key=lambda x: (x % 2, x))=',sorted(xs, key=lambda x: (x % 2, x)))
EOF
python3 foo.py
