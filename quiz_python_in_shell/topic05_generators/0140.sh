cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import itertools
try:
    print('islice=', list(itertools.islice(itertools.count(0, 2), 5)))
    print('sum=', sum(itertools.islice(itertools.count(1, 3), 4)))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
