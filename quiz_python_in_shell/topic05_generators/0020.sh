cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def nats():
    i = 0
    while True:
        yield i
        i += 1
try:
    it = nats()
    print('next(it)=', next(it))
    print('next(it)=', next(it))
except StopIteration:
    print('StopIteration')
EOF
python3 foo.py
