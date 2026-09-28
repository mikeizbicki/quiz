cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    if len(xs) == 0:
        return 0
    ret = xs[0]
    ret += foo(xs[1:])
    ret += foo(xs[:-1])
    return ret
try:
    print('foo([1, 2, 3])=',foo([1, 2, 3]))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
