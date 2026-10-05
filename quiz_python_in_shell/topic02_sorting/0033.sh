cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = ['Banana', 'apple', 'Cherry', 'date', 'Fig']
zs = sorted(xs)
print('zs=', zs)
zs = sorted(xs, key=str.lower)
print('zs=', zs)
EOF
python3 foo.py
