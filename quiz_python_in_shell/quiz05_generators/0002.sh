cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [1, 2, 3]
try:
    ys = map(lambda x: x * x, xs)
    print('list=', list(ys))
    print('len=', len(list(ys)))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
