cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    if len(xs) == 0:
        return 0
    ret = foo(xs[1:])
    return xs[0] + ret * 3
try:
    xs = [1, 2, 3, 4, 5]
    print('foo(xs)=',foo(xs))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
