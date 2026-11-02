cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [1, 2, 3, 4]
ys = [10, 20, 30]
try:
    print('map=', list(map(lambda a, b: a + b, xs, ys)))
    print('map2=', list(map(lambda a, b: a * b, xs, ys)))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
