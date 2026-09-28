cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def sequential_search_go(xs, y):
    def go(i):
        if i == len(xs):
            return False
        if xs[i] == y:
            return True
        return go(i+1)
    return go(0)
try:
    xs = [1, 3, 5, 4, 2, 0]
    print('sequential_search_go(xs, 2)=',sequential_search_go(xs, 2))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
