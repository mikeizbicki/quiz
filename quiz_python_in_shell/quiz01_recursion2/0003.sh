cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    if len(xs) == 0:
        return 0
    return xs[0] + foo(xs[1:]) + foo(xs[2:]) + foo(xs[3:])
try:
    print('foo([1, 2, 3, 4])=',foo([1, 2, 3, 4]))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
