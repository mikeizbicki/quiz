cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = ['banana', 'kiwi', 'fig', 'cherry', 'date', 'apple']
zs = sorted(xs, key=lambda w: (len(w), w))
print('sorted(xs, key=lambda w: (len(w), w))=', zs)
EOF
python3 foo.py
