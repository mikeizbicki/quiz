cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import functools
@functools.lru_cache
def f(xs):
    return sum(xs)
try:
    print('f([1, 2, 3])=', f([1, 2, 3]))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
