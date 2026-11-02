cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def fib():
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b
try:
    it = fib()
    xs = [next(it) for _ in range(6)]
    print('first3=', xs[:3])
    print('last3=', xs[3:])
except StopIteration:
    print('StopIteration')
EOF
python3 foo.py
