cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    def go(i, acc):
        if len(xs) <= i:
            return acc
        ret = 0
        ret += go(i+1, acc + xs[i])
        ret += go(i+1, acc + xs[i])
        return ret
    return go(0, 0)
try:
    print('foo([1, 2, 3])=',foo([1, 2, 3]))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
