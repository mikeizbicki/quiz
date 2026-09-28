cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def sum_even(xs):
    if len(xs) == 0:
        return 0
    return xs[0] + sum_odd(xs[1:])

def sum_odd(xs):
    if len(xs) == 0:
        return 0
    return xs[0] + sum_even(xs[1:])
try:
    print('sum_even([1, 2, 3, 4, 5])=',sum_even([1, 2, 3, 4, 5]))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
