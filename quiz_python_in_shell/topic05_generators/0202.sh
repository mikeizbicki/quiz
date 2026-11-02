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
        return self.i
try:
    print('list=', list(Countdown(3)))
    print('sum=', sum(Countdown(3)))
except StopIteration:
    print('StopIteration')
EOF
python3 foo.py
