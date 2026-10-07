cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = ['kiwi', 'fig', 'cherry', 'banana', 'date', 'apple']
zs = list(sorted(xs, key=lambda w: len(w)))
print('zs=', zs)
EOF
python3 foo.py
