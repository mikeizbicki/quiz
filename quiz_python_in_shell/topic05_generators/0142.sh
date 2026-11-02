cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import itertools
try:
    print('cycle=', list(itertools.islice(itertools.cycle([1, 2, 3]), 7)))
    print('sum=', sum(itertools.islice(itertools.cycle([4, 5]), 5)))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
