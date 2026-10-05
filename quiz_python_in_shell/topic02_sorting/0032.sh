cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = ['banana', 'kiwi', 'apple', 'fig', 'cherry', 'date']
zs = sorted(xs, key=len)
print('zs=', zs)
zs = sorted(xs)
print('zs=', zs)
EOF
python3 foo.py
