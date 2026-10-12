cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
try:
    xs = [1, 2, 3]
    print('xs[10]=', xs[10])
except LookupError:
    print('LookupError')
try:
    d = {'a': 1}
    print('d[b]=', d['b'])
except LookupError:
    print('LookupError')
EOF
python3 foo.py
