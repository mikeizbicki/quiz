cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    return foo(xs[1:]) + xs[0]
try:
    print('foo([1, 2, 3, 4, 5])=',foo([1, 2, 3, 4, 5]))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
