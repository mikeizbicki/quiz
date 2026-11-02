cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def take(g, n):
    for _ in range(n):
        yield next(g)
try:
    print('a=', list(take(map(lambda x: x * x, [1, 2, 3, 4]), 2)))
    print('b=', sum(take(map(lambda x: x + 1, [1, 2, 3, 4]), 3)))
except StopIteration:
    print('StopIteration')
EOF
python3 foo.py
