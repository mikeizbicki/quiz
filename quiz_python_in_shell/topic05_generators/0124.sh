cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
xs = [0, 1, '', 'a', [], [1], None, False]
try:
    print('filter=', list(filter(None, xs)))
    print('count=', len(list(filter(None, xs))))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
