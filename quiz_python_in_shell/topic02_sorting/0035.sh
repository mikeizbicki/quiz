cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [(3, 'c'), (7, 'a'), (1, 'b'), (8, 'd')]
print('sorted(xs, key=lambda t: t[-1])=',
      sorted(xs, key=lambda t: t[-1]))
print('sorted(xs)=',sorted(xs))
EOF
python3 foo.py
