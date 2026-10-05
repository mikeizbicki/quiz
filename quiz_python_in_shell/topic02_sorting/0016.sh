cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def quick_sorted(xs):
    if len(xs) <= 1:
        return xs
    pivot = xs[-1]
    smaller = [x for x in xs if x <= pivot]
    larger  = [x for x in xs if x > pivot]
    return quick_sorted(smaller) + quick_sorted(larger)

xs = [3, 7, 1, 8, 5, 10, 2, 9, 4, 6]
try:
    zs = quick_sorted(xs)
    print('zs=', zs)
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
