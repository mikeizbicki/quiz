cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import functools
def cmp(a, b):
    if len(a) != len(b):
        return len(b) - len(a)
    if a.lower() < b.lower():
        return -1
    if a.lower() > b.lower():
        return 1
    return 0
xs = ['banana', 'kiwi', 'apple', 'fig', 'cherry', 'date']
zs = sorted(xs, key=functools.cmp_to_key(cmp))
print('zs=', zs)
EOF
python3 foo.py
