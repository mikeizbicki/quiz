cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
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
    c = Countdown(3)
    print('a=', list(c))
    print('b=', sum(c))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
