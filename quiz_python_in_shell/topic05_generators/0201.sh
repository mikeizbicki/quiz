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
    sum = 0
    for x in Countdown(3):
        sum += x
    print('sum=', sum)
    print('list=', list(Countdown(3)))
except TypeError:
    print('TypeError')
except StopIteration:
    print('StopIteration')
except MemoryError:
    print('MemoryError')
EOF
python3 foo.py
