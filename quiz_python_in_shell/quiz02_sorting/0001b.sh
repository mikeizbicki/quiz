cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    def go(i, acc):
        if i == len(xs):
            return acc
        if xs[i] % 2 == 0:
            return go(i+1, acc - xs[i])
        return go(i+1, acc + xs[i])
    return go(0, 0)
try:
    print('foo([1, 2, 3, 4, 5])=',foo([1, 2, 3, 4, 5]))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
