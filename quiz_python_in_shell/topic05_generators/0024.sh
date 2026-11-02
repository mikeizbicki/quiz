cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def nats():
    i = 0
    while True:
        yield i
        i += 1
try:
    print('start')
    print('list=', list(nats()))
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
