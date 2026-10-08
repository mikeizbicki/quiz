cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def binary_search(xs, y):
    def go(lo, hi):
        if lo > hi:
            return False
        mid = (lo + hi) // 2
        if xs[mid] > y:
            return go(lo, mid)
        if xs[mid] < y:
            return go(mid, hi)
        return True
    return go(0, len(xs) - 1)
try:
    xs = [1, 3, 5, 7, 9]
    print('binary_search(xs, 9)=',binary_search(xs, 9))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
