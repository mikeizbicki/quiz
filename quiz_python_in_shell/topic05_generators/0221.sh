cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def countdown(n):
    for i in range(n, 0, -1):
        yield i

class CountdownIter:
    def __init__(self, n):
        self.i = n
    def __iter__(self):
        return self
    def __next__(self):
        if self.i <= 0:
            raise StopIteration
        self.i -= 1
        return self.i + 1

class Countdown:
    def __init__(self, n):
        self.n = n
    def __iter__(self):
        return CountdownIter(self.n)
try:
    c1 = countdown(3)
    print('iter(c1) is c1:', iter(c1) is c1)
    c2 = Countdown(3)
    print('iter(c2) is c2:', iter(c2) is c2)
except StopIteration:
    print('StopIteration')
EOF
python3 foo.py
