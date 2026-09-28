cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def trinary_search(xs, y):
    if len(xs) == 0:
        return False
    mid1 = len(xs) // 3
    mid2 = 2 * len(xs) // 3
    if xs[mid1] >= y:
        return True
    if xs[mid2] >= y:
        return True
    if y < xs[mid1]:
        return trinary_search(xs[:mid1], y)
    if y < xs[mid2]:
        return trinary_search(xs[mid1+1:mid2], y)
    return trinary_search(xs[mid2+1:], y)
try:
    xs = [1, 3, 5, 7, 9, 11]
    print('trinary_search(xs, 2)=',trinary_search(xs, 2))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
