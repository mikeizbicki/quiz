cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    if len(xs) == 0:
        return 0
    return xs[0] + foo(xs[1:]) + foo(xs[2:])
try:
    print('foo([1, 2, 3])=',foo([1, 2, 3]))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
