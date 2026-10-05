cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = ['Banana', 'apple', 'Cherry', 'date', 'Fig']
print('sorted(xs)=',sorted(xs))
print('sorted(xs, key=str.lower)=',sorted(xs, key=str.lower))
EOF
python3 foo.py
