cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    if len(xs) == 0:
        return 0
    def go(i):
        return xs[i] + go(i+1)
    return go(0)
try:
    print('foo([1, 2, 3, 4, 5])=',foo([1, 2, 3, 4, 5]))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
