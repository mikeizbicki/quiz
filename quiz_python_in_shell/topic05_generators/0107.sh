cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def countdown(n):
    for i in range(n, 0, -1):
        yield i
try:
    print('list(countdown(3))=', list(countdown(3)))
    print('next(countdown(0))=', next(countdown(0)))
except StopIteration:
    print('StopIteration')
EOF
python3 foo.py
