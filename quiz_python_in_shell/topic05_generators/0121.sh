cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def g():
    yield 1
    yield 2
    yield 3
    yield 4
try:
    it1 = g()
    print('zip2=', list(zip(it1, it1)))
    it2 = g()
    print('zip3=', list(zip(it2, it2, it2)))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
