cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
def countdown(n):
    for i in range(n, 0, -1):
        yield i

class Range:
    def __init__(self, start, stop):
        self.start = start
        self.stop = stop
    def __iter__(self):
        i = self.start
        while i < self.stop:
            yield i
            i += 1
try:
    g = countdown(5)
    print('g: sum=', sum(g), 'then list=', list(g))
    r = Range(0, 5)
    print('r: sum=', sum(r), 'then list=', list(r))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
