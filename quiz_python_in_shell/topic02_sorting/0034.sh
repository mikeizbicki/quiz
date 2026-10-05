cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [(3, 'c'), (7, 'a'), (3, 'a'), (8, 'd'), (7, 'z')]
print('sorted(xs)=',sorted(xs))
print('sorted(xs, key=lambda t: t[0])=',
      sorted(xs, key=lambda t: t[0]))
EOF
python3 foo.py
