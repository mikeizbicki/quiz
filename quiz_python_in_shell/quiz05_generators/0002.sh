cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [0.0, '0', [], [0], None, 3, '', -1]
try:
    print('filter=', list(filter(None, xs)))
    print('count=', len(list(filter(None, xs))))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
