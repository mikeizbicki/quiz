cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def trinary_search_go(xs, y):
    def go(lo, hi):
        if lo > hi:
            return False
        mid1 = lo + (hi - lo) // 3
        mid2 = lo + 2 * (hi - lo) // 3
        if xs[mid1] == y:
            return True
        if xs[mid2] == y:
            return True
        if y < xs[mid1]:
            return go(lo, mid1 - 1)
        if y < xs[mid2]:
            return go(mid1 + 1, mid2 - 1)
        return go(mid2 + 1, hi)
    return go(0, len(xs) - 1)
try:
    xs = [1, 3, 5, 7, 9, 11]
    print('trinary_search_go(xs, 7)=',trinary_search_go(xs, 7))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
