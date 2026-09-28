cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    def go(i):
        if i == -1:
            return 0
        return xs[i] + go(i-1)
    return go(len(xs)-1)
try:
    print('foo([1, 2, 3, 4, 5])=',foo([1, 2, 3, 4, 5]))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
