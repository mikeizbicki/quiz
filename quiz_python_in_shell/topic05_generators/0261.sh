cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import itertools
def fib():
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b
try:
    print('sum=', sum(itertools.islice(map(lambda x: x * x, fib()), 4)))
    print('list=', list(itertools.islice(map(lambda x: 2 * x, fib()), 6)))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
