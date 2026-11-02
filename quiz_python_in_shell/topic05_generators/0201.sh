cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Countdown:
    def __init__(self, n):
        self.i = n
    def __iter__(self):
        return self
    def __next__(self):
        self.i -= 1
        return self.i + 1
try:
    print('start')
    print('list=', list(Countdown(3)))
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
