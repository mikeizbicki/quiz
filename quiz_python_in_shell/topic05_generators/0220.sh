cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Countdown:
    def __init__(self, n):
        self.i = n
    def __iter__(self):
        return self
    def __next__(self):
        if self.i <= 0:
            raise StopIteration
        self.i -= 1
        return self.i + 1
try:
    c = Countdown(3)
    it = iter(c)
    print('next=', next(it))
    print('rest=', list(it))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
