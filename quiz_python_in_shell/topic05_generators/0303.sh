cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Range:
    def __init__(self, start, stop, step=1):
        self.start = start
        self.stop = stop
        self.step = step
    def __iter__(self):
        i = self.start
        while i < self.stop:
            yield i
            i += self.step

class RangeGen:
    def __init__(self, start, stop, step=1):
        self.gen = (i for i in range(start, stop, step))
    def __iter__(self):
        return self.gen
try:
    r1 = Range(0, 4)
    print('r1 twice=', list(r1), list(r1))
    r2 = RangeGen(0, 4)
    print('r2 twice=', list(r2), list(r2))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
