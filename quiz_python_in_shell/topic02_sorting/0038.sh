cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [('b', 2), ('a', 3), ('c', 1), ('a', 1), ('b', 1)]
zs = sorted(xs)
print('zs=', zs)
zs = sorted(xs, key=lambda t: (t[1], t[0]))
print('zs=', zs)
EOF
python3 foo.py
