cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    return foo(xs)
try:
    foo([])
except RuntimeError:
    print('RuntimeError')
except RecursionError:
    print('RecursionError')
EOF
python3 foo.py
