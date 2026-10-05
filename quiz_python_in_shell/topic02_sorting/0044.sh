cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [3, 7, 1, 8, 5, 10, 2, 9, 4, 6]
def parity(x):
    return x % 2
zs = sorted(xs, key=parity)
print('zs=', zs)
zs = sorted(xs, key=lambda x: (x % 2, x))
print('zs=', zs)
EOF
python3 foo.py
