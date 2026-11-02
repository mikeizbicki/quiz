cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def g():
    return
    yield 1
try:
    print('list(g())=', list(g()))
    print('sum(g())=', sum(g()))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
