cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def merge_sorted(xs):
    def go(lo, hi):
        if hi - lo <= 1:
            return xs[lo:hi]
        mid = (lo + hi) // 2
        return merged(go(lo, mid), go(mid, hi))
    return go(0, len(xs))

def merged(xs, ys):
    out = []
    i = 0
    j = 0
    while i < len(xs) and j < len(ys):
        if xs[i] <= ys[j]:
            out.append(xs[i])
            i += 1
        else:
            out.append(ys[j])
            j += 1
    out += xs[i:]
    out += ys[j:]
    return out

xs = [3, 7, 1, 8, 5, 10, 2, 9, 4, 6]
try:
    print('merge_sorted(xs)=',merge_sorted(xs))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
