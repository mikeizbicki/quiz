cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [(3, 'c'), (7, 'a'), (3, 'a'), (8, 'd'), (7, 'z')]
zs = sorted(xs)
print('zs=', zs)
zs = sorted(xs, key=lambda t: t[0])
print('zs=', zs)
EOF
python3 foo.py
