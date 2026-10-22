cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    return foo(xs)
try:
    foo([1, 2, 3])
except RuntimeError:
    print('RuntimeError')
except RecursionError:
    print('RecursionError')
EOF
python3 foo.py
