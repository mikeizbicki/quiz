cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = ['banana', 'kiwi', 'apple', 'fig', 'cherry', 'date']
print('sorted(xs, key=len)=',sorted(xs, key=len))
print('sorted(xs)=',sorted(xs))
EOF
python3 foo.py
