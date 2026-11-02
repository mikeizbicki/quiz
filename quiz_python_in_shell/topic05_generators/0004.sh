cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def countdown(n):
    for i in range(n + 1, 0, -1):
        yield i
try:
    print('list(countdown(3))=', list(countdown(3)))
    print('sum(countdown(3))=', sum(countdown(3)))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
