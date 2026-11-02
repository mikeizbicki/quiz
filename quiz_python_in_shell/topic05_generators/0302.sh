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
            i += self.step + 1
try:
    print('list=', list(Range(0, 10, 3)))
    print('sum=', sum(Range(0, 10, 3)))
except TypeError:
    print('TypeError')
EOF
python3 foo.py
