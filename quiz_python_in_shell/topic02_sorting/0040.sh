cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import functools
def cmp(a, b):
    if len(a) != len(b):
        return len(a) - len(b)
    if a < b:
        return -1
    return 1 if a > b else 0
xs = ['banana', 'kiwi', 'apple', 'fig', 'cherry', 'date']
zs = sorted(xs, key=functools.cmp_to_key(cmp))
print('zs=', zs)
EOF
python3 foo.py
