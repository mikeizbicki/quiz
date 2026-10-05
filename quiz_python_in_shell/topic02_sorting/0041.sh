cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [3, 7, 1, 8, 5, 10, 2, 9, 4, 6]
zs = sorted(xs)
print('zs=', zs)
zs = sorted(xs, reverse=True)
print('zs=', zs)
zs = sorted(xs, key=lambda x: -x)
print('zs=', zs)
EOF
python3 foo.py
