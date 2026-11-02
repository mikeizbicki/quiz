cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import itertools
try:
    print('a=', list(itertools.islice(itertools.chain([1, 2, 3], itertools.count(0)), 6)))
    print('b=', sum(itertools.islice(itertools.chain([1, 2, 3], itertools.count(0)), 5)))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
