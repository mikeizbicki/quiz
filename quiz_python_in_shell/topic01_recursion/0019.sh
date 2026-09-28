cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def foo(xs):
    if len(xs) == 10:
        return 1
    xs.append(1)
    return 2 * foo(xs)
try:
    print('foo([])=',foo([]))
except RuntimeError:
    print('StackOverflow')
EOF
python3 foo.py
