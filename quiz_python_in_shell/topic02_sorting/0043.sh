cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [3, 7, 1, 8, 5, 10, 2, 9, 4, 6]
xs.sort(key=lambda x: x % 3)
print('xs=',xs)
print('sorted(xs)=',sorted(xs))
EOF
python3 foo.py
