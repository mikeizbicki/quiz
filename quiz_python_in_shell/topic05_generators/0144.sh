cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import itertools
try:
    print('start')
    print('list=', list(itertools.cycle([1, 2, 3])))
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
