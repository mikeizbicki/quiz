cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [1, 2, 3, 4]
ys = ['a', 'b', 'c']
try:
    print('zip(xs, ys)=', list(zip(xs, ys)))
    print('zip(ys, xs)=', list(zip(ys, xs)))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
