cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [('b', 2), ('a', 3), ('c', 1), ('a', 1), ('b', 1)]
print('sorted(xs)=',sorted(xs))
print('sorted(xs, key=lambda t: (t[1], t[0]))=',
      sorted(xs, key=lambda t: (t[1], t[0])))
EOF
python3 foo.py
