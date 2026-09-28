cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def binary_search_go(xs, y):
    def go(lo, hi):
        if lo > hi:
            return False
        mid = (lo + hi) // 2
        if xs[mid] >= y:
            return go(lo, mid - 1)
        return go(mid + 1, hi)
    return go(0, len(xs) - 1)
try:
    xs = [1, 3, 5, 7, 9]
    print('binary_search_go(xs, 7)=',binary_search_go(xs, 7))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
