cd; rm -rf quiz; mkdir quiz; cd quiz
cat > foo.py <<EOF
class Vec:
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __lt__(self, other):
        if not isinstance(other, Vec):
            return NotImplemented
        return (self.x, self.y) < (other.x, other.y)
    def __gt__(self, other):
        if not isinstance(other, Vec):
            return NotImplemented
        return (self.x, self.y) > (other.x, other.y)
v = Vec(1, 2)
print('v > Vec(0, 0):', v > Vec(0, 0))
print('v < Vec(2, 2):', v < Vec(2, 2))
try:
    print('v > 5:', v > 5)
except TypeError:
    print('TypeError')
EOF
python3 foo.py
