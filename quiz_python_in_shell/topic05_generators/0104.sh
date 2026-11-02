cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def small():
    yield 'a'
    yield 'b'

def take(g, n):
    for _ in range(n):
        yield next(g)
try:
    print('take2=', list(take(small(), 2)))
    print('take3=', list(take(small(), 3)))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
