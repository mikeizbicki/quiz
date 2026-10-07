cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    if len(xs) <= 1:
        return len(xs)
    return foo(xs[1:]) + foo(xs[:-1])
try:
    print('foo([1, 2, 3, 4])=',foo([1, 2, 3, 4]))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
