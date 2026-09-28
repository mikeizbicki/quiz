cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def binary_search(xs, y):
    if len(xs) == 0:
        return False
    mid = len(xs) // 2
    if xs[mid] > y:
        return binary_search(xs[:mid-1], y)
    if xs[mid] < y:
        return binary_search(xs[mid+1:], y)
    return True
try:
    print('binary_search([1, 3, 5, 7, 9], 3)=',binary_search([1, 3, 5, 7, 9], 3))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
