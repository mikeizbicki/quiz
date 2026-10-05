cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
import functools
def cmp(a, b):
    if a > b:
        return -1
    if a < b:
        return 1
    return 0
xs = [3, 7, 1, 8, 5, 10, 2, 9, 4, 6]
zs = sorted(xs, key=functools.cmp_to_key(cmp))
print('zs=', zs)
EOF
python3 foo.py
