cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    ret = foo(xs[1:-1]) + xs[-1]
    if len(xs) == 2:
        return 0
    return ret
try:
    print('foo([1, 2, 3, 4, 5])=',foo([1, 2, 3, 4, 5]))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
