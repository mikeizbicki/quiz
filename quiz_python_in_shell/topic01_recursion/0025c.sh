cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def binary_search(xs, y):
    if len(xs) == 0:
        return False
    mid = len(xs) // 2
    if xs[mid] > y:
        return binary_search(xs[:mid], y)
    if xs[mid] < y:
        return binary_search(xs[mid:], y)
    return True
try:
    xs = [1, 3, 5, 7, 9]
    print('binary_search(xs, 11)=',binary_search(xs, 11))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
