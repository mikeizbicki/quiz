cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [3, 7, 1, 8, 5, 10, 2, 9, 4, 6]
print('sorted(xs)=',sorted(xs))
print('sorted(xs, reverse=True)=',sorted(xs, reverse=True))
print('sorted(xs, key=lambda x: -x)=',sorted(xs, key=lambda x: -x))
EOF
python3 foo.py
