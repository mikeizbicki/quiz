cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Range:
    def __init__(self, start, stop, step=1):
        self.start = start
        self.stop = stop
        self.step = step

    def __len__(self):
        return max(0, -((self.start - self.stop) // self.step))

    def __contains__(self, x):
        if (x - self.start) % self.step != 0:
            return False
        return 0 <= (x - self.start) // self.step < len(self)

    def __getitem__(self, i):
        n = len(self)
        if i < 0:
            i += n
        if i < 0 or i >= n:
            raise IndexError(i)
        return self.start + self.step * i

try:
    r = Range(10, 0, -2)
    n = len(r)
    print('n =', n)
    x = r[3]
    print('x =', x)
except ValueError:
    print('ValueError')
except TypeError:
    print('TypeError')
EOF
python3 foo.py
