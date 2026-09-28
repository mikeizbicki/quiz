cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def sequential_search(xs, y):
    if len(xs) == 0:
        return False
    if xs[0] == y:
        return True
    return sequential_search(xs[1:], y)
try:
    print('sequential_search([1, 3, 5, 4, 2, 0], 2)=',sequential_search([1, 3, 5, 4, 2, 0], 2))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
