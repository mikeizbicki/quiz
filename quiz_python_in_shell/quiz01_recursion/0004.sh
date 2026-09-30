cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def sum_even(xs):
    return xs[0] + sum_odd(xs[1:])

def sum_odd(xs):
    return xs[0] + sum_even(xs[1:])
try:
    xs = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    print('sum_even(xs)=',sum_even(xs))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
