cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    return foo(xs)
try:
    foo([])
except RecursionError:
    print('RecursionError')
except RuntimeError:
    print('RuntimeError')
EOF
python3 foo.py
