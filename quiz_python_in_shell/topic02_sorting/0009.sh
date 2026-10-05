cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def merge_sorted3(xs):
    if len(xs) <= 1:
        return xs
    mid1 = len(xs) // 3
    mid2 = 2 * len(xs) // 3
    return merged(
        merged(merge_sorted3(xs[:mid1]),
               merge_sorted3(xs[mid1:mid2])),
        merge_sorted3(xs[mid2:]))

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
    zs = merge_sorted3(xs)
    print('zs=', zs)
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
