cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def g():
    for i in [1, 2, 3]:
        i
try:
    print('g()=', g())
    print('list(g())=', list(g()))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
