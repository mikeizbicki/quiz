cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def countdown(n):
    for i in range(n, 0, -1):
        yield i
try:
    print('list(countdown(5))=', list(countdown(5)))
    print('sum(countdown(5))=', sum(countdown(5)))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
