cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import itertools
def nats():
    i = 0
    while True:
        yield i
        i += 1
try:
    print('evens=', list(itertools.islice(filter(lambda x: x % 2 == 0, nats()), 5)))
    print('threes=', list(itertools.islice(filter(lambda x: x % 3 == 0, nats()), 5)))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
