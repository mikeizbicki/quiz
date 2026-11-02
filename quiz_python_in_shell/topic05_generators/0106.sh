cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def g():
    yield 1
    yield 2
    yield 3
try:
    it = g()
    print('next(it)=', next(it))
    print('list(it)=', list(it))
except StopIteration:
    print('StopIteration')
EOF
python3 foo.py
