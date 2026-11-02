cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import itertools
try:
    print('islice=', list(itertools.islice(itertools.count(1, 2), 5)))
    print('sum=', sum(itertools.islice(itertools.count(0, 3), 4)))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
