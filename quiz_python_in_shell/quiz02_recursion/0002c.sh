cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [('b', 3), ('a', 1), ('c', 3), ('a', 3), ('b', 1)]
zs = sorted(xs, key=lambda t: (t[1], t[0]))
print('sorted(xs, key=lambda t: (t[1], t[0]))=', zs)
EOF
python3 foo.py
