cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [3, 7, 1, 8, 5, 10, 2, 9, 4, 6]
ys = xs.sort()
print('xs=',xs)
print('ys=',ys)
EOF
python3 foo.py
