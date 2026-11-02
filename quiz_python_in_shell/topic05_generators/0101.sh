cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def nats():
    i = 0
    while True:
        yield i
        i += 1

def take(g, n):
    for _ in range(n - 1):
        yield next(g)
try:
    print('list(t)=', list(take(nats(), 5)))
    print('sum(t)=', sum(take(nats(), 4)))
except StopIteration:
    print('StopIteration')
EOF
python3 foo.py
