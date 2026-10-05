cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [(3, 'c'), (7, 'a'), (1, 'b'), (8, 'd')]
zs = sorted(xs, key=lambda t: t[-1])
print('zs=', zs)
zs = sorted(xs)
print('zs=', zs)
EOF
python3 foo.py
