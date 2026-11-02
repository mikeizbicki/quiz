cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import itertools
try:
    it = itertools.chain([1, 2, 3], [4, 5, 6])
    print('first=', list(itertools.islice(it, 4)))
    print('rest=', list(it))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
