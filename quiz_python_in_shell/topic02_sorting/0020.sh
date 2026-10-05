cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def quick_select(xs, k):
    if len(xs) == 1:
        return xs[0]
    mid = len(xs) // 2
    pivot = xs[mid]
    smaller = [x for x in xs if x < pivot]
    equal   = [x for x in xs if x == pivot]
    larger  = [x for x in xs if x > pivot]
    if k < len(smaller):
        return quick_select(smaller, k)
    if k < len(smaller) + len(equal):
        return pivot
    return quick_select(larger, k - len(smaller) - len(equal))

xs = [3, 7, 1, 8, 5, 10, 2, 9, 4, 6]
try:
    print('quick_select(xs, 0)=',quick_select(xs, 0))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
