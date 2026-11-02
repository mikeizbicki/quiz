cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def nats():
    i = 0
    while True:
        yield i
        i += 1

def take(g, n):
    for _ in range(n):
        yield next(g)
try:
    g = nats()
    print('take=', list(take(g, 3)))
    print('next(g)=', next(g))
except StopIteration:
    print('StopIteration')
EOF
python3 foo.py
